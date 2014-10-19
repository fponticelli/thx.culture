package thx.culture;

class Culture {
  public static var invariant(default, null) : Culture = new Culture("", DateTimeFormatInfo.invariant, "", false, "iv", "IVL", false, 127, "Gregorian", "Invariant Language (Invariant Country)", "Invariant Language", "Invariant Language", "Invariant Country", "Invariant Country", NumberFormatInfo.invariant, ",", "IVL");

  public var code(default, null)              : String;
  public var dateTime(default, null)          : DateTimeFormatInfo;
  public var ietf(default, null)              : String;
  public var isNeutral(default, null)         : Bool;
  public var iso2(default, null)              : String;
  public var iso3(default, null)              : String;
  public var isRightToLeft(default, null)     : Bool;
  public var lcid(default, null)              : Int;
  public var nameCalendar(default, null)      : String;
  public var nameDisplay(default, null)       : String;
  public var nameEnglish(default, null)       : String;
  public var nameNative(default, null)        : String;
  public var nameRegionEnglish(default, null) : String;
  public var nameRegionNative(default, null)  : String;
  public var number(default, null)            : NumberFormatInfo;
  public var separatorList(default, null)     : String;
  public var win3(default, null)              : String;

  public function new(
    code              : String,
    dateTime          : DateTimeFormatInfo,
    ietf              : String,
    isNeutral         : Bool,
    iso2              : String,
    iso3              : String,
    isRightToLeft     : Bool,
    lcid              : Int,
    nameCalendar      : String,
    nameDisplay       : String,
    nameEnglish       : String,
    nameNative        : String,
    nameRegionEnglish : String,
    nameRegionNative  : String,
    number            : NumberFormatInfo,
    separatorList     : String,
    win3              : String
  ) {
    this.code = code;
    this.dateTime = dateTime;
    this.ietf = ietf;
    this.isNeutral = isNeutral;
    this.iso2 = iso2;
    this.iso3 = iso3;
    this.isRightToLeft = isRightToLeft;
    this.lcid = lcid;
    this.nameCalendar = nameCalendar;
    this.nameDisplay = nameDisplay;
    this.nameEnglish = nameEnglish;
    this.nameNative = nameNative;
    this.nameRegionEnglish = nameRegionEnglish;
    this.nameRegionNative = nameRegionNative;
    this.number = number;
    this.separatorList = separatorList;
    this.win3 = win3;
  }

  inline public static function fromObject(o : Dynamic)
    return new Culture(
      o.code,
      o.dateTime,
      o.ietf,
      o.isNeutral,
      o.iso2,
      o.iso3,
      o.isRightToLeft,
      o.lcid,
      o.nameCalendar,
      o.nameDisplay,
      o.nameEnglish,
      o.nameNative,
      o.nameRegionEnglish,
      o.nameRegionNative,
      o.number,
      o.separatorList,
      o.win3
    );

  inline public function toString()
    return nameDisplay;

/*
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
*/
}