abstract class Routes {
  Routes._();

  static const heroAll = Paths.heroAll;
  static const heroSamePower = Paths.heroSamePower;
  static const heroDetails = Paths.heroDetails;
}

abstract class Paths {
  Paths._();

  static const heroAll = '/all';
  static const heroSamePower = '/same-power';
  static const heroDetails = '/details';
}
