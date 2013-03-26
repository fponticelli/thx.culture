package thx.culture;

class Format 
{
	static var _re = new EReg("[{](\\d+)(?::[^}]*)?[}]", "m");
	static var _reSplitWC = ~/(\r\n|\n\r|\n|\r)/g;
	static var _reReduceWS = ~/\s+/;
#if !php
	static var _reStripTags = ~/(<[a-z]+[^>\/]*\/?>|<\/[a-z]+>)/i;
#end

	static var _reFormat = ~/{(\d+)(?::([a-zA-Z]+))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?}/m;
	/**
	* Take a formatString pattern and replaces the placeholders with the value contained in values.
	* The culture parameter is needed for proper localization of numeric and formatDate values.
	* Placeholders follows this schema:
<pre>
{pos[:format][,param]*}
</pre>
	* <em>pos</em> is the position in the array
	* <em>format</em> is a formatString sequence that identifies a specific value format (see below)
	* <em>param</em> is one or more optional parameters specific to certain format values.
	*
	* <pre>
Numeric Formats
---------------
D (default) Decimal format. The default number of decimals is set by culture. This value can overriden
            using the length parameter.
I           Integer format.
C           Currency format. The default number of decimals is set by culture. This value can overriden
            using the length parameter. The symbol can be overridden appending a formatString value after C
			Ei. "{0:C,3,USD}" will prformatInt something like "USD2.000" instead of "$2.00"
P           Percent format.
M           Permille format.

Date Formats
---------------
D (default) Date format.
DS          Short Date format.
DST         Short Date / long time format.
DSTS        Short Date / short time format.
DT          Long Date / long time format.
DTS         Long Date / short time format.
Y           Year format.
YM          Year Month format.
M           Month format.
MN          Month name format.
MS          Short Month name format.
MD          Month Day format.
WD          Week day format.
WDN         Week day name format.
WDS         Short week day name format.
R           RFC Date format.
DT          Date Time format.
U           Universal format.
S           Sortable format.
T           Time format.
TS          Short Time format.
C			Custom, second parameter is the format as described in FormatDate

Boolean Formats
---------------
B			Normal bool (true, false)
N			Numeric representation (1, 0)
R			Replace values with first parameter for true and second for false

String Formats
---------------
S			Normal text.
T           Truncate. First parameter is the length to trim, second is the ellipsis
			(optional parameter, defaults to '...')
PL          Pad left. First parameter is the length, second is filling char
			(optional parameter, defaults to ' ')
PR          Pad right. First parameter is the length, second is filling char
			(optional parameter, defaults to ' ')

List Formats
---------------
J           Joins the elements of the list.
			The first parameter is the format for individual items
			The second parameter is what is shown when the list is empty (defaults to '[]')
			The third is the separator.
            The fourth is the maximum number of values to show (default to nolimit).
			The fifth parameter the ellipsis for not included values (defaults to '...'),
C			Counts the elements in the list

Object Formats
----------------
O			Uses the Std.formatString function
R			Uses the Reflects.formatString function for each field value

TODO:
List Formats
---------------
C           Concats the elements of the list

Other things to do. Nested placeholders
</pre>
	*/
	public static var nullformatString : String = 'null';

	public static function format(pattern : String, values : Array<Dynamic>, culture : Culture) {
		if (null == values || 0 == values.length)
			return pattern;
		return formatf(pattern, culture)(values);
	}

	public static function formatf(pattern : String, culture : Culture)
	{
		var buf = [];
		while (true)
		{
			if (!_reFormat.match(pattern))
			{
				buf.push(function(_) return pattern);
				break;
			}

			var pos = Std.parseInt(_reFormat.matched(1));
			var format = _reFormat.matched(2);
			if (format == '') // '' is for IE
				format = null;
			var p = null;
			var params = [];
			for (i in 3...20) // 20 is a guard limit, 5 is probably more than enough
			{
				p = _reFormat.matched(i);
				if(p == null || p == '') // again IE
					break;
				params.push(FormatParams.cleanQuotes(p));
			}
			var left = _reFormat.matchedLeft();
			buf.push(function(_) return left);
			var df = formatAnyf(format, params, culture);
#if haxe3
			buf.push((function(i : Int, v : Array<Dynamic>) return df(v[i])).bind(pos));
#else
			buf.push(callback(function(i : Int, v : Array<Dynamic>) return df(v[i]), pos));
#end
			pattern = _reFormat.matchedRight();
		}
		return function(values : Array<Dynamic>)
		{
			if (null == values)
				values = [];
			return buf.map(function(df) return df(values)).join("");
		}
	}

