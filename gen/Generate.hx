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
        var nf = ci.NumberFormat;
        numberFormat = {
          currency : {
            decimalDigits    : nf.CurrencyDecimalDigits,
            decimalSeparator : nf.CurrencyDecimalSeparator,
            groupSeparator   : nf.CurrencyGroupSeparator,
            groupSizes       : Lib.array(nf.CurrencyGroupSizes),
            negativePattern  : nf.CurrencyNegativePattern,
            positivePattern  : nf.CurrencyPositivePattern,
            symbol           : nf.CurrencySymbol,
          },
          number : {
            decimalDigits    : nf.NumberDecimalDigits,
            decimalSeparator : nf.NumberDecimalSeparator,
            groupSeparator   : nf.NumberGroupSeparator,
            groupSizes       : Lib.array(nf.NumberGroupSizes),
            negativePattern  : nf.NumberNegativePattern,
          },
          percent : {
            perMilleSymbol   : nf.PerMilleSymbol,
            decimalDigits    : nf.PercentDecimalDigits,
            decimalSeparator : nf.PercentDecimalSeparator,
            groupSeparator   : nf.PercentGroupSeparator,
            groupSizes       : nf.PercentGroupSizes,
            negativePattern  : nf.PercentNegativePattern,
            positivePattern  : nf.PercentPositivePattern,
          },
          //digitSubstitution  : nf.DigitSubstitution.getName(),
          naNSymbol              : nf.NaNSymbol,
          //nativeDigits       : Lib.array(nf.NativeDigits),
          negativeInfinitySymbol : nf.NegativeInfinitySymbol,
          negativeSign           : nf.NegativeSign,
          positiveInfinitySymbol : nf.PositiveInfinitySymbol,
          positiveSign           : nf.PositiveSign,
        };

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

    trace(haxe.Json.stringify(df, null, ' '));
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