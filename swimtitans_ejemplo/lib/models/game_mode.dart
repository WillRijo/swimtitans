enum GameMode { practice, competition }

extension GameModeLabel on GameMode {
  String get label {
    switch (this) {
      case GameMode.practice:
        return 'Práctica';
      case GameMode.competition:
        return 'Competencia';
    }
  }
}
