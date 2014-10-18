package thx.culture;

class Embed {
  macro public static function language(code : haxe.macro.Expr) {
    var json = readJson('languages', code);
    return macro thx.culture.Language.register(new Language(
      $v{json.name},
      $v{json.native},
      $v{json.english},
      $v{json.iso2},
      $v{json.iso3},
      $v{json.pluralRule}
    ));
  }

  macro public static function culture(code : haxe.macro.Expr) {
   var json = readJson("cultures", code);
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
  static function getPath() {
    var file = thx.macro.Macros.getModulePath('thx.culture.Culture');
    return file.split("/").slice(0, -1).join("/");
  }

  public static function readJson(ref : String, code : haxe.macro.Expr) : Dynamic {
    var name = switch code.expr {
      case EConst(CString(s)): s;
      case _: throw 'expected a constant string but is ${code.expr}';
    };
    var path = getPath() + '/$ref/' + name.toLowerCase() + ".json";
    if(!sys.FileSystem.exists(path))
      haxe.macro.Context.error('invalid code $name', code.pos);
    return haxe.Json.parse(sys.io.File.getContent(path));
  }
#end
}