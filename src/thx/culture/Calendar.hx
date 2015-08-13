package thx.culture;

class Calendar {
  public var currentEraValue(default, null) : Int;

  public function new(currentEraValue : Int) {
    this.currentEraValue = currentEraValue;
  }
}