	public static function formatString(v : String, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatStringf(param, params, culture)(v);
	}

	public static function formatStringf(?param : String, ?params : Array<String>, culture : Culture)
	{
		params = FormatParams.params(param, params, 'S');
		var format = params.shift();
		switch(format)
		{
			case 'S':
				return function(v : String) return v;
			case 'T':
				var len = params.length < 1 ? 20 : Std.parseInt(params[0]);
				var ellipsis = params.length < 2 ? "..." : params[1];
				return thx.core.Strings.ellipsis.bind(_, len, ellipsis);
			case 'PR':
				var len = params.length < 1 ? 10 : Std.parseInt(params[0]);
				var pad = params.length < 2 ? " " : params[1];
				return function(v : String) return StringTools.rpad(v, pad, len);
			case 'PL':
				var len = params.length < 1 ? 10 : Std.parseInt(params[0]);
				var pad = params.length < 2 ? " " : params[1];
				return function(v : String) return StringTools.lpad(v, pad, len);
			default:
				return throw "Unsupported formatString format: " + format;
		}
	}

	public static function formatInt(v : Float, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatIntf(param, params, culture)(v);
	}

	public static function formatIntf(?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatFloatf(FormatParams.params(param, params, 'I'), culture);
	}

	public static function formatFloat(v : Float, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatFloatf(param, params, culture)(v);
	}

	public static function formatFloatf(?param : String, ?params : Array<String>, culture : Culture)
	{
		params = FormatParams.params(param, params, 'D');
		var format = params.shift();
		var decimals : Null<Int> = params.length > 0 ? Std.parseInt(params[0]) : null;
		switch(format)
		{
			case 'D':
				return function(v) return FormatNumber.decimal(v, decimals, culture);
			case 'I':
				return function(v) return FormatNumber.int(v, culture);
			case 'C':
				var s = params.length > 1 ? params[1] : null;
				return function(v) return FormatNumber.currency(v, s, decimals, culture);
			case 'P':
				return function(v) return FormatNumber.percent(v, decimals, culture);
			case 'M':
				return function(v) return FormatNumber.permille(v, decimals, culture);
			default:
				return throw 'Unsupported number format: $format';
		}
	}

	public static function formatArray(v : Array<Dynamic>, ?param : String, ?params : Array<String>, culture : Culture)
	{
		params = FormatParams.params(param, params, 'J');
		var format = params.shift();
		switch(format)
		{
			case 'J':
				if (v.length == 0)
				{
					var empty = null == params[1] ? '[]' : params[1];
					return empty;
				}

				var sep = null == params[2] ? ', ' : params[2];
				var max : Null<Int> = params[3] == null ? null : ('' == params[3] ? null : Std.parseInt(params[3]));
				if (null != max && max < v.length)
				{
					var elipsis = null == params[4] ? ' ...' : params[4];
					return v.slice(0, max).map(function(d) return formatAny(d, params[0], culture)).join(sep) + elipsis;
				} else
					return v.map(function(d) return formatAny(d, params[0], culture)).join(sep);
			case 'C':
				return formatInt(v.length, 'I', [], culture);
			default:
				throw "Unsupported array format: " + format;
		}
	}

	public static function formatArrayf(?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatArray.bind(_, param, params, culture);
	}

	public static function formatDate(d : Date, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatDatef(param, params, culture)(d);
	}

