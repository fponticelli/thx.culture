package thx.culture;

import utest.Assert;
using thx.culture.Format;

class TestFormat 
{
	var culture : Culture;
	public function new()
	{
		culture = Culture.invariant;
	}
	
	public function testFloat()
	{
		Assert.equals("0.10",	(0.1).formatFloat(culture));
		Assert.equals("0",		(0.1).formatFloat("I", culture));
	}
	
	public function testFloatF()
	{
		Assert.equals("0.10", Format.formatFloatf(culture)(0.1));
	}
	
	public function testString()
	{
		Assert.equals("CAB", Format.format("{2}{0}{1}", ["A", "B", "C"], culture));
		Assert.equals("C.A.B", Format.format("{2}.{0}.{1}", ["A", "B", "C"], culture));
		Assert.equals("X.", Format.format("{0:T,1,.}", ["XYZ"], culture));
		Assert.equals("{0INVALIDMODIFIER}", Format.format("{0INVALIDMODIFIER}", ["X"], culture));
		Assert.equals("$1,000.01", Format.format("{0:C}", [1000.01], culture));
		Assert.equals("€ 1.000,01", Format.format("{0:C}", [1000.01], Culture.embed("it-it")));
	}
	
	public function testObject()
	{
		Assert.equals("{}", Format.format("{0}", [{}], culture));
	}

	public function testArray()
	{
		var values = [1, .01, 6];
		Assert.equals("1, 0.01, 6", values.formatArray(culture));
		Assert.equals("$1.00, $0.01, $6.00", values.formatArray("J:C", culture));
		Assert.equals("[]", [].formatArray("J", culture));
		Assert.equals("empty", [].formatArray("J:C,empty", culture));
		Assert.equals("$1.00;$0.01;$6.00", values.formatArray("J:C,'',';'", culture));
		Assert.equals("$1.00;$0.01 ...", values.formatArray("J:C,'',';',2", culture));
		Assert.equals("$1.00;$0.01 ... more", values.formatArray("J:C,'',';',2,' ... more'", culture));

		Assert.equals("0", [].formatArray("C", culture));
		Assert.equals("3", values.formatArray("C", culture));
	}
}