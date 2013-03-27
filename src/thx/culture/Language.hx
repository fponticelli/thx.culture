package thx.culture;

#if macro
import haxe.macro.Expr;
#end

class Language extends Domain
{
	public static var invariant(default, null) : Language = embed("en");

	macro public static function embed(code : Expr) 
	{
		var name = switch (code.expr) {
			case EConst(CString(s)):
				s;
			case _:
				throw 'expected a constant string but is ${code.expr}';
		};
		var file = thx.macro.Macros.getModulePath("thx.culture.Language"),
			path = file.split("/").slice(0, -1).join("/") + "/languages/" + name.toLowerCase() + ".json";
		if(!sys.FileSystem.exists(path))
			throw 'invalid code $name';
		var json = haxe.Json.parse(sys.io.File.getContent(path));
		return macro new Language(
			$v{json.name},
			$v{json.native},
			$v{json.english},
			$v{json.iso2},
			$v{json.iso3},
			$v{json.pluralRule}
		);
	}

	public var native(default, null) : String;
	public var english(default, null) : String;
	public var iso2(default, null) : String;
	public var iso3(default, null) : String;
	
	override public function toString()
	{
		return native + " (" + english + ")";
	}

	function new(
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int
	) {
		super(name, pluralRule);
		this.native = native;
		this.english = english;
		this.iso2 = iso2;
		this.iso3 = iso3;
		Language.register(this);
	}

	public static function create(
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int
	)
	{
		return new Language(name, native, english, iso2, iso3, pluralRule);
	}

	public static function createFromObject(ob : {
		name : String, 
		native : String,
		english : String,
		iso2 : String,
		iso3 : String,
		pluralRule : Int
	})
	{
		return new Language(ob.name, ob.native, ob.english, ob.iso2, ob.iso3, ob.pluralRule);
	}

	static var languages : Map<String, Language>;
	public static function register(language : Language)
	{
		languages.set(getNativeKey(language.native), language);
		languages.set(getNameKey(language.name), language);
		languages.set(getIso2Key(language.iso2), language);
		languages.set(getIso3Key(language.iso3), language);
	}

	// TODO
	// add load async
	// add embed (macro)

	public static function getByName(name : String, ?alt : Language)
		return languages.exists(getNameKey(name)) ? languages.get(getNameKey(name)) : (null == alt ? invariant : alt);
	public static function getByNativeName(name : String, ?alt : Language)
		return languages.exists(getNativeKey(name)) ? languages.get(getNativeKey(name)) : (null == alt ? invariant : alt);
	public static function getByIso2(name : String, ?alt : Language)
		return languages.exists(getIso2Key(name)) ? languages.get(getIso2Key(name)) : (null == alt ? invariant : alt);
	public static function getByIso3(name : String, ?alt : Language)
		return languages.exists(getIso3Key(name)) ? languages.get(getIso3Key(name)) : (null == alt ? invariant : alt);


	static function getNativeKey(key : String)
		return "NATIVE:"+key;
	static function getNameKey(key : String)
		return "NAME:"+key;
	static function getIso2Key(key : String)
		return "ISO2:"+key;
	static function getIso3Key(key : String)
		return "ISO3:"+key;

	static function __init__()
	{
		languages = new Map();
	}
}

/*
class Language extends Info
{
	@:isVar static var languages(get_languages, null) : Map<String, Language>;
	static function get_languages()
	{
		if (null == languages)
			languages = new Map ();
		return languages;
	}

	public static function get(name : String) : Language {
		return languages.get(name.toLowerCase());
	}

	public static function names() {
		return languages.keys();
	}

	public static function add(language : Language) {
		if(!languages.exists(language.iso2))
			languages.set(language.iso2, language);
	}
}
*/