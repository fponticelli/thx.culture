package thx.culture;

class Culture
{
	public var name(default, null) : String;
	public var native(default, null) : String;
	public var english(default, null) : String;
	public var iso2(default, null) : String;
	public var iso3(default, null) : String;
	public var pluralRule(default, null) : Int;
	
	public var language(default, null) : Language;

	public var date(default, null) : DateTime;
	public var englishCurrency(default, null) : String;
	public var nativeCurrency(default, null) : String;
	public var currencySymbol(default, null) : String;
	public var currencyIso(default, null) : String;

	public var englishRegion(default, null) : String;
	public var nativeRegion(default, null) : String;
	public var isMetric(default, null) : Bool;

	public var digits(default, null) : Null<Array<String>>;

	public var signNeg(default, null) : String;
	public var signPos(default, null) : String;

	public var symbolNaN(default, null) : String;
	public var symbolPercent(default, null) : String;
	public var symbolPermille(default, null) : String;
	public var symbolNegInf(default, null) : String;
	public var symbolPosInf(default, null) : String;

	public var number(default, null) : Number;
	public var currency(default, null) : Number;
	public var percent(default, null) : Number;

	public function toString()
	{
		return native + " (" + english + ")";
	}

	function new(
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int,
		language : Language,
		date : DateTime,
		englishCurrency : String,
		nativeCurrency : String,
		currencySymbol : String,
		currencyIso : String,
		englishRegion : String,
		nativeRegion : String,
		isMetric : Bool,
		digits : Null<Array<String>>,
		signNeg : String,
		signPos : String,
		symbolNaN : String,
		symbolPercent : String,
		symbolPermille : String,
		symbolNegInf : String,
		symbolPosInf : String,
		number : Number,
		currency : Number,
		percent : Number
	)
	{
		this.name = name;
		this.native = native;
		this.english = english;
		this.iso2 = iso2;
		this.iso3 = iso3;
		this.pluralRule = pluralRule;
		this.language = language;
		this.date = date;
		this.englishCurrency = englishCurrency;
		this.nativeCurrency = nativeCurrency;
		this.currencySymbol = currencySymbol;
		this.currencyIso = currencyIso;
		this.englishRegion = englishRegion;
		this.nativeRegion = nativeRegion;
		this.isMetric = isMetric;
		this.digits = digits;
		this.signNeg = signNeg;
		this.signPos = signPos;
		this.symbolNaN = symbolNaN;
		this.symbolPercent = symbolPercent;
		this.symbolPermille = symbolPermille;
		this.symbolNegInf = symbolNegInf;
		this.symbolPosInf = symbolPosInf;
		this.number = number;
		this.currency = currency;
		this.percent = percent;
	}

	public static function create(
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int,
		language : Language,
		date : DateTime,
		englishCurrency : String,
		nativeCurrency : String,
		currencySymbol : String,
		currencyIso : String,
		englishRegion : String,
		nativeRegion : String,
		isMetric : Bool,
		digits : Null<Array<String>>,
		signNeg : String,
		signPos : String,
		symbolNaN : String,
		symbolPercent : String,
		symbolPermille : String,
		symbolNegInf : String,
		symbolPosInf : String,
		number : Number,
		currency : Number,
		percent : Number
	)
	{
		return new Culture(name, native, english, iso2, iso3, pluralRule, language, date, englishCurrency, nativeCurrency, currencySymbol, currencyIso, englishRegion, nativeRegion, isMetric, digits, signNeg, signPos, symbolNaN, symbolPercent, symbolPermille, symbolNegInf, symbolPosInf, number, currency, percent);
	}

