import cs.system.globalization.*;

using thx.core.Arrays;
using thx.core.Strings;
using StringTools;

class Generate {
  static var pattern = ~/^([^(]+)\(([^)]+)\)$/;
  public static function main() {
    var all = cs.Lib.array(CultureInfo.GetCultures(CultureTypes.AllCultures)),
        acc = [],
        nameNative, nameEnglish, regionNative, regionEnglish;

    for(ci in all) {
      if(pattern.match(ci.NativeName)) {
        nameNative = StringTools.trim(pattern.matched(1));
        regionNative = StringTools.trim(pattern.matched(2));

        pattern.match(ci.EnglishName);
        nameEnglish = StringTools.trim(pattern.matched(1));
        regionEnglish = StringTools.trim(pattern.matched(2));
      } else {
        nameNative = ci.NativeName;
        nameEnglish = ci.EnglishName;
        regionNative = null;
        regionEnglish = null;
      }
      acc.push({
        nameNative    : nameNative,
        nameEnglish   : nameEnglish,
        regionNative  : regionNative,
        regionEnglish : regionEnglish,
        code          : ci.Name,
        ietf          : ci.IetfLanguageTag,
        lcid          : ci.LCID,
        isNeutral     : ci.IsNeutralCulture,
        iso2          : ci.TwoLetterISOLanguageName,
        iso3          : ci.ThreeLetterISOLanguageName,
        windows3      : ci.ThreeLetterWindowsLanguageName,

/*
        //ci.Calendar;
        //ci.CompareInfo;
        //ci.DateTimeFormat;
        //ci.NumberFormat;
        //ci.OptionalCalendars;
        //ci.Parent;
        //ci.TextInfo;
*/
      });
    }

    acc
      .slice(90, 105)
      //.order(function(a, b) return Strings.compare(a.nameNative, b.nameNative))
      .map(function(item) {
        trace(item);
      });
  }
}