package thx.culture;

#if macro
using thx.core.Arrays;
#end

class Embed {
  macro public static function allCultures() {
    var values = listFiles('cultures'),
        s = '{\n' + values.map(function(code) return 'Embed.culture("$code");').join("\n") + '\n}';
    return haxe.macro.Context.parse(s, haxe.macro.Context.currentPos());
  }

  macro public static function allLanguages() {
    var values = listFiles('languages'),
        s = '{\n' + values.map(function(code) return 'Embed.language("$code");').join("\n") + '\n}';
    return haxe.macro.Context.parse(s, haxe.macro.Context.currentPos());
  }

  macro public static function cultures(codes : ExprOf<Array<String>>) {
    var values = switch codes.expr {
      case EArrayDecl(arr): arr.map(function(e) return switch e.expr {
        case EConst(CString(code)): code;
        case _: haxe.macro.Context.error('the passed array contains non literal strings', codes.pos);
      });
      case _: haxe.macro.Context.error('the "cultures" function only accepts an array literal of strings', codes.pos);
    }

    var s = '{\n' + values.map(function(code) return 'Embed.culture("$code");').join("\n") + '\n}';

    return haxe.macro.Context.parse(s, codes.pos);
  }

  macro public static function listCultures() {
    var arr = listFiles('cultures');
    return macro $v{arr};
  }

  macro public static function listLanguages() {
    var arr = listFiles('languages');
    return macro $v{arr};
  }

  macro public static function languages(codes : ExprOf<Array<String>>) {
    var values = switch codes.expr {
      case EArrayDecl(arr): arr.map(function(e) return switch e.expr {
        case EConst(CString(code)): code;
        case _: haxe.macro.Context.error('the passed array contains non literal strings', codes.pos);
      });
      case _: haxe.macro.Context.error('the "languages" function only accepts an array literal of strings', codes.pos);
    }

    var s = '{\n' + values.map(function(code) return 'Embed.language("$code");').join("\n") + '\n}';

    return haxe.macro.Context.parse(s, codes.pos);
  }

  macro public static function language(code : haxe.macro.Expr) {
    var json = readJsonFromCode('languages', code);
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
    var json = readJsonFromCode("cultures", code);
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
  static function listFiles(dir : String) {
    var path  = '${getPath()}/$dir/',
        files = sys.FileSystem.readDirectory(path);
    return Arrays.pluck(files, _.split('.').shift());
  }

  static function getPath() {
    var file = thx.macro.Macros.getModulePath('thx.culture.Culture');
    return file.split("/").slice(0, -1).join("/");
  }

  static function getString(code : haxe.macro.Expr) {
    return switch code.expr {
      case EConst(CString(s)): s;
      case _: haxe.macro.Context.error('expected a constant string but is ${code.expr}', code.pos);
    };
  }

  static function readJsonFromCode(ref : String, code : haxe.macro.Expr) : Dynamic {
    var name = getString(code);
    return readJson(ref, name, code.pos);
  }

  static function readJson(ref : String, code : String, pos) : Dynamic {
    var path = '${getPath()}/$ref/${code.toLowerCase()}.json';
    if(!sys.FileSystem.exists(path))
      haxe.macro.Context.error('invalid code $code', pos);
    return haxe.Json.parse(sys.io.File.getContent(path));
  }
#end
}