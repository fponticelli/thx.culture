package thx.culture;

class NumberFormatInfo {
  public static var invariant(default, null) : NumberFormatInfo = new NumberFormatInfo(2, 2, 2, [3], [3], [3], 0, 1, 0, 0, 0, ".", ".", ".", ",", ",", ",", "-", "+", "¤", "NaN", "-Infinity", "%", "‰", "Infinity");

  public var decimalDigitsCurrency(default, null)    : Int;
  public var decimalDigitsNumber(default, null)      : Int;
  public var decimalDigitsPercent(default, null)     : Int;
  public var groupSizesCurrency(default, null)       : Array<Int>;
  public var groupSizesNumber(default, null)         : Array<Int>;
  public var groupSizesPercent(default, null)        : Array<Int>;
  public var patternNegativeCurrency(default, null)  : Int;
  public var patternNegativeNumber(default, null)    : Int;
  public var patternNegativePercent(default, null)   : Int;
  public var patternPositiveCurrency(default, null)  : Int;
  public var patternPositivePercent(default, null)   : Int;
  public var separatorDecimalCurrency(default, null) : String;
  public var separatorDecimalNumber(default, null)   : String;
  public var separatorDecimalPercent(default, null)  : String;
  public var separatorGroupCurrency(default, null)   : String;
  public var separatorGroupNumber(default, null)     : String;
  public var separatorGroupPercent(default, null)    : String;
  public var signNegative(default, null)             : String;
  public var signPositive(default, null)             : String;
  public var symbolCurrency(default, null)           : String;
  public var symbolNaN(default, null)                : String;
  public var symbolNegativeInfinity(default, null)   : String;
  public var symbolPercent(default, null)            : String;
  public var symbolPermille(default, null)           : String;
  public var symbolPositiveInfinity(default, null)   : String;

  public function new(
    decimalDigitsCurrency    : Int,
    decimalDigitsNumber      : Int,
    decimalDigitsPercent     : Int,
    groupSizesCurrency       : Array<Int>,
    groupSizesNumber         : Array<Int>,
    groupSizesPercent        : Array<Int>,
    patternNegativeCurrency  : Int,
    patternNegativeNumber    : Int,
    patternNegativePercent   : Int,
    patternPositiveCurrency  : Int,
    patternPositivePercent   : Int,
    separatorDecimalCurrency : String,
    separatorDecimalNumber   : String,
    separatorDecimalPercent  : String,
    separatorGroupCurrency   : String,
    separatorGroupNumber     : String,
    separatorGroupPercent    : String,
    signNegative             : String,
    signPositive             : String,
    symbolCurrency           : String,
    symbolNaN                : String,
    symbolNegativeInfinity   : String,
    symbolPercent            : String,
    symbolPermille           : String,
    symbolPositiveInfinity   : String
  ) {
    this.decimalDigitsCurrency    = decimalDigitsCurrency;
    this.decimalDigitsNumber      = decimalDigitsNumber;
    this.decimalDigitsPercent     = decimalDigitsPercent;
    this.groupSizesCurrency       = groupSizesCurrency;
    this.groupSizesNumber         = groupSizesNumber;
    this.groupSizesPercent        = groupSizesPercent;
    this.patternNegativeCurrency  = patternNegativeCurrency;
    this.patternNegativeNumber    = patternNegativeNumber;
    this.patternNegativePercent   = patternNegativePercent;
    this.patternPositiveCurrency  = patternPositiveCurrency;
    this.patternPositivePercent   = patternPositivePercent;
    this.separatorDecimalCurrency = separatorDecimalCurrency;
    this.separatorDecimalNumber   = separatorDecimalNumber;
    this.separatorDecimalPercent  = separatorDecimalPercent;
    this.separatorGroupCurrency   = separatorGroupCurrency;
    this.separatorGroupNumber     = separatorGroupNumber;
    this.separatorGroupPercent    = separatorGroupPercent;
    this.signNegative             = signNegative;
    this.signPositive             = signPositive;
    this.symbolCurrency           = symbolCurrency;
    this.symbolNaN                = symbolNaN;
    this.symbolNegativeInfinity   = symbolNegativeInfinity;
    this.symbolPercent            = symbolPercent;
    this.symbolPermille           = symbolPermille;
    this.symbolPositiveInfinity   = symbolPositiveInfinity;
  }

  public function toObject()
    return {
      decimalDigitsCurrency : decimalDigitsCurrency,
      decimalDigitsNumber : decimalDigitsNumber,
      decimalDigitsPercent : decimalDigitsPercent,
      groupSizesCurrency : groupSizesCurrency,
      groupSizesNumber : groupSizesNumber,
      groupSizesPercent : groupSizesPercent,
      patternNegativeCurrency : patternNegativeCurrency,
      patternNegativeNumber : patternNegativeNumber,
      patternNegativePercent : patternNegativePercent,
      patternPositiveCurrency : patternPositiveCurrency,
      patternPositivePercent : patternPositivePercent,
      separatorDecimalCurrency : separatorDecimalCurrency,
      separatorDecimalNumber : separatorDecimalNumber,
      separatorDecimalPercent : separatorDecimalPercent,
      separatorGroupCurrency : separatorGroupCurrency,
      separatorGroupNumber : separatorGroupNumber,
      separatorGroupPercent : separatorGroupPercent,
      signNegative : signNegative,
      signPositive : signPositive,
      symbolCurrency : symbolCurrency,
      symbolNaN : symbolNaN,
      symbolNegativeInfinity : symbolNegativeInfinity,
      symbolPercent : symbolPercent,
      symbolPermille : symbolPermille,
      symbolPositiveInfinity : symbolPositiveInfinity
    };

  inline public static function fromObject(o : Dynamic)
    return new NumberFormatInfo(
      o.decimalDigitsCurrency,
      o.decimalDigitsNumber,
      o.decimalDigitsPercent,
      o.groupSizesCurrency,
      o.groupSizesNumber,
      o.groupSizesPercent,
      o.patternNegativeCurrency,
      o.patternNegativeNumber,
      o.patternNegativePercent,
      o.patternPositiveCurrency,
      o.patternPositivePercent,
      o.separatorDecimalCurrency,
      o.separatorDecimalNumber,
      o.separatorDecimalPercent,
      o.separatorGroupCurrency,
      o.separatorGroupNumber,
      o.separatorGroupPercent,
      o.signNegative,
      o.signPositive,
      o.symbolCurrency,
      o.symbolNaN,
      o.symbolNegativeInfinity,
      o.symbolPercent,
      o.symbolPermille,
      o.symbolPositiveInfinity
    );
}