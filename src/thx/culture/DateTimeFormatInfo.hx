package thx.culture;

class DateTimeFormatInfo {
  public var calendarWeekRuleIndex(default, null) : Int;
  public var calendarWeekRuleName(default, null) : String;
  public var designatorAm(default, null) : String;
  public var designatorPm(default, null) : String;
  //public var firstDayOfWeek(default, null) : String;
  public var nameCalendar(default, null) : String;
  public var nameCalendarNative(default, null) : Null<String>;
  public var nameDays(default, null) : Array<String>;
  public var nameDaysAbbreviated(default, null) : Array<String>;
  public var nameDaysShortest(default, null) : Array<String>;
  public var nameMonths(default, null) : Array<String>;
  public var nameMonthsAbbreviated(default, null) : Array<String>;
  public var nameMonthGenitives(default, null) : Array<String>;
  public var nameMonthGenitivesAbbreviated(default, null) : Array<String>;
  public var patternDateLong(default, null) : String;
  public var patternDateShort(default, null) : String;
  public var patternDateTimeFull(default, null) : String;
  public var patternDateTimeSortable(default, null) : String;
  public var patternMonthDay(default, null) : String;
  public var patternRfc1123(default, null) : String;
  public var patternTimeLong(default, null) : String;
  public var patternTimeShort(default, null) : String;
  public var patternUniversalSortable(default, null) : String;
  public var patternYearMonth(default, null) : String;
  public var separatorDate(default, null) : String;
  public var separatorTime(default, null) : String;

  public function new(
      calendarWeekRuleIndex : Int,
      calendarWeekRuleName : String,
      designatorAm : String,
      designatorPm : String,
      //firstDayOfWeek : String,
      nameCalendar : Null<String>,
      nameCalendarNative : String,
      nameDays : Array<String>,
      nameDaysAbbreviated : Array<String>,
      nameDaysShortest : Array<String>,
      nameMonths : Array<String>,
      nameMonthsAbbreviated : Array<String>,
      nameMonthGenitives : Array<String>,
      nameMonthGenitivesAbbreviated : Array<String>,
      patternDateLong : String,
      patternDateShort : String,
      patternDateTimeFull : String,
      patternDateTimeSortable : String,
      patternMonthDay : String,
      patternRfc1123 : String,
      patternTimeLong : String,
      patternTimeShort : String,
      patternUniversalSortable : String,
      patternYearMonth : String,
      separatorDate : String,
      separatorTime : String
    ) {
      this.calendarWeekRuleIndex = calendarWeekRuleIndex;
      this.calendarWeekRuleName = calendarWeekRuleName;
      this.designatorAm = designatorAm;
      this.designatorPm = designatorPm;
      //this.firstDayOfWeek = firstDayOfWeek;
      this.nameCalendar = nameCalendar;
      this.nameCalendarNative = nameCalendarNative;
      this.nameDays = nameDays;
      this.nameDaysAbbreviated = nameDaysAbbreviated;
      this.nameDaysShortest = nameDaysShortest;
      this.nameMonths = nameMonths;
      this.nameMonthsAbbreviated = nameMonthsAbbreviated;
      this.nameMonthGenitives = nameMonthGenitives;
      this.nameMonthGenitivesAbbreviated = nameMonthGenitivesAbbreviated;
      this.patternDateLong = patternDateLong;
      this.patternDateShort = patternDateShort;
      this.patternDateTimeFull = patternDateTimeFull;
      this.patternDateTimeSortable = patternDateTimeSortable;
      this.patternMonthDay = patternMonthDay;
      this.patternRfc1123 = patternRfc1123;
      this.patternTimeLong = patternTimeLong;
      this.patternTimeShort = patternTimeShort;
      this.patternUniversalSortable = patternUniversalSortable;
      this.patternYearMonth = patternYearMonth;
      this.separatorDate = separatorDate;
      this.separatorTime = separatorTime;
  }
}