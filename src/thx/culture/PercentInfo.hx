package thx.culture;

class PercentInfo {
  public static var negativePatterns(default, null) : Array<String> = ["-n %", "-n%", "-%n", "%-n", "%n-", "n-%", "n%-", "-%n", "n %-", "% n-", "% -n", "n- %"];
  public static var positivePatterns(default, null) : Array<String> = ["n %", "n%", "%n", "% n"];
}