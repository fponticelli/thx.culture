import thx.culture.*;

using thx.core.Arrays;
using thx.core.Defaults;
using thx.core.Ints;
using thx.core.Iterators;
using thx.core.Strings;

class GenMarkdown {
  public static function main() {
    // open markdown
    var text = sys.io.File.getContent('README.md');

    // list all cultures
    Embed.allCultures();

    var arr = [['english', 'native', 'ISO2', 'ISO3', 'currency', 'symbol']].concat(Culture.iterator().map(function(cult) {
      return [cult.english, cult.native, cult.iso2, cult.iso3, cult.currencyIso, cult.currencySymbol];
    }).order(function(a, b) return a[0].compare(b[0])));

    var cultures = formatTable(arr);

    // add to markdown
    text = replace(text, 'CULTURES', cultures);

    // list all languages
    Embed.allLanguages();

    var arr = [['english', 'native', 'ISO2', 'ISO3']].concat(Language.iterator().map(function(lang) {
      return [lang.english, lang.native, lang.iso2, lang.iso3];
    }).order(function(a, b) return a[0].compare(b[0])));

    var languages = formatTable(arr);

    // add to markdown
    text = replace(text, 'LANGUAGES', languages);

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