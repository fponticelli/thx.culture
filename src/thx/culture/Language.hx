package thx.culture;

class Language
{
	public var name(default, null) : String;
	public var native(default, null) : String;
	public var english(default, null) : String;
	public var iso2(default, null) : String;
	public var iso3(default, null) : String;
	public var pluralRule(default, null) : Int;
	
	public function toString()
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
		this.name = name;
		this.native = native;
		this.english = english;
		this.iso2 = iso2;
		this.iso3 = iso3;
		this.pluralRule = pluralRule
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
		return new Culture(name, native, english, iso2, iso3, pluralRule);
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
		return new Culture(ob.name, ob.native, ob.english, ob.iso2, ob.iso3, ob.pluralRule);
	}

	static var cultures : Map<String, Culture> = new Map();
	public static function register(culture : Culture)
	{
		cultures.set(getNativeKey(culture), culture.native);
		cultures.set(getNameKey(culture), culture.name);
		cultures.set(getIso2Key(culture), culture.iso2);
		cultures.set(getIso3Key(culture), culture.iso3);
	}

	// TODO
	// add load async
	// add embed (macro)

	public static function getByName(name : String)
		return cultures.get(getNameKey(name));
	public static function getByNativeName(name : String)
		return cultures.get(getNativeKey(name));
	public static function getByIso2(name : String)
		return cultures.get(getIso2Key(name));
	public static function getByIso3(name : String)
		return cultures.get(getIso3Key(name));


	static function getNativeKey(key : String)
		return "NATIVE:"+key;
	static function getNameKey(key : String)
		return "NAME:"+key;
	static function getIso2Key(key : String)
		return "ISO2:"+key;
	static function getIso3Key(key : String)
		return "ISO3:"+key;
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