package thx.culture;

#if macro
using thx.Arrays;
using thx.Strings;
#end

class Embed {
  macro public static function all() {
    var values = listFiles('cultures'),
        s = '{\n' + values.map(function(code) return 'Embed.culture("$code");').join("\n") + '\n}';
    return haxe.macro.Context.parse(s, haxe.macro.Context.currentPos());
  }

  macro public static function cultures(codes : ExprOf<Array<String>>) {
    var values = switch codes.expr {
      case EArrayDecl(arr): arr.map(function(e) return switch e.expr {
        case EConst(CString(code)): code;
        case _: haxe.macro.Context.error('the passed array contains non literal strings', codes.pos);
      });
      case _: haxe.macro.Context.error('the "cultures" function only accepts an array literal of strings', codes.pos);
    }

    var s = '{\n' + values.map(function(code) return 'Embed.culture("$code");').join("\n") + '\n}';

    return haxe.macro.Context.parse(s, codes.pos);
  }

  macro public static function list() {
    var arr = listFiles('cultures');
    return macro $v{arr};
  }

  macro public static function culture(code : haxe.macro.Expr) {
    var json = readJsonFromCode("cultures", code);
    return macro thx.culture.Culture.register(thx.culture.Culture.fromObject($v{json}));
  }


#if macro
  static function listFiles(dir : String) {
    var path  = '${getPath()}/$dir/',
        files = sys.FileSystem.readDirectory(path);
    files.order(function(a, b) return Strings.compare(a, b));
    return files.map(function(o) return o.split('.').shift());
  }

  static function getPath() {
    var file = thx.macro.Macros.getModulePath('thx.culture.Culture');
    return file.split("/").slice(0, -1).join("/");
  }

  static function getString(code : haxe.macro.Expr) {
    return switch code.expr {
      case EConst(CString(s)): s;
      case _: haxe.macro.Context.error('expected a constant string but is ${code.expr}', code.pos);
    };
  }

  static function readJsonFromCode(ref : String, code : haxe.macro.Expr) : Dynamic {
    var name = getString(code);
    return readJson(ref, name, code.pos);
  }

  static function readJson(ref : String, code : String, pos) : Dynamic {
    var path = '${getPath()}/$ref/${code.toLowerCase()}.json';
    if(!sys.FileSystem.exists(path))
      haxe.macro.Context.error('invalid code $code', pos);
    return haxe.Json.parse(sys.io.File.getContent(path));
  }
#end
}
