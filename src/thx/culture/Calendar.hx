package thx.culture;

class Calendar {
  public var currentEra
  public var eras(default, null) : Iterable<Int>;

  function new() {

  }

  public function getEra(date : DateTime) : Int
    return throw new thx.error.AbstractMethod();
  public function getMonth(date : DateTime) : Int
    return throw new thx.error.AbstractMethod();
/**
Era defaults to `currentEra` if not provided.
*/
  public function getMonthsInYear(year : Int, ?era : Int) : Int
    return throw new thx.error.AbstractMethod();
  public function getYear(date : DateTime) : Int
    return throw new thx.error.AbstractMethod();
  public function toDateTime(year : Int, month : Int, day : Int, hour : Int, minute : Int, second : Int, millisecond : Int, era : Int) : DateTime
    return throw new thx.error.AbstractMethod();
}
