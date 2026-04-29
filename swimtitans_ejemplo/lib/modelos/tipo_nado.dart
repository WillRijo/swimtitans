enum TipoNado { libre, mariposa, pecho, dorso }

extension InfoTipoNado on TipoNado {
  String get etiqueta {
    switch (this) {
      case TipoNado.libre:
        return 'Libre';
      case TipoNado.mariposa:
        return 'Mariposa';
      case TipoNado.pecho:
        return 'Pecho';
      case TipoNado.dorso:
        return 'Dorso';
    }
  }

  String get rutaImagen {
    switch (this) {
      case TipoNado.libre:
        return 'assets/images/swimmers/swimmer_freestyle.png';
      case TipoNado.mariposa:
        return 'assets/images/swimmers/swimmer_butterfly.png';
      case TipoNado.pecho:
        return 'assets/images/swimmers/swimmer_breaststroke.png';
      case TipoNado.dorso:
        return 'assets/images/swimmers/swimmer_backstroke.png';
    }
  }

  double get avancePorAccion {
    switch (this) {
      case TipoNado.libre:
        return 3;
      case TipoNado.mariposa:
        return 5;
      case TipoNado.pecho:
        return 4;
      case TipoNado.dorso:
        return 3;
    }
  }
}
