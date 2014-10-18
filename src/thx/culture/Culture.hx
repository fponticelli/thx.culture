package thx.culture;

class Culture extends Domain {
  public static var invariant(default, null) : Culture = Embed.culture("en-US");

  public var native(default, null) : String;
  public var english(default, null) : String;
  public var iso2(default, null) : String;
  public var iso3(default, null) : String;

  public var language(default, null) : Language;

  public var date(default, null) : DateTimeInfo;
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

  public var number(default, null) : NumberInfo;
  public var currency(default, null) : NumberInfo;
  public var percent(default, null) : NumberInfo;

  override public function toString()
    return native + " (" + english + ")";

  public function new(
    name : String,
    native : String,
    english : String,
    iso2 : String,
    iso3 : String,
    pluralRule : Int,
    language : Language,
    date : DateTimeInfo,
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
    number : NumberInfo,
    currency : NumberInfo,
    percent : NumberInfo
  ) {
    super(name, pluralRule);
    this.native = native;
    this.english = english;
    this.iso2 = iso2;
    this.iso3 = iso3;
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

  static var cultures : Map<String, Culture>;
  static var list : Array<Culture>;
  public static function register(culture : Culture) {
    var iso3 = getIso3Key(culture.iso3);
    if(cultures.exists(iso3))
      return cultures.get(iso3);

    list.push(culture);
    cultures.set(getNativeKey(culture.native), culture);
    cultures.set(getNameKey(culture.name), culture);
    cultures.set(getIso2Key(culture.iso2), culture);
    cultures.set(iso3, culture);
    Language.register(culture.language);
    return culture;
  }

  public static function getByName(name : String, ?alt : Culture)
    return cultures.exists(getNameKey(name)) ? cultures.get(getNameKey(name)) : (alt == null ? invariant : alt);
  public static function getByNativeName(name : String, ?alt : Culture)
    return cultures.exists(getNativeKey(name)) ? cultures.get(getNativeKey(name)) : (alt == null ? invariant : alt);
  public static function getByIso2(name : String, ?alt : Culture)
    return cultures.exists(getIso2Key(name)) ? cultures.get(getIso2Key(name)) : (alt == null ? invariant : alt);
  public static function getByIso3(name : String, ?alt : Culture)
    return cultures.exists(getIso3Key(name)) ? cultures.get(getIso3Key(name)) : (alt == null ? invariant : alt);
  public static function iterator()
    return list.iterator();

  static function getNativeKey(key : String)
    return "NATIVE:"+key;
  static function getNameKey(key : String)
    return "NAME:"+key;
  static function getIso2Key(key : String)
    return "ISO2:"+key;
  static function getIso3Key(key : String)
    return "ISO3:"+key;

  static function __init__() {
    cultures = new Map();
    list = [];
  }
}