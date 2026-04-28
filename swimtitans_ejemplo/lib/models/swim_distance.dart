enum SwimDistance { fifty, oneHundred, twoHundred }

extension SwimDistanceInfo on SwimDistance {
  String get label {
    switch (this) {
      case SwimDistance.fifty:
        return '50 m';
      case SwimDistance.oneHundred:
        return '100 m';
      case SwimDistance.twoHundred:
        return '200 m';
    }
  }

  double get targetProgress {
    switch (this) {
      case SwimDistance.fifty:
        return 100;
      case SwimDistance.oneHundred:
        return 200;
      case SwimDistance.twoHundred:
        return 400;
    }
  }
}