	public static function createFromObject(ob : {
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int,
		language : { name : String, native : String, english : String, iso2 : String, iso3 : String, pluralRule : Int },
		date : { months : Array<String>, abbrMonths : Array<String>, days : Array<String>, abbrDays : Array<String>, shortDays : Array<String>, am : String, pm : String, separatorDate : String, separatorTime : String, firstWeekDay : Int, patternYearMonth : String, patternMonthDay : String, patternDate : String, patternDateShort : String, patternDateRfc : String, patternDateTime : String, patternUniversal : String, patternSortable : String, patternTime : String, patternTimeShort : String },
		englishCurrency : String,
		nativeCurrency : String,
		currencySymbol : String,
		currencyIso : String,
		englishRegion : String,
		nativeRegion : String,
		isMetric : Bool,
		digits : Null<Array<String>>,
		signNeg : String,
		signPos : String,
		symbolNaN : String,
		symbolPercent : String,
		symbolPermille : String,
		symbolNegInf : String,
		symbolPosInf : String,
		number : { decimals : Int, decimalsSeparator : String, groups : Array<Int>, groupsSeparator : String, patternNegative : String, patternPositive : String },
		currency : { decimals : Int, decimalsSeparator : String, groups : Array<Int>, groupsSeparator : String, patternNegative : String, patternPositive : String },
		percent : { decimals : Int, decimalsSeparator : String, groups : Array<Int>, groupsSeparator : String, patternNegative : String, patternPositive : String }
	})
	{
		return new Culture(ob.name, ob.native, ob.english, ob.iso2, ob.iso3, ob.pluralRule, Language.createFromObject(ob.language), ob.date, ob.englishCurrency, ob.nativeCurrency, ob.currencySymbol, ob.currencyIso, ob.englishRegion, ob.nativeRegion, ob.isMetric, ob.digits, ob.signNeg, ob.signPos, ob.symbolNaN, ob.symbolPercent, ob.symbolPermille, ob.symbolNegInf, ob.symbolPosInf, ob.number, ob.currency, ob.percent);
	}

	static var cultures : Map<String, Culture> = new Map();
	public static function register(culture : Culture)
	{
		cultures.set(getNativeKey(culture), culture.native);
		cultures.set(getNameKey(culture), culture.name);
		cultures.set(getIso2Key(culture), culture.iso2);
		cultures.set(getIso3Key(culture), culture.iso3);
		Language.register(culture.language);
	}

	public static function getByName(name : String)
		return cultures.get(getNameKey(name));
	public static function getByNativeName(name : String)
		return cultures.get(getNativeKey(name));
	public static function getByIso2(name : String)
		return cultures.get(getIso2Key(name));
	public static function getByIso3(name : String)
		return cultures.get(getIso3Key(name));


	static function getNativeKey(key : String)
		return "NATIVE:"+key;
	static function getNameKey(key : String)
		return "NAME:"+key;
	static function getIso2Key(key : String)
		return "ISO2:"+key;
	static function getIso3Key(key : String)
		return "ISO3:"+key;
}

/*
import thx.culture.core.DateTime;
import thx.culture.core.Number;

class Culture extends Info
{
	public var language(default, null) : Language;

	public var date(default, null) : DateTime;
	public var englishCurrency(default, null) : String;
	public var nativeCurrency(default, null) : String;
	public var currencySymbol(default, null) : String;
	public var currencyIso(default, null) : String;

	public var englishRegion(default, null) : String;
	public var nativeRegion(default, null) : String;
	public var isMetric(default, null) : Bool;

	public var digits(default, null) : Null<Array<String>>;

	public var signNeg(default, null) : String;
	public var signPos(default, null) : String;

	public var symbolNaN(default, null) : String;
	public var symbolPercent(default, null) : String;
	public var symbolPermille(default, null) : String;
	public var symbolNegInf(default, null) : String;
	public var symbolPosInf(default, null) : String;

	public var number(default, null) : Number;
	public var currency(default, null) : Number;
	public var percent(default, null) : Number;

	@:isVar static var cultures(get_cultures, null) : Map<String, Culture>;
	static function get_cultures()
	{
		if (null == cultures)
			cultures = new Map ();
		return cultures;
	}

	public static function get(name : String) : Culture
	{
		return cultures.get(name.toLowerCase());
	}

	public static function names()
	{
		return cultures.keys();
	}

	public static function exists(culture:String)
	{
		return cultures.exists(culture.toLowerCase());
	}

	static var _defaultCulture : Culture;
	public static var defaultCulture(get, set) : Culture;

	static function get_defaultCulture()
	{
		if (null == _defaultCulture)
			return thx.cultures.EnUS.culture;
		else
			return _defaultCulture;
	}

	static function set_defaultCulture(culture : Culture)
	{
		return _defaultCulture = culture;
	}

	public static function add(culture : Culture)
	{
		if (null == _defaultCulture)
			_defaultCulture = culture;
		var name = culture.name.toLowerCase();
		if(!cultures.exists(name))
			cultures.set(name, culture);
	}


	public static function loadAll()
	{
#if php
#if haxe3
		var dir = Sys.getCwd() + "lib/thx/cultures/";
		for (file in sys.FileSystem.readDirectory(dir))
			untyped __call__("require_once", dir + file);
#else
		var dir = php.Sys.getCwd() + "lib/thx/cultures/";
		for (file in php.FileSystem.readDirectory(dir))
			untyped __call__("require_once", dir + file);
#end
#end
	}
}
*/