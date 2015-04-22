import thx.culture.*;

using thx.Arrays;
using thx.Nulls;
using thx.Ints;
using thx.Iterators;
using thx.Strings;

class GenMarkdown {
  public static function main() {
    // open markdown
    var text = sys.io.File.getContent('README.md');

    // list all cultures
    Embed.all();

    var blacklist = ["dv", "dv-MV"];

    var arr = [['code', 'english', 'native', 'ISO2', 'ISO3', 'currency']].concat(Culture.iterator().map(function(cult) {
      return [
        cult.code,
        cult.nameDisplayEnglish,
        blacklist.contains(cult.code) ? '-' : (cult.isRightToLeft ? '&#x202b;' : '') + cult.nameDisplayNative,
        cult.iso2,
        cult.iso3,
        !blacklist.contains(cult.code) && null != cult.number ? (cult.isRightToLeft ? '&#x202b;' : '') + cult.number.symbolCurrency : '-'];
    }).order(function(a, b) return a[0].compare(b[0])));

    var cultures = formatTable(arr);

    // add to markdown
    text = replace(text, 'CULTURES', cultures);

    // save markdown
    sys.io.File.saveContent('README.md', text);
  }

  static function replace(text : String, marker : String, content : String) {
    var parts = text.split('<!-- BEGIN_$marker -->');
    return [parts[0], '<!-- BEGIN_$marker -->\n', content, '\n<!-- END_$marker -->', parts[1].split('<!-- END_$marker -->').pop()].join('\n');
  }

  static function formatTable(arr : Array<Array<String>>) {
    var sizes : Array<Int> = [];
    arr.map(function(row) {
      row.mapi(function(cell, i) {
        sizes[i] = (sizes[i]).or(0).max(haxe.Utf8.length(cell));
      });
    });

    arr.insert(1, sizes.map(Strings.repeat.bind('-', _)));

    return arr.map(function(row) {
      return '| ' + row.mapi(function(cell, i) {
        return cell + ' '.repeat(sizes[i] - haxe.Utf8.length(cell));
      }).join(" | ") + ' |';
    }).join("\n");

  }
}