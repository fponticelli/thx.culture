import cs.Lib;

import cs.system.globalization.*;

using thx.core.Arrays;
using thx.core.Strings;
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
        var dt = ci.DateTimeFormat;
        dateTimeFormat = {
          designators : {
            am : dt.AMDesignator,
            pm : dt.PMDesignator
          },
          names : {
            days              : Lib.array(dt.DayNames),
            abbreviatedDays   : Lib.array(dt.AbbreviatedDayNames),
            shortestDays      : Lib.array(dt.ShortestDayNames),
            abbreviatedMonthGenitives : Lib.array(dt.AbbreviatedMonthGenitiveNames),
            monthGenitives    : Lib.array(dt.MonthGenitiveNames),
            months            : Lib.array(dt.MonthNames),
            abbreviatedMonths : Lib.array(dt.AbbreviatedMonthNames),
          },
          patterns : {
            fullDateTime      : dt.FullDateTimePattern,
            longDate          : dt.LongDatePattern,
            longTime          : dt.LongTimePattern,
            monthDay          : dt.MonthDayPattern,
            rfc1123           : dt.RFC1123Pattern,
            shortDate         : dt.ShortDatePattern,
            shortTime         : dt.ShortTimePattern,
            sortableDateTime  : dt.SortableDateTimePattern,
            universalSortable : dt.UniversalSortableDateTimePattern,
            yearMonth         : dt.YearMonthPattern,
          },
          calendarName        : ('' + dt.Calendar).split('.').pop().substr(0, -8),
          nativeCalendarName  : try dt.NativeCalendarName catch(e : Dynamic) null,
          calendarWeekRule    : dt.CalendarWeekRule,
          dateSeparator       : dt.DateSeparator,
          firstDayOfWeek      : dt.FirstDayOfWeek,
          timeSeparator       : dt.TimeSeparator,
        };

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

    acc
      //.slice(90, 105)
      //.order(function(a, b) return Strings.compare(a.nativeName, b.nativeName))
      .map(function(item) {
        trace(item);
      });
  }
}