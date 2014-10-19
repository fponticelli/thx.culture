package thx.culture;

class CurrencyInfo {
  public static var negativePatterns(default, null) : Array<String> = ["($n)","-$n","$-n","$n-","(n$)","-n$","n-$","n$-","-n $","-$ n","n $-","$ n-","$ -n","n- $","($ n)","(n $)"];
  public static var positivePatterns(default, null) : Array<String> = ["$n","n$","$ n","n $"];
}