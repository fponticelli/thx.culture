package thx.culture;

class Format {
  static var PATTERN_FORMAT = ~/{(\d+)(?::([a-zA-Z]+))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?(?:,([^"',}]+|'[^']+'|"[^"]+"))?}/m;

/**
Take a formatString pattern and replaces the placeholders with the value contained in values.
The culture parameter is needed for proper localization of numeric and formatDate values.
Placeholders follows this schema:
```
{pos[:format][,param]*}
```
<em>pos</em> is the position in the array
<em>format</em> is a formatString sequence that identifies a specific value format (see below)
<em>param</em> is one or more optional parameters specific to certain format values.

```
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
C     Custom, second parameter is the format as described in FormatDate

Boolean Formats
---------------
B     Normal bool (true, false)
N     Numeric representation (1, 0)
R     Replace values with first parameter for true and second for false

String Formats
---------------
S     Normal text.
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
C     Counts the elements in the list

Object Formats
----------------
O     Uses the Std.formatString function
R     Uses the Reflects.formatString function for each field value

TODO:
List Formats
---------------
C           Concats the elements of the list

Other things to do. Nested placeholders
```
*/
  public static var nullformatString : String = 'null';

  public static function format(pattern : String, values : Array<Dynamic>, culture : Culture) {
    if (null == values || 0 == values.length)
      return pattern;
    return formatf(pattern, culture)(values);
  }

  public static function formatf(pattern : String, culture : Culture) {
    var buf = [];
    while (true) {
      if (!PATTERN_FORMAT.match(pattern)) {
        buf.push(function(_) return pattern);
        break;
      }

      var pos = Std.parseInt(PATTERN_FORMAT.matched(1));
      var format = PATTERN_FORMAT.matched(2);
      if (format == '') // '' is for IE
        format = null;
      var p = null;
      var params = [];
      for (i in 3...20) { // 20 is a guard limit, 5 is probably more than enough
        p = PATTERN_FORMAT.matched(i);
        if(p == null || p == '') // again IE
          break;
        params.push(FormatParams.cleanQuotes(p));
      }
      var left = PATTERN_FORMAT.matchedLeft();
      buf.push(function(_) return left);
      var df = formatAnyf(null == format ? null : [format].concat(params), culture);
      buf.push((function(i : Int, v : Array<Dynamic>) return df(v[i])).bind(pos));
      pattern = PATTERN_FORMAT.matchedRight();
    }

    return function(values : Array<Dynamic>) {
      if (null == values)
        values = [];
      return buf.map(function(df : Array<Dynamic> -> String) return df(values)).join("");
    };
  }

  public static function formatString(v : String, ?params : Array<String>, culture : Culture)
    return formatStringf(params, culture)(v);

  public static function formatStringf(?params : Array<String>, culture : Culture) {
    params = FormatParams.params(params, 'S');
    var format = params.shift();
    switch format {
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

  public static function formatInt(v : Float, ?params : Array<String>, culture : Culture)
    return formatIntf(params, culture)(v);

  public static function formatIntf(?params : Array<String>, culture : Culture)
    return formatFloatf(FormatParams.params(params, 'I'), culture);

  public static function formatFloat(v : Float, ?params : Array<String>, culture : Culture)
    return formatFloatf(params, culture)(v);

  public static function formatFloatf(?params : Array<String>, culture : Culture) {
    params = FormatParams.params(params, 'D');
    var format = params.shift();
    var decimals : Null<Int> = params.length > 0 ? Std.parseInt(params[0]) : null;
    switch format {
      case 'D':
        return function(v : Float) return FormatNumber.decimal(v, decimals, culture);
      case 'I':
        return function(v : Float) return FormatNumber.int(v, culture);
      case 'C':
        var s = params.length > 1 ? params[1] : null;
        return function(v : Float) return FormatNumber.currency(v, s, decimals, culture);
      case 'P':
        return function(v : Float) return FormatNumber.percent(v, decimals, culture);
      case 'M':
        return function(v : Float) return FormatNumber.permille(v, decimals, culture);
      default:
        return throw 'Unsupported number format: $format';
    }
  }

  public static function formatArray(v : Array<Dynamic>, ?params : Array<String>, culture : Culture) {
    params = FormatParams.params(params, 'J');
    var format = params.shift();
    switch format {
      case 'J':
        if (v.length == 0) {
          var empty = null == params[1] ? '[]' : params[1];
          return empty;
        }

        var sep = null == params[2] ? ', ' : params[2];
        var max : Null<Int> = params[3] == null ? null : ('' == params[3] ? null : Std.parseInt(params[3]));
        if (null != max && max < v.length) {
          var elipsis = null == params[4] ? ' ...' : params[4];
          return v.slice(0, max).map(function(d : Dynamic) return formatAny(d, null == params[0] ? null : [params[0]], culture)).join(sep) + elipsis;
        } else
          return v.map(function(d : Dynamic) return formatAny(d, null == params[0] ? null : [params[0]], culture)).join(sep);
      case 'C':
        return formatInt(v.length, ['I'], culture);
      default:
        throw "Unsupported array format: " + format;
    }
  }

  public static function formatArrayf(?params : Array<String>, culture : Culture)
    return formatArray.bind(_, params, culture);

  public static function formatDate(d : Date, ?params : Array<String>, culture : Culture)
    return formatDatef(params, culture)(d);

  public static function formatDatef(?params : Array<String>, culture : Culture) {
    params = FormatParams.params(params, 'D');
    var format = params.shift();
    switch format {
      case 'D':
        return function(d : Date) return FormatDate.date(d, culture);
      case 'DS':
        return function(d : Date) return FormatDate.dateShort(d, culture);
      case 'DST':
        return function(d : Date) return FormatDate.dateShort(d, culture)+' '+FormatDate.time(d, culture);
      case 'DSTS':
        return function(d : Date) return FormatDate.dateShort(d, culture)+' '+FormatDate.timeShort(d, culture);
      case 'DTS':
        return function(d : Date) return FormatDate.date(d, culture)+' '+FormatDate.timeShort(d, culture);
      case 'Y':
        return function(d : Date) return FormatDate.year(d, culture);
      case 'YM':
        return function(d : Date) return FormatDate.yearMonth(d, culture);
      case 'M':
        return function(d : Date) return FormatDate.month(d, culture);
      case 'MN':
        return function(d : Date) return FormatDate.monthName(d, culture);
      case 'MS':
        return function(d : Date) return FormatDate.monthNameShort(d, culture);
      case 'MD':
        return function(d : Date) return FormatDate.monthDay(d, culture);
      case 'WD':
        return function(d : Date) return FormatDate.weekDay(d, culture);
      case 'WDN':
        return function(d : Date) return FormatDate.weekDayName(d, culture);
      case 'WDS':
        return function(d : Date) return FormatDate.weekDayNameShort(d, culture);
      case 'R':
        return function(d : Date) return FormatDate.dateRfc(d, culture);
      case 'DT':
        return function(d : Date) return FormatDate.dateTime(d, culture);
      case 'U':
        return function(d : Date) return FormatDate.universal(d, culture);
      case 'S':
        return function(d : Date) return FormatDate.sortable(d, culture);
      case 'T':
        return function(d : Date) return FormatDate.time(d, culture);
      case 'TS':
        return function(d : Date) return FormatDate.timeShort(d, culture);
      case 'C':
        var f = params[0];
        if (null == f)
          return function(d : Date) return FormatDate.date(d, culture);
        else
          return function(d : Date) return FormatDate.format(f, d, culture, (params[1] != null ? (params[1] == 'true') : true));
      default:
        throw 'Unsupported formatDate format: $format';
    }
  }

  public static function formatAny(v : Dynamic, ?params : Array<String>, ?culture : Culture)
    return formatAnyf(params, culture)(v);

  public static function formatAnyf(?params : Array<String>, ?culture : Culture) {
    return function(v : Dynamic) : String return switch(Type.typeof(v)) {
      case TNull:                 nullformatString;
      case TFloat if(v % 1 != 0): formatFloat(v, params, culture);
      case TInt, TFloat:          formatInt(v, params, culture);
      case TBool:                 formatBool(v, params, culture);
      case TClass(String):        formatString(v, params, culture);
      case TClass(Array):         formatString(v, params, culture);
      case TClass(Date):          formatDate(v, params, culture);
      case TClass(_):             formatObject(v, params, culture);
      case TObject:               formatObject(v, params, culture);
      case TFunction:             "function()";
      default:                    throw 'Unsupported type format: ${Type.typeof(v)}';
    }
  }

  public static function formatBool(v : Dynamic, ?params : Array<String>, culture : Culture)
    return formatBoolf(params, culture)(v);

  public static function formatBoolf(?params : Array<String>, culture : Culture) {
    return function(v : Dynamic) : String {
      switch(Type.typeof(v)) {
        case TNull:
          return nullformatString;
        case TInt:
          return formatInt(v, params, culture);
        case TFloat:
          return formatFloat(v, params, culture);
        case TBool:
          return formatBool(v, params, culture);
        case TClass(c):
          if(c == String) {
            return formatString(v, params, culture);
          } else if (c == Array) {
            return formatArray(v, params, culture);
          } else if(c == Date) {
            return formatDate(v, params, culture);
          } else {
            return formatObject(v, params, culture);
          }
        case TObject:
          return formatObject(v, params, culture);
        case TFunction:
          return "function()";
        default:
          return throw 'Unsupported type format: ${Type.typeof(v)}';
      }
    }
  }

  public static function formatObject(v : Float, ?params : Array<String>, culture : Culture)
    return formatObjectf(params, culture)(v);

  public static function formatObjectf(?params : Array<String>, culture : Culture) {
    params = FormatParams.params(params, 'R');
    var format = params.shift();
    switch format {
      case 'O':
        return function(v : Float) return Std.string(v);
      case 'R':
        return function(v : Float) {
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