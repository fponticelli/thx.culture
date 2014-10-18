package thx.culture;

import utest.Assert;

class TestCulture {
  public function new() { }

  public function testEmbed() {
    var itit = Embed.culture("it-IT");
    Assert.equals("italiano (Italia)", itit.native);
    Assert.equals("italiano", itit.language.native);
  }
}