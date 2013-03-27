package thx.translation;

import thx.culture.Domain;
import thx.culture.Language;
import thx.translation.ITranslation;
import thx.translation.PluralForms;

class Translation implements ITranslation
{
	@:isVar public var domain(get, set) : Domain;
	public var missingKeyCallback : String -> String -> Void;

	var domains : Map<String, Domain>;
	var translations : Map<String, Map<String, Array<String>>>;

	public function new(?domain : Domain)
	{
		translations = new Map();
		domains  = new Map();
		if(null != domain)
			addDomain(domain);
		missingKeyCallback = function(domainName : String, key : String) { }
	}

	public function addDomain(domain : Domain)
	{
		if(null == domain)
			throw "invalid null for argument domain";
		if(domains.exists(domain.name))
			throw "domain already added: " + domain;
		translations.set(domain.name, new Map());

		if (null == this.domain)
			this.domain = domain;
	}

	public function addPo2JsonObject(ob : Dynamic)
	{
		for(domainName in Reflect.fields(ob)) {
			if(domainName == "")
				continue; // skip configuration block
			if(!domains.exists(domainName))
			{
				// try loading the domain from Languages
				var domain = Language.getByName(domainName);
				if(null == domain)
					throw 'loaded domain $domainName doesn\'t match any language in the registered languages';
				addDomain(domain);
			}

			var t = translations.get(domainName),
				dob = Reflect.field(ob, domainName);
			for(key in Reflect.fields(dob))
			{
				if(key == "") continue;
				var v : Array<String> = Reflect.field(dob, key);
				t.set(key, v.slice(1));
			}
		}
	}

	public function addSingular(id : String, text : String, ?domainName : String)
	{
		if (null == domainName)
			domainName = this.domain.name;
		translations.get(domainName).set(id, [text]);
	}

	public function addPlural(ids : String, idp : String, texts : Array<String>, ?domainName : String)
	{
		if (null == domainName)
			domainName = this.domain.name;
		translations.get(domainName).set(idp, texts);
	}

	public function singular(id : String, ?domainName : String) : String
	{
		if (null == domainName)
			domainName = this.domain.name;
		var v = translations.get(domainName).get(id);
		if (null == v) {
			missingKeyCallback(domainName, id);
			return id;
		}
		else
			return v[0];
	}

	public function plural(ids : String, idp : String, quantifier : Int, ?domainName : String) : String
	{
		if (null == domainName)
			domainName = this.domain.name;

		var index = PluralForms.pluralRules[domains.get(domainName).pluralRule](quantifier);
		var v = translations.get(domainName).get(idp);
		if (null == v || v[index] == null)
		{
			if (null != ids && quantifier == 1) {
				missingKeyCallback(domainName, ids);
				return ids;
			} else {
				missingKeyCallback(domainName, idp);
				return idp;
			}
		} else
			return v[index];
	}

	function get_domain()
		return domain;

	function set_domain(domain : Domain)
		return this.domain = domain;
}