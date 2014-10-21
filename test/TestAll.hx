import utest.Runner;
import utest.ui.Report;

class TestAll {
  public static function addTests(runner : Runner) {
    runner.addCase(new thx.culture.TestCulture());
    runner.addCase(new thx.culture.TestDateFormatInfo());
    runner.addCase(new thx.culture.TestNumberFormatInfo());
    runner.addCase(new thx.culture.TestEmbed());
  }

  public static function main() {
    var runner = new Runner();
    addTests(runner);
    Report.create(runner);
    runner.run();
  }
}