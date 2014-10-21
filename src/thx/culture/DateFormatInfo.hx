package thx.culture;

class DateFormatInfo {
  public static var invariant(default, null) : DateFormatInfo = new DateFormatInfo(
    0,
    "FirstDay",
    "AM",
    "PM",
    0,
    "Sunday",
    "Gregorian",
    null,
    ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],
    ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],
    ["Su","Mo","Tu","We","Th","Fr","Sa"],
    ["January","February","March","April","May","June","July","August","September","October","November","December",""],
    ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec",""],
    ["January","February","March","April","May","June","July","August","September","October","November","December",""],
    ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec",""],
    "dddd, dd MMMM yyyy",
    "MM/dd/yyyy",
    "dddd, dd MMMM yyyy HH:mm:ss",
    "yyyy'-'MM'-'dd'T'HH':'mm':'ss",
    "MMMM dd",
    "ddd, dd MMM yyyy HH':'mm':'ss 'GMT'",
    "HH:mm:ss",
    "HH:mm",
    "yyyy'-'MM'-'dd HH':'mm':'ss'Z'",
    "yyyy MMMM",
    "/",
    ":"
  );

  public var calendarWeekRuleIndex(default, null) : Int;
  public var calendarWeekRuleName(default, null) : String;
  public var designatorAm(default, null) : String;
  public var designatorPm(default, null) : String;
  public var firstDayOfWeekIndex(default, null) : Int;
  public var firstDayOfWeekName(default, null) : String;
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
    firstDayOfWeekIndex : Int,
    firstDayOfWeekName : String,
    nameCalendar : String,
    nameCalendarNative : Null<String>,
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
    this.firstDayOfWeekIndex = firstDayOfWeekIndex;
    this.firstDayOfWeekName = firstDayOfWeekName;
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

  public function toObject()
    return {
      calendarWeekRuleIndex : calendarWeekRuleIndex,
      calendarWeekRuleName : calendarWeekRuleName,
      designatorAm : designatorAm,
      designatorPm : designatorPm,
      firstDayOfWeekIndex : firstDayOfWeekIndex,
      firstDayOfWeekName : firstDayOfWeekName,
      nameCalendar : nameCalendar,
      nameCalendarNative : nameCalendarNative,
      nameDays : nameDays,
      nameDaysAbbreviated : nameDaysAbbreviated,
      nameDaysShortest : nameDaysShortest,
      nameMonths : nameMonths,
      nameMonthsAbbreviated : nameMonthsAbbreviated,
      nameMonthGenitives : nameMonthGenitives,
      nameMonthGenitivesAbbreviated : nameMonthGenitivesAbbreviated,
      patternDateLong : patternDateLong,
      patternDateShort : patternDateShort,
      patternDateTimeFull : patternDateTimeFull,
      patternDateTimeSortable : patternDateTimeSortable,
      patternMonthDay : patternMonthDay,
      patternRfc1123 : patternRfc1123,
      patternTimeLong : patternTimeLong,
      patternTimeShort : patternTimeShort,
      patternUniversalSortable : patternUniversalSortable,
      patternYearMonth : patternYearMonth,
      separatorDate : separatorDate,
      separatorTime : separatorTime
    };

  inline public static function fromObject(o : Dynamic)
    return new DateFormatInfo(
      o.calendarWeekRuleIndex,
      o.calendarWeekRuleName,
      o.designatorAm,
      o.designatorPm,
      o.firstDayOfWeekIndex,
      o.firstDayOfWeekName,
      o.nameCalendar,
      o.nameCalendarNative,
      o.nameDays,
      o.nameDaysAbbreviated,
      o.nameDaysShortest,
      o.nameMonths,
      o.nameMonthsAbbreviated,
      o.nameMonthGenitives,
      o.nameMonthGenitivesAbbreviated,
      o.patternDateLong,
      o.patternDateShort,
      o.patternDateTimeFull,
      o.patternDateTimeSortable,
      o.patternMonthDay,
      o.patternRfc1123,
      o.patternTimeLong,
      o.patternTimeShort,
      o.patternUniversalSortable,
      o.patternYearMonth,
      o.separatorDate,
      o.separatorTime
    );
}