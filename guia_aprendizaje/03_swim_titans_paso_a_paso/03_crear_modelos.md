# Crear modelos

**Nivel:** Aprender y Practicar

## Objetivo

Crear modelos simples para representar las opciones principales del juego.

## Herramientas que vamos a usar

- Dart
- Carpeta `lib/modelos`
- `enum`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

Un modelo guarda una idea importante del juego.

En esta app, no necesitamos clases complicadas.

Usaremos `enum`, que es una lista corta de opciones posibles.

Ejemplos:

- El modo puede ser practica o competencia.
- El tipo de nado puede ser libre, mariposa, pecho o dorso.
- La distancia puede ser 50, 100, 200 o 400 metros.

## Paso 1: Crear carpeta modelos

Crea esta carpeta:

```text
lib/modelos
```

## Paso 2: Crear modo_juego.dart

Crea este archivo:

```text
lib/modelos/modo_juego.dart
```

Usa este codigo:

```dart
enum ModoJuego {
  practica,
  competencia,
}

extension TextoModoJuego on ModoJuego {
  String get etiqueta {
    switch (this) {
      case ModoJuego.practica:
        return 'Practica';
      case ModoJuego.competencia:
        return 'Competencia';
    }
  }
}
```

`ModoJuego` tiene las opciones del modo.

`etiqueta` es el texto que se mostrara en pantalla.

## Paso 3: Crear tipo_nado.dart

Crea este archivo:

```text
lib/modelos/tipo_nado.dart
```

Usa este codigo:

```dart
enum TipoNado {
  libre,
  mariposa,
  pecho,
  dorso,
}

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
```

`TipoNado` guarda los estilos de nado.

`etiqueta` dice como se ve el nombre en pantalla.

`avancePorAccion` dice cuanto avanza el nadador con cada accion.

## Paso 4: Crear distancia_nado.dart

Crea este archivo:

```text
lib/modelos/distancia_nado.dart
```

Usa este codigo:

```dart
enum DistanciaNado {
  metros50,
  metros100,
  metros200,
  metros400,
}

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
```

`DistanciaNado` guarda las distancias posibles.

`metros` guarda el numero real de metros.

`vueltas` dice cuantas veces se cruza una piscina de 50 metros.

`progresoNecesarioParaGanar` dice cuanto progreso se necesita para terminar.

## Paso 5: Entender que todavia no se ve en pantalla

Estos modelos todavia no se ven en pantalla.

Los usaremos en la siguiente leccion para crear botones de seleccion.

## Si algo sale mal

- Revisa que la carpeta se llame `modelos`.
- Revisa que los archivos terminen en `.dart`.
- Revisa que los nombres `ModoJuego`, `TipoNado` y `DistanciaNado` esten escritos igual.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos la pantalla de inicio con:

- titulo
- modo
- tipos de nado
- distancias
- boton para empezar

## Actividad

1. Crea la carpeta `lib/modelos`.
2. Crea los 3 archivos de modelos.
3. Lee cada `enum` en voz alta.
4. Responde:

- Cuales son los tipos de nado?
- Cuantas vueltas tiene 100 m?
- Cual tipo de nado avanza mas por accion?
