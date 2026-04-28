enum DistanciaNado { metros50, metros100, metros200 }

extension InfoDistanciaNado on DistanciaNado {
  String get etiqueta {
    switch (this) {
      case DistanciaNado.metros50:
        return '50 m';
      case DistanciaNado.metros100:
        return '100 m';
      case DistanciaNado.metros200:
        return '200 m';
    }
  }

  double get progresoMeta {
    switch (this) {
      case DistanciaNado.metros50:
        return 100;
      case DistanciaNado.metros100:
        return 200;
      case DistanciaNado.metros200:
        return 400;
    }
  }
}
