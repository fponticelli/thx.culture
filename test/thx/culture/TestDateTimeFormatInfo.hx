package thx.culture;

import utest.Assert;

class TestDateTimeFormatInfo {
  public function new() { }

  public function testInvariant() {
    var dt = DateTimeFormatInfo.invariant;

    Assert.equals('Gregorian', dt.nameCalendar);
    Assert.equals('Sunday', dt.firstDayOfWeekName);
    Assert.equals('AM', dt.designatorAm);
    Assert.equals('PM', dt.designatorPm);
    Assert.equals('January', dt.nameMonths[0]);
  }
}