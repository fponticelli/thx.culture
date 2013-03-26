package thx.culture;

import utest.Assert;

class TestLanguage
{
	public function new() { }

	public function testEmbed()
	{
		var it = Language.embed("it");
		Assert.equals(it.native, "italiano");
	}

	public function testInvariant()
	{
		
	}

	public function testLoad()
	{
		
	}

	public function testLoadPromise()
	{
		
	}
}