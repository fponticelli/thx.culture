package thx.culture;

import utest.Assert;
import thx.culture.Pattern;

class TestNumberFormatInfo {
  public function new() { }

  public function testInvariant() {
    var n = NumberFormatInfo.invariant;

    Assert.same([3], n.groupSizesNumber);
    Assert.equals('.', n.separatorDecimalNumber);
    Assert.equals(',', n.separatorGroupNumber);
    Assert.equals('-', n.signNegative);
    Assert.equals('+', n.signPositive);
    Assert.equals('NaN', n.symbolNaN);
  }
}