package thx.culture;

class Culture {
  public static var invariant(default, null) : Culture = new Culture("", DateTimeFormatInfo.invariant, "", false, "iv", "IVL", false, 127, "Gregorian", "Invariant Language", "Invariant Language", "Invariant Country", "Invariant Country", NumberFormatInfo.invariant, ",", "IVL");

  public var code(default, null)               : String;
  public var dateTime(default, null)           : DateTimeFormatInfo;
  public var ietf(default, null)               : String;
  public var isNeutral(default, null)          : Bool;
  public var iso2(default, null)               : String;
  public var iso3(default, null)               : String;
  public var isRightToLeft(default, null)      : Bool;
  public var lcid(default, null)               : Int;
  public var nameCalendar(default, null)       : String;
  public var nameDisplayEnglish(get, null)     : String;
  public var nameDisplayNative(get, null)      : String;
  public var nameEnglish(default, null)        : String;
  public var nameNative(default, null)         : String;
  public var nameRegionEnglish(default, null)  : String;
  public var nameRegionNative(default, null)   : String;
  public var number(default, null)             : NumberFormatInfo;
  public var separatorList(default, null)      : String;
  public var win3(default, null)               : String;

  public function new(
    code               : String,
    dateTime           : DateTimeFormatInfo,
    ietf               : String,
    isNeutral          : Bool,
    iso2               : String,
    iso3               : String,
    isRightToLeft      : Bool,
    lcid               : Int,
    nameCalendar       : String,
    nameEnglish        : String,
    nameNative         : String,
    nameRegionEnglish  : String,
    nameRegionNative   : String,
    number             : NumberFormatInfo,
    separatorList      : String,
    win3               : String
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
      DateTimeFormatInfo.fromObject(o.dateTime),
      o.ietf,
      o.isNeutral,
      o.iso2,
      o.iso3,
      o.isRightToLeft,
      o.lcid,
      o.nameCalendar,
      o.nameEnglish,
      o.nameNative,
      o.nameRegionEnglish,
      o.nameRegionNative,
      NumberFormatInfo.fromObject(o.number),
      o.separatorList,
      o.win3
    );

  inline function get_nameDisplayEnglish()
    return nameEnglish + (null == nameRegionEnglish ? '' : ' ($nameRegionEnglish)');

  inline function get_nameDisplayNative()
    return nameNative + (null == nameRegionNative ? '' : ' ($nameRegionNative)');

  inline public function toString()
    return nameDisplayEnglish;

  static var cultures : Map<String, Culture>;
  static var list : Array<Culture>;
  public static function register(culture : Culture) {
    var code = getCodeKey(culture.code);
    if(cultures.exists(code))
      return cultures.get(code);

    list.push(culture);
    cultures.set(code, culture);
    cultures.set(getIso2Key(culture.iso2), culture);
    cultures.set(getIso3Key(culture.iso3), culture);
    return culture;
  }

  public static function getByCode(name : String)
    return cultures.get(getCodeKey(name));
  public static function getByIso2(name : String)
    return cultures.get(getIso2Key(name));
  public static function getByIso3(name : String)
    return cultures.get(getIso3Key(name));
  public static function iterator()
    return list.iterator();

  inline static function getCodeKey(key : String)
    return "C:"+key.toLowerCase();
  inline static function getIso2Key(key : String)
    return "I2:"+key.toLowerCase();
  inline static function getIso3Key(key : String)
    return "I3:"+key.toLowerCase();

  static function __init__() {
    cultures = new Map();
    list = [];
  }
}