enum TipoNado { libre, mariposa, pecho, dorso }

extension TextoTipoNado on TipoNado {
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
