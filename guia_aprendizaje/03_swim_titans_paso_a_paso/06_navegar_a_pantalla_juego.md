# Navegar a pantalla juego

**Nivel:** Practicar

## Objetivo

Pasar desde la pantalla de inicio hasta la pantalla del juego.

## Herramientas que vamos a usar

- `pantalla_inicio.dart`
- `pantalla_juego.dart`
- `Navigator`
- `MaterialPageRoute`
- Modelos `TipoNado` y `DistanciaNado`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- Una app puede tener varias pantallas.
- La pantalla de inicio sirve para elegir opciones.
- La pantalla de juego recibe esas opciones.
- `Navigator.push` abre una pantalla nueva.
- `Navigator.pop` vuelve a la pantalla anterior.

## Paso 1: Crear pantalla_juego.dart

Crea este archivo:

```text
lib/pantallas/pantalla_juego.dart
```

Usa esta version simple:

```dart
import 'package:flutter/material.dart';

import '../modelos/distancia_nado.dart';
import '../modelos/tipo_nado.dart';

class PantallaJuego extends StatelessWidget {
  const PantallaJuego({
    super.key,
    required this.tipoNado,
    required this.distancia,
  });

  final TipoNado tipoNado;
  final DistanciaNado distancia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego'),
      ),
      body: Center(
        child: Text(
          'Nado: ${tipoNado.etiqueta} - Distancia: ${distancia.etiqueta}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
```

`PantallaJuego` recibe `tipoNado` y `distancia`.

`required` significa que esos datos son obligatorios.

`Text` muestra las opciones elegidas.

## Paso 2: Importar PantallaJuego

En `pantalla_inicio.dart`, agrega este import:

```dart
import 'pantalla_juego.dart';
```

## Paso 3: Crear iniciarPractica

Dentro de `_PantallaInicioState`, crea esta funcion:

```dart
void iniciarPractica() {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => PantallaJuego(
        tipoNado: tipoNadoSeleccionado,
        distancia: distanciaSeleccionada,
      ),
    ),
  );
}
```

`Navigator.of(context)` busca el navegador de la app.

`push` abre otra pantalla.

`PantallaJuego` recibe el nado y la distancia seleccionados.

Esos datos viajan de inicio a juego.

## Paso 4: Usar iniciarPractica en el boton

Cambia el boton `Iniciar practica` para usar la funcion:

```dart
FilledButton(
  onPressed: iniciarPractica,
  child: const Text('Iniciar practica'),
)
```

## Paso 5: Volver desde PantallaJuego

Si usas `AppBar`, Flutter ya muestra el boton de volver automaticamente.

Tambien puedes agregar un boton manual:

```dart
OutlinedButton(
  onPressed: () {
    Navigator.of(context).pop();
  },
  child: const Text('Volver'),
)
```

`pop` cierra la pantalla actual.

Al cerrar `PantallaJuego`, volvemos a `PantallaInicio`.

## Paso 6: Ejecutar y probar

Ejecuta:

```bash
flutter run
```

Prueba esto:

1. Elige un tipo de nado.
2. Elige una distancia.
3. Presiona `Iniciar practica`.
4. Confirma que `PantallaJuego` muestra esas opciones.
5. Vuelve al inicio.

## Si algo sale mal

- Revisa que `pantalla_juego.dart` este dentro de `lib/pantallas`.
- Revisa que el import diga `import 'pantalla_juego.dart';`.
- Revisa que `tipoNadoSeleccionado` y `distanciaSeleccionada` existan en `PantallaInicio`.
- Revisa que `PantallaJuego` reciba `tipoNado` y `distancia`.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos el estado del juego:

- progreso actual
- practica terminada
- accion del jugador
- reiniciar practica

## Actividad

1. Crea `PantallaJuego`.
2. Haz que reciba `tipoNado` y `distancia`.
3. Agrega `iniciarPractica` en `PantallaInicio`.
4. Presiona el boton de inicio.
5. Confirma que la nueva pantalla muestra el nado y la distancia seleccionados.

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Crear botones seleccion](05_crear_botones_seleccion.md)  
[Siguiente leccion: Crear estado del juego](07_crear_estado_del_juego.md)  
