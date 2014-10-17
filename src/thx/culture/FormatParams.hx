/**
 * ...
 * @author Franco Ponticelli
 */

package thx.culture;

using thx.core.Arrays;

class FormatParams {
  public static function cleanQuotes(p : String) {
    if (p.length <= 1)
      return p;
    var f = p.substr(0, 1);
    if (('"' == f || "'" == f) && p.substr( -1) == f)
      return p.substr(1, p.length - 2);
    else
      return p;
  }

  public static function parse(params : String) : Array<String> {
    var parts = params.split(":");
    return [parts[0]].concat(parts.length == 1 ? [] : parts.slice(1).join(":").split(",").mapi(function(s, i) if (0 == i) return s else return cleanQuotes(s)));
  }

  // TODO: add support for nested formats (usefull for Arrays.format)
  public static function params(ps : Array<String>, alt : String) {
    if (null == ps || ps.length == 0)
      return [alt];
    else
      return ps;
  }
}