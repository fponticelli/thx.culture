package thx.culture;

import utest.Assert;

class TestCulture 
{
	public function new() { }

	public function testEmbed()
	{
		var itit = Culture.embed("it-it");
		Assert.equals("italiano (Italia)", itit.native);
		Assert.equals("italiano", itit.language.native);
	}
}