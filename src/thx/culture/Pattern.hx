package thx.culture;

class Pattern {
  public static var currencyNegatives(default, null) : Array<String> = ["($n)","-$n","$-n","$n-","(n$)","-n$","n-$","n$-","-n $","-$ n","n $-","$ n-","$ -n","n- $","($ n)","(n $)"];
  public static var currencyPositives(default, null) : Array<String> = ["$n","n$","$ n","n $"];
  public static var numberNegatives(default, null)   : Array<String> = ["(n)", "-n", "- n", "n-", "n -"];
  public static var percentNegatives(default, null)  : Array<String> = ["-n %", "-n%", "-%n", "%-n", "%n-", "n-%", "n%-", "-%n", "n %-", "% n-", "% -n", "n- %"];
  public static var percentPositives(default, null)  : Array<String> = ["n %", "n%", "%n", "% n"];
}