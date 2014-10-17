#!/bin/sh
rm thx.culture.zip
zip -r thx.culture.zip hxml src test doc/ImportCulture.hx extraParams.hxml haxelib.json README.md test test.hxml
haxelib submit thx.culture.zip