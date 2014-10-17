package thx.culture;

class Culture extends Domain
{
  public static var invariant(default, null) : Culture = embed("en-US");

  macro public static function embed(code : haxe.macro.Expr)
  {
    var name = switch (code.expr) {
      case EConst(CString(s)):
        s;
      case _:
        throw 'expected a constant string but is ${code.expr}';
    };
    var file = thx.macro.Macros.getModulePath("thx.culture.Culture"),
        path = file.split("/").slice(0, -1).join("/") + "/cultures/" + name.toLowerCase() + ".json";
    if(!sys.FileSystem.exists(path))
      throw 'invalid code $name';
    var json = haxe.Json.parse(sys.io.File.getContent(path));
    return macro new thx.culture.Culture(
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
      new thx.culture.DateTime(
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
      new thx.culture.Number(
        $v{json.number.decimals},
        $v{json.number.decimalsSeparator},
        $v{json.number.groups},
        $v{json.number.groupsSeparator},
        $v{json.number.patternNegative},
        $v{json.number.patternPositive}
      ),
      new thx.culture.Number(
        $v{json.currency.decimals},
        $v{json.currency.decimalsSeparator},
        $v{json.currency.groups},
        $v{json.currency.groupsSeparator},
        $v{json.currency.patternNegative},
        $v{json.currency.patternPositive}
      ),
      new thx.culture.Number(
        $v{json.percent.decimals},
        $v{json.percent.decimalsSeparator},
        $v{json.percent.groups},
        $v{json.percent.groupsSeparator},
        $v{json.percent.patternNegative},
        $v{json.percent.patternPositive}
      )
    );
  }

  public var native(default, null) : String;
  public var english(default, null) : String;
  public var iso2(default, null) : String;
  public var iso3(default, null) : String;

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
    Culture.register(this);
  }

  public static function cultureFromObject(ob : {
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
    return new Culture(ob.name, ob.native, ob.english, ob.iso2, ob.iso3, ob.pluralRule, Language.languageFromObject(ob.language), DateTime.dateTimeFromObject(ob.date), ob.englishCurrency, ob.nativeCurrency, ob.currencySymbol, ob.currencyIso, ob.englishRegion, ob.nativeRegion, ob.isMetric, ob.digits, ob.signNeg, ob.signPos, ob.symbolNaN, ob.symbolPercent, ob.symbolPermille, ob.symbolNegInf, ob.symbolPosInf, Number.numberFromObject(ob.number), Number.numberFromObject(ob.currency), Number.numberFromObject(ob.percent));

  static var cultures : Map<String, Culture>;
  public static function register(culture : Culture) {
    cultures.set(getNativeKey(culture.native), culture);
    cultures.set(getNameKey(culture.name), culture);
    cultures.set(getIso2Key(culture.iso2), culture);
    cultures.set(getIso3Key(culture.iso3), culture);
    Language.register(culture.language);
  }

  // TODO
  // add load async

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