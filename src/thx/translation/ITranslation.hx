package thx.translation;

import thx.culture.Domain;

interface ITranslation
{
	public var domain(get, set) : Domain;
	public function singular(id : String, ?domainName : String) : String;
	public function plural(ids : String, idp : String, quantifier : Int, ?domainName : String) : String;
}