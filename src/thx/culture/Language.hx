package thx.culture;

class Language extends Domain {
  public static var invariant(default, null) : Language = embed("en");

  macro public static function embed(code : haxe.macro.Expr) {
    var json = Culture.readJson('Language', code);
    return macro thx.culture.Language.register(new Language(
      $v{json.name},
      $v{json.native},
      $v{json.english},
      $v{json.iso2},
      $v{json.iso3},
      $v{json.pluralRule}
    ));
  }

  public var native(default, null) : String;
  public var english(default, null) : String;
  public var iso2(default, null) : String;
  public var iso3(default, null) : String;

  override public function toString()
    return native + " (" + english + ")";

  public function new(
    name : String,
    native : String,
    english : String,
    iso2 : String,
    iso3 : String,
    pluralRule : Int
  ) {
    super(name, pluralRule);
    this.native = native;
    this.english = english;
    this.iso2 = iso2;
    this.iso3 = iso3;
  }

  static var languages : Map<String, Language>;
  public static function register(language : Language) {
    languages.set(getNativeKey(language.native), language);
    languages.set(getNameKey(language.name), language);
    languages.set(getIso2Key(language.iso2), language);
    languages.set(getIso3Key(language.iso3), language);
    return language;
  }

  inline public static function getByName(name : String)
    return languages.get(getNameKey(name));
  inline public static function getByNativeName(name : String)
    return languages.get(getNativeKey(name));
  inline public static function getByIso2(name : String)
    return languages.get(getIso2Key(name));
  inline public static function getByIso3(name : String)
    return languages.get(getIso3Key(name));

  inline static function getNativeKey(key : String)
    return "NATIVE:"+key;
  inline static function getNameKey(key : String)
    return "NAME:"+key;
  inline static function getIso2Key(key : String)
    return "ISO2:"+key;
  inline static function getIso3Key(key : String)
    return "ISO3:"+key;

  static function __init__() {
    languages = new Map();
  }
}