# Crear estado del juego

**Nivel:** Aprender y Practicar

## Objetivo

Entender que datos cambian mientras el juego esta funcionando.

## Herramientas que vamos a usar

- `pantalla_juego.dart`
- `StatefulWidget`
- Variables
- `setState`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- El estado es la memoria de una pantalla.
- En el juego hay datos que cambian mientras jugamos.
- Por ejemplo:
  - progreso del nadador
  - si la practica termino
  - si el jugador esta nadando
  - cual fue el ultimo lado tocado
- Como esos datos cambian, `PantallaJuego` debe ser `StatefulWidget`.

## Paso 1: Convertir PantallaJuego en StatefulWidget

Usa una estructura como esta:

```dart
class PantallaJuego extends StatefulWidget {
  const PantallaJuego({
    super.key,
    required this.tipoNado,
    required this.distancia,
  });

  final TipoNado tipoNado;
  final DistanciaNado distancia;

  @override
  State<PantallaJuego> createState() => _PantallaJuegoState();
}
```

Y crea el estado:

```dart
class _PantallaJuegoState extends State<PantallaJuego> {
}
```

`PantallaJuego` recibe datos.

`_PantallaJuegoState` guarda datos que cambian.

## Paso 2: Agregar variables principales

Dentro de `_PantallaJuegoState`, agrega:

```dart
double progresoActual = 0;
bool practicaTerminada = false;
bool elJugadorEstaNadando = false;
```

`progresoActual` empieza en 0.

`practicaTerminada` empieza en `false`.

`elJugadorEstaNadando` empieza en `false`.

## Paso 3: Agregar getters para distancia

Agrega:

```dart
double get progresoNecesarioParaGanar {
  return widget.distancia.progresoNecesarioParaGanar;
}

int get totalVueltas {
  return widget.distancia.vueltas;
}
```

`widget.distancia` es la distancia que llego desde la pantalla de inicio.

`progresoNecesarioParaGanar` dice cuanto hay que avanzar.

`totalVueltas` dice cuantas vueltas tiene la practica.

## Paso 4: Crear funcion para avanzar

Agrega:

```dart
void avanzarNadador() {
  if (practicaTerminada) {
    return;
  }

  setState(() {
    progresoActual += widget.tipoNado.avancePorAccion;

    if (progresoActual >= progresoNecesarioParaGanar) {
      progresoActual = progresoNecesarioParaGanar;
      practicaTerminada = true;
    }
  });
}
```

Si la practica ya termino, no hacemos nada.

Sumamos avance al progreso.

Si llega a la meta, marcamos la practica como terminada.

`setState` actualiza la pantalla.

## Paso 5: Crear funcion para reiniciar

Agrega:

```dart
void reiniciarPractica() {
  setState(() {
    progresoActual = 0;
    practicaTerminada = false;
    elJugadorEstaNadando = false;
  });
}
```

Vuelve el progreso a 0.

Marca la practica como no terminada.

Dice que el jugador ya no esta nadando.

## Paso 6: Mostrar estado en pantalla

Dentro de `build`, puedes usar algo como:

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text('Nado: ${widget.tipoNado.etiqueta}'),
    Text('Distancia: ${widget.distancia.etiqueta}'),
    Text('Progreso: ${progresoActual.toInt()} / ${progresoNecesarioParaGanar.toInt()}'),
    FilledButton(
      onPressed: avanzarNadador,
      child: const Text('Avanzar'),
    ),
    if (practicaTerminada)
      FilledButton(
        onPressed: reiniciarPractica,
        child: const Text('Reiniciar'),
      ),
  ],
)
```

Esto todavia no es la piscina final.

Es una prueba para comprobar que el estado funciona.

El boton `Avanzar` simula que el nadador se mueve.

## Paso 7: Ejecutar y probar

1. Entra a `PantallaJuego`.
2. Presiona `Avanzar`.
3. Mira que sube el progreso.
4. Llega a la meta.
5. Presiona `Reiniciar`.

## Si algo sale mal

- Revisa que `PantallaJuego` sea `StatefulWidget`.
- Revisa que las variables esten dentro de `_PantallaJuegoState`.
- Revisa que uses `widget.tipoNado` y `widget.distancia`.
- Revisa que `setState` tenga parentesis y llaves correctas.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos una piscina simple para que el progreso se vea como movimiento.

## Actividad

1. Convierte `PantallaJuego` en `StatefulWidget`.
2. Agrega `progresoActual`.
3. Agrega `avanzarNadador`.
4. Muestra el progreso en pantalla.
5. Presiona el boton hasta llegar a la meta.

Pregunta:

Que dato cambia cada vez que presionas `Avanzar`?