	public static function formatDatef(?param : String, ?params : Array<String>, culture : Culture)
	{
		params = FormatParams.params(param, params, 'D');
		var format = params.shift();
		switch(format)
		{
			case 'D':
				return function(d) return FormatDate.date(d, culture);
			case 'DS':
				return function(d) return FormatDate.dateShort(d, culture);
			case 'DST':
				return function(d) return FormatDate.dateShort(d, culture)+' '+FormatDate.time(d, culture);
			case 'DSTS':
				return function(d) return FormatDate.dateShort(d, culture)+' '+FormatDate.timeShort(d, culture);
			case 'DTS':
				return function(d) return FormatDate.date(d, culture)+' '+FormatDate.timeShort(d, culture);
			case 'Y':
				return function(d) return FormatDate.year(d, culture);
			case 'YM':
				return function(d) return FormatDate.yearMonth(d, culture);
			case 'M':
				return function(d) return FormatDate.month(d, culture);
			case 'MN':
				return function(d) return FormatDate.monthName(d, culture);
			case 'MS':
				return function(d) return FormatDate.monthNameShort(d, culture);
			case 'MD':
				return function(d) return FormatDate.monthDay(d, culture);
			case 'WD':
				return function(d) return FormatDate.weekDay(d, culture);
			case 'WDN':
				return function(d) return FormatDate.weekDayName(d, culture);
			case 'WDS':
				return function(d) return FormatDate.weekDayNameShort(d, culture);
			case 'R':
				return function(d) return FormatDate.dateRfc(d, culture);
			case 'DT':
				return function(d) return FormatDate.dateTime(d, culture);
			case 'U':
				return function(d) return FormatDate.universal(d, culture);
			case 'S':
				return function(d) return FormatDate.sortable(d, culture);
			case 'T':
				return function(d) return FormatDate.time(d, culture);
			case 'TS':
				return function(d) return FormatDate.timeShort(d, culture);
			case 'C':
				var f = params[0];
				if (null == f)
					return function(d) return FormatDate.date(d, culture);
				else
					return function(d) return FormatDate.format(f, d, culture, (params[1] != null ? (params[1] == 'true') : true));
			default:
				throw 'Unsupported formatDate format: $format';
		}
	}

	public static function formatAny(v : Dynamic, ?param : String, ?params : Array<String>, ?culture : Culture)
	{
		return formatAnyf(param, params, culture)(v);
	}

	public static function formatAnyf(?param : String, ?params : Array<String>, ?culture : Culture)
	{
		return function(v : Dynamic) : String
		{
			switch(Type.typeof(v)) {
				case TNull:
					return nullformatString;
				case TInt:
					return formatInt(v, param, params, culture);
				case TFloat:
					return formatFloat(v, param, params, culture);
				case TBool:
					return formatBool(v, param, params, culture);
				case TClass(c):
					if(c == String) {
						return formatString(v, param, params, culture);
					} else if (c == Array) {
						return formatString(v, param, params, culture);
					} else if(c == Date) {
						return formatDate(v, param, params, culture);
					} else {
						return formatObject(v, param, params, culture);
					}
				case TObject:
					return formatObject(v, param, params, culture);
				case TFunction:
					return "function()";
				default:
					return throw 'Unsupported type format: ${Type.typeof(v)}';
			}
		}
	}

	public static function formatBool(v : Dynamic, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatBoolf(param, params, culture)(v);
	}

	public static function formatBoolf(?param : String, ?params : Array<String>, culture : Culture)
	{
		return function(v : Dynamic) : String
		{
			switch(Type.typeof(v)) {
				case TNull:
					return nullformatString;
				case TInt:
					return formatInt(v, param, params, culture);
				case TFloat:
					return formatFloat(v, param, params, culture);
				case TBool:
					return formatBool(v, param, params, culture);
				case TClass(c):
					if(c == String) {
						return formatString(v, param, params, culture);
					} else if (c == Array) {
						return formatArray(v, param, params, culture);
					} else if(c == Date) {
						return formatDate(v, param, params, culture);
					} else {
						return formatObject(v, param, params, culture);
					}
				case TObject:
					return formatObject(v, param, params, culture);
				case TFunction:
					return "function()";
				default:
					return throw 'Unsupported type format: ${Type.typeof(v)}';
			}
		}
	}

	public static function formatObject(v : Float, ?param : String, ?params : Array<String>, culture : Culture)
	{
		return formatObjectf(param, params, culture)(v);
	}

	public static function formatObjectf(?param : String, ?params : Array<String>, culture : Culture)
	{
		params = FormatParams.params(param, params, 'R');
		var format = params.shift();
		switch(format)
		{
			case 'O':
				return function(v) return Std.string(v);
			case 'R':
				return function(v)
				{
					var buf = [];
					for (field in Reflect.fields(v))
						buf.push(field + ":" + formatAny(Reflect.field(v, field), culture));
					return "{" + buf.join(",") + "}";
				}
			default:
				return throw 'Unsupported number format: $format';
		}
	}
}