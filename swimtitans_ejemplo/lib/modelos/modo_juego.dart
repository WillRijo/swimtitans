enum ModoJuego { practica, competencia }

extension InfoModoJuego on ModoJuego {
  String get etiqueta {
    switch (this) {
      case ModoJuego.practica:
        return 'Práctica';
      case ModoJuego.competencia:
        return 'Competencia';
    }
  }
}
