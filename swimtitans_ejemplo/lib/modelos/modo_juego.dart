enum ModoJuego { practica, competencia }

extension TextoModoJuego on ModoJuego {
  String get etiqueta {
    switch (this) {
      case ModoJuego.practica:
        return 'Práctica';
      case ModoJuego.competencia:
        return 'Competencia';
    }
  }
}
