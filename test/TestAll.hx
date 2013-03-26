import utest.Runner;
import utest.ui.Report;

class TestAll
{
	public static function addTests(runner : Runner)
	{
		runner.addCase(new thx.culture.TestCulture());
		runner.addCase(new thx.culture.TestFormat());
		runner.addCase(new thx.culture.TestLanguage());
	}

	public static function main()
	{
		var runner = new Runner();
		addTests(runner);
		Report.create(runner);
		runner.run();
	}
}