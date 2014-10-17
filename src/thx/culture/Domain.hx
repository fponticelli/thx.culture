package thx.culture;

class Domain {
  public var name(default, null) : String;
  public var pluralRule(default, null) : Int;

  public function toString()
    return name;

  function new(name : String, pluralRule : Int) {
    this.name = name;
    this.pluralRule = pluralRule;
  }
}