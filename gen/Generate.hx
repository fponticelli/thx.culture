import cs.Lib;

import cs.system.globalization.*;

using thx.core.Arrays;
using thx.core.Strings;
import thx.culture.*;
using StringTools;

class Generate {
  static var pattern = ~/^([^(]+)\(([^)]+)\)$/;
  public static function main() {
    var all = Lib.array(CultureInfo.GetCultures(CultureTypes.AllCultures)),
        acc = [],
        nativeName, englishName, nativeRegion, englishRegion;

    for(ci in all) {
      if(pattern.match(ci.NativeName)) {
        nativeName = StringTools.trim(pattern.matched(1));
        nativeRegion = StringTools.trim(pattern.matched(2));

        pattern.match(ci.EnglishName);
        englishName = StringTools.trim(pattern.matched(1));
        englishRegion = StringTools.trim(pattern.matched(2));
      } else {
        nativeName = ci.NativeName;
        englishName = ci.EnglishName;
        nativeRegion = null;
        englishRegion = null;
      }
      var cal = ci.Calendar,
          dateTimeFormat = null,
          numberFormat = null;

      if(!ci.IsNeutralCulture) {
        // DATETIME
        dateTimeFormat = extractDateTimeFormatInfo(ci);

        // NUMBER FORMAT
        numberFormat = extractNumberFormatInfo(ci);

/*
        //ci.CompareInfo; ???
        //ci.Parent; ???
        //ti.ANSICodePage;
        //ti.EBCDICCodePage;
        //ti.MacCodePage;
        //ti.OEMCodePage;
*/
      }

      acc.push({
        displayName    : ci.DisplayName,
        nativeName     : nativeName,
        englishName    : englishName,
        nativeRegion   : nativeRegion,
        englishRegion  : englishRegion,
        code           : ci.Name,
        ietf           : ci.IetfLanguageTag,
        lcid           : ci.LCID,
        isNeutral      : ci.IsNeutralCulture,
        iso2           : ci.TwoLetterISOLanguageName,
        iso3           : ci.ThreeLetterISOLanguageName,
        windows3       : ci.ThreeLetterWindowsLanguageName,
        calendarName   : ('' + cal).split('.').pop().substr(0, -8),
        dateTimeFormat : dateTimeFormat,
        numberFormat   : numberFormat,
        listSeparator  : ci.TextInfo.ListSeparator,
      });
    }

/*
    acc
      .order(function(a, b) return Strings.compare(a.displayName, b.displayName))
      .slice(90, 105)
      .map(function(item) {
        //trace(item);
      });
*/
    var ci = CultureInfo.InvariantCulture;
    var df = extractDateTimeFormatInfo(ci);
    var nf = extractNumberFormatInfo(ci);

    trace(haxe.Json.stringify(nf, null, ' '));
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
      nf.PerMilleSymbol,
      nf.PositiveInfinitySymbol
    );
  }

  public static function extractDateTimeFormatInfo(ci : CultureInfo) {
    var dt  = ci.DateTimeFormat,
        cwr = dt.CalendarWeekRule,
        fdw = dt.FirstDayOfWeek;

    return new DateTimeFormatInfo(
      dt.CalendarWeekRule.getIndex(),
      dt.CalendarWeekRule.getName(),
      dt.AMDesignator,
      dt.PMDesignator,
      fdw.getIndex(),
      fdw.getName(),
      ('' + dt.Calendar).split('.').pop().substr(0, -8),
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
}