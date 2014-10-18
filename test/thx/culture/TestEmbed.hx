package thx.culture;

import utest.Assert;

class TestEmbed {
  public function new() { }

  public function testEmbed() {
    var itit = Embed.culture("it-IT");
    Assert.equals("italiano (Italia)", itit.native);
    Assert.equals("italiano", itit.language.native);
  }

  public function testListCultures() {
    var list = Embed.listCultures();
    Assert.contains('it-it', list);
    Assert.contains('en-us', list);
    Assert.contains('en-gb', list);
  }

  public function testListLanguages() {
    var list = Embed.listLanguages();
    Assert.contains('it', list);
    Assert.contains('en', list);
    Assert.contains('fr', list);
  }

  public function testEmbedManyLanguages() {
    Embed.languages(['it', 'en', 'fr']);
    Assert.notNull(Language.getByIso2('fr'));
  }

  public function testEmbedManyCultures() {
    Embed.cultures(['it-it', 'en-gb', 'fr-fr']);
    Assert.notNull(Culture.getByIso2('fr-fr'));
  }
}