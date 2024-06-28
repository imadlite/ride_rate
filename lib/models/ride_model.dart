class RideModel {
  double value;
  RideModel(this.value);

  String get expression {
    if (value < 2) {
      return "Bad";
    } else if (value < 3) {
      return "Good";
    } else {
      return "OK";
    }
  }
}
