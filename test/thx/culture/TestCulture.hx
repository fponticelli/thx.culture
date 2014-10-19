package thx.culture;

import utest.Assert;
import thx.culture.Culture;

class TestCulture {
  public function new() { }

  public function testInvariant() {
    Assert.isFalse(Culture.invariant.isNeutral);
    Assert.isFalse(Culture.invariant.isRightToLeft);
    Assert.equals("", Culture.invariant.code);
    Assert.equals("iv", Culture.invariant.iso2);
    Assert.equals("IVL", Culture.invariant.iso3);
    Assert.equals("Invariant Language", Culture.invariant.nameEnglish);
    Assert.equals("Invariant Language", Culture.invariant.nameNative);
  }
}