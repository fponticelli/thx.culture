import cs.Lib;
import cs.system.globalization.*;
import sys.FileSystem;

using thx.Arrays;
using thx.Functions;
using thx.Strings;
import thx.culture.*;
using StringTools;

class Generate {
  static var path = 'src/thx/culture/cultures';
  public static function main() {
    // cleanup
    try FileSystem.readDirectory(path).map(function (file) {
      FileSystem.deleteFile('$path/$file');
    }) catch(e : Dynamic) {};
    try FileSystem.deleteDirectory(path) catch (e : Dynamic) { }

    // create dir
    FileSystem.createDirectory(path);

    Lib.array(CultureInfo.GetCultures(CultureTypes.AllCultures))
      .filter.fn(null != _)
      .map(extractCulture)
      .filter.fn("" != _.code)
      .map(function(culture) {
        var code = culture.code.toLowerCase(),
            file = '$path/$code.json',
            json = haxe.Json.stringify(culture.toObject(), '  ');
        sys.io.File.saveContent(file, json);
      });
  }

  static var patternExtractNames = ~/^([^(]+)\(([^)]+)\)$/;
  public static function extractCulture(ci : CultureInfo) {
    var nativeName, englishName, nativeRegion, englishRegion;
    if(patternExtractNames.match(ci.NativeName)) {
      nativeName = StringTools.trim(patternExtractNames.matched(1));
      nativeRegion = StringTools.trim(patternExtractNames.matched(2));
      if (patternExtractNames.match(ci.EnglishName)) {
        englishName = StringTools.trim(patternExtractNames.matched(1));
        englishRegion = StringTools.trim(patternExtractNames.matched(2));
      } else {
        englishName = ci.EnglishName;
        englishRegion = null;
      }
    } else {
      nativeName = ci.NativeName;
      englishName = ci.EnglishName;
      nativeRegion = null;
      englishRegion = null;
    }
    var dateTimeFormat = null,
        numberFormat = null;

    if(!ci.IsNeutralCulture) {
      // DATETIME
      dateTimeFormat = extractDateFormatInfo(ci);

      // NUMBER FORMAT
      numberFormat = extractNumberFormatInfo(ci);

/*
      //ci.CompareInfo; ???
      //ti.ANSICodePage;
      //ti.EBCDICCodePage;
      //ti.MacCodePage;
      //ti.OEMCodePage;
*/
    }

    return new thx.culture.Culture(
      ci.Name,
      dateTimeFormat,
      ci.IetfLanguageTag,
      ci.IsNeutralCulture,
      ci.TwoLetterISOLanguageName,
      ci.ThreeLetterISOLanguageName,
      ci.TextInfo.IsRightToLeft,
      ci.LCID,
      extractCalendarName(ci.Calendar),
      englishName,
      nativeName,
      englishRegion,
      nativeRegion,
      numberFormat,
      ci.TextInfo.ListSeparator,
      ci.ThreeLetterWindowsLanguageName
    );
  }

  public static function extractNumberFormatInfo(ci : CultureInfo) {
    var nf = ci.NumberFormat;
/*
    //digitSubstitution  : nf.DigitSubstitution.getName(),
    //nativeDigits       : Lib.array(nf.NativeDigits),
*/
    return new NumberFormatInfo(
      nf.CurrencyDecimalDigits,
      nf.NumberDecimalDigits,
      nf.PercentDecimalDigits,
      Lib.array(nf.CurrencyGroupSizes),
      Lib.array(nf.NumberGroupSizes),
      Lib.array(nf.PercentGroupSizes),
      nf.CurrencyNegativePattern,
      nf.NumberNegativePattern,
      nf.PercentNegativePattern,
      nf.CurrencyPositivePattern,
      nf.PercentPositivePattern,
      nf.CurrencyDecimalSeparator,
      nf.NumberDecimalSeparator,
      nf.PercentDecimalSeparator,
      nf.CurrencyGroupSeparator,
      nf.NumberGroupSeparator,
      nf.PercentGroupSeparator,
      nf.NegativeSign,
      nf.PositiveSign,
      nf.CurrencySymbol,
      nf.NaNSymbol,
      nf.NegativeInfinitySymbol,
      nf.PercentSymbol,
      nf.PerMilleSymbol,
      nf.PositiveInfinitySymbol
    );
  }

  public static function extractDateFormatInfo(ci : CultureInfo) {
    var dt  = ci.DateTimeFormat,
        cwr = dt.CalendarWeekRule,
        fdw = dt.FirstDayOfWeek;

    return new DateFormatInfo(
      dt.CalendarWeekRule.getIndex(),
      dt.CalendarWeekRule.getName(),
      dt.AMDesignator,
      dt.PMDesignator,
      fdw.getIndex(),
      fdw.getName(),
      extractCalendarName(dt.Calendar),
      try dt.NativeCalendarName catch(e : Dynamic) null,
      Lib.array(dt.DayNames),
      Lib.array(dt.AbbreviatedDayNames),
      Lib.array(dt.ShortestDayNames),
      Lib.array(dt.MonthNames),
      Lib.array(dt.AbbreviatedMonthNames),
      Lib.array(dt.MonthGenitiveNames),
      Lib.array(dt.AbbreviatedMonthGenitiveNames),
      dt.LongDatePattern,
      dt.ShortDatePattern,
      dt.FullDateTimePattern,
      dt.SortableDateTimePattern,
      dt.MonthDayPattern,
      dt.RFC1123Pattern,
      dt.LongTimePattern,
      dt.ShortTimePattern,
      dt.UniversalSortableDateTimePattern,
      dt.YearMonthPattern,
      dt.DateSeparator,
      dt.TimeSeparator
    );
  }

  public static function extractCalendarName(cal : Calendar)
    return ('' + cal).split('.').pop().substr(0, -8);
}
