enum SwimStroke { freestyle, butterfly, breaststroke, backstroke }

extension SwimStrokeInfo on SwimStroke {
  String get label {
    switch (this) {
      case SwimStroke.freestyle:
        return 'Libre';
      case SwimStroke.butterfly:
        return 'Mariposa';
      case SwimStroke.breaststroke:
        return 'Pecho';
      case SwimStroke.backstroke:
        return 'Dorso';
    }
  }

  String get assetPath {
    switch (this) {
      case SwimStroke.freestyle:
        return 'assets/images/swimmers/swimmer_freestyle.png';
      case SwimStroke.butterfly:
        return 'assets/images/swimmers/swimmer_butterfly.png';
      case SwimStroke.breaststroke:
        return 'assets/images/swimmers/swimmer_breaststroke.png';
      case SwimStroke.backstroke:
        return 'assets/images/swimmers/swimmer_backstroke.png';
    }
  }
}
