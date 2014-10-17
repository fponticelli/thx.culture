package thx.culture;

class Culture extends Domain {
  public static var invariant(default, null) : Culture = embed("en-US");

  macro public static function embed(code : haxe.macro.Expr) {
   var json = Culture.readJson("Culture", code);
    return macro thx.culture.Culture.register(new thx.culture.Culture(
      $v{json.name},
      $v{json.native},
      $v{json.english},
      $v{json.iso2},
      $v{json.iso3},
      $v{json.pluralRule},
      new thx.culture.Language(
        $v{json.language.name},
        $v{json.language.native},
        $v{json.language.english},
        $v{json.language.iso2},
        $v{json.language.iso3},
        $v{json.language.pluralRule}
      ),
      new thx.culture.DateTimeInfo(
        $v{json.date.months},
        $v{json.date.abbrMonths},
        $v{json.date.days},
        $v{json.date.abbrDays},
        $v{json.date.shortDays},
        $v{json.date.am},
        $v{json.date.pm},
        $v{json.date.separatorDate},
        $v{json.date.separatorTime},
        $v{json.date.firstWeekDay},
        $v{json.date.patternYearMonth},
        $v{json.date.patternMonthDay},
        $v{json.date.patternDate},
        $v{json.date.patternDateShort},
        $v{json.date.patternDateRfc},
        $v{json.date.patternDateTime},
        $v{json.date.patternUniversal},
        $v{json.date.patternSortable},
        $v{json.date.patternTime},
        $v{json.date.patternTimeShort}
      ),
      $v{json.englishCurrency},
      $v{json.nativeCurrency},
      $v{json.currencySymbol},
      $v{json.currencyIso},
      $v{json.englishRegion},
      $v{json.nativeRegion},
      $v{json.isMetric},
      $v{json.digits},
      $v{json.signNeg},
      $v{json.signPos},
      $v{json.symbolNaN},
      $v{json.symbolPercent},
      $v{json.symbolPermille},
      $v{json.symbolNegInf},
      $v{json.symbolPosInf},
      new thx.culture.NumberInfo(
        $v{json.number.decimals},
        $v{json.number.decimalsSeparator},
        $v{json.number.groups},
        $v{json.number.groupsSeparator},
        $v{json.number.patternNegative},
        $v{json.number.patternPositive}
      ),
      new thx.culture.NumberInfo(
        $v{json.currency.decimals},
        $v{json.currency.decimalsSeparator},
        $v{json.currency.groups},
        $v{json.currency.groupsSeparator},
        $v{json.currency.patternNegative},
        $v{json.currency.patternPositive}
      ),
      new thx.culture.NumberInfo(
        $v{json.percent.decimals},
        $v{json.percent.decimalsSeparator},
        $v{json.percent.groups},
        $v{json.percent.groupsSeparator},
        $v{json.percent.patternNegative},
        $v{json.percent.patternPositive}
      )
    ));
  }

#if macro
  public static function readJson(ref : String, code : haxe.macro.Expr) : Dynamic {
    var name = switch code.expr {
      case EConst(CString(s)): s;
      case _: throw 'expected a constant string but is ${code.expr}';
    };
    var file = thx.macro.Macros.getModulePath('thx.culture.$ref'),
        path = file.split("/").slice(0, -1).join("/") + '/${ref.toLowerCase()}s/' + name.toLowerCase() + ".json";
    if(!sys.FileSystem.exists(path))
      haxe.macro.Context.error('invalid code $name', code.pos);
    return haxe.Json.parse(sys.io.File.getContent(path));
  }
#end

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
  public static function register(culture : Culture) {
    cultures.set(getNativeKey(culture.native), culture);
    cultures.set(getNameKey(culture.name), culture);
    cultures.set(getIso2Key(culture.iso2), culture);
    cultures.set(getIso3Key(culture.iso3), culture);
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


  static function getNativeKey(key : String)
    return "NATIVE:"+key;
  static function getNameKey(key : String)
    return "NAME:"+key;
  static function getIso2Key(key : String)
    return "ISO2:"+key;
  static function getIso3Key(key : String)
    return "ISO3:"+key;

  static function __init__()
    cultures = new Map();
}