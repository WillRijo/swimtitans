enum DistanciaNado { metros50, metros100, metros200, metros400 }

extension DatosDistanciaNado on DistanciaNado {
  String get etiqueta {
    switch (this) {
      case DistanciaNado.metros50:
        return '50 m';
      case DistanciaNado.metros100:
        return '100 m';
      case DistanciaNado.metros200:
        return '200 m';
      case DistanciaNado.metros400:
        return '400 m';
    }
  }

  int get metros {
    switch (this) {
      case DistanciaNado.metros50:
        return 50;
      case DistanciaNado.metros100:
        return 100;
      case DistanciaNado.metros200:
        return 200;
      case DistanciaNado.metros400:
        return 400;
    }
  }

  int get vueltas {
    switch (this) {
      case DistanciaNado.metros50:
        return 1;
      case DistanciaNado.metros100:
        return 2;
      case DistanciaNado.metros200:
        return 4;
      case DistanciaNado.metros400:
        return 8;
    }
  }

  double get progresoNecesarioParaGanar {
    return vueltas * 100;
  }
}
