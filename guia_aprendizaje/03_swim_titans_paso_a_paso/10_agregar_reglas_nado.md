# Agregar reglas nado

**Nivel:** Practicar

## Objetivo

Agregar reglas simples para que cada tipo de nado se controle de forma diferente.

## Herramientas que vamos a usar

- `pantalla_juego.dart`
- `vista_piscina.dart`
- Estado del juego
- Condiciones `if`
- `GestureDetector`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- Hasta ahora el nadador avanza con una accion simple.
- Ahora vamos a hacer reglas diferentes segun el tipo de nado.
- Libre y dorso avanzan alternando izquierda y derecha.
- Pecho avanza con un deslizamiento hacia arriba.
- Mariposa avanza presionando ambos lados.

## Paso 1: Crear LadoPantalla

Crea un `enum` para recordar el ultimo lado tocado:

```dart
enum LadoPantalla {
  izquierdo,
  derecho,
}
```

Esto nos ayuda a saber si el jugador toco izquierda o derecha.

Lo usaremos para libre y dorso.

## Paso 2: Agregar variables de control

En `_PantallaJuegoState`, agrega:

```dart
bool ladoIzquierdoPresionado = false;
bool ladoDerechoPresionado = false;
LadoPantalla? ultimoLadoTocado;
```

Los lados presionados se usan para mariposa.

`ultimoLadoTocado` se usa para libre y dorso.

El signo `?` significa que al principio puede estar vacio.

## Paso 3: Crear funcion para tocar un lado

Agrega:

```dart
void tocarLadoDeLaPiscina({required bool esIzquierda}) {
  if (practicaTerminada) {
    return;
  }

  final lado = esIzquierda ? LadoPantalla.izquierdo : LadoPantalla.derecho;

  if (widget.tipoNado == TipoNado.libre ||
      widget.tipoNado == TipoNado.dorso) {
    if (ultimoLadoTocado == lado) {
      return;
    }

    ultimoLadoTocado = lado;
    avanzarNadador();
  }
}
```

Si la practica termino, no hace nada.

Si toca el mismo lado dos veces, no avanza.

Si alterna izquierda y derecha, avanza.

Puede empezar por cualquier lado.

## Paso 4: Crear funcion para mariposa

Agrega:

```dart
void cambiarPresionDelLadoParaMariposa({
  required bool esIzquierda,
  required bool estaPresionado,
}) {
  setState(() {
    if (esIzquierda) {
      ladoIzquierdoPresionado = estaPresionado;
    } else {
      ladoDerechoPresionado = estaPresionado;
    }
  });

  if (ladoIzquierdoPresionado && ladoDerechoPresionado) {
    avanzarNadador();
    setState(() {
      ladoIzquierdoPresionado = false;
      ladoDerechoPresionado = false;
    });
  }
}
```

Mariposa necesita ambos lados.

Cuando los dos lados estan presionados, el nadador avanza.

Despues se limpian los dos lados.

## Paso 5: Crear funcion para pecho

Agrega:

```dart
void intentarAvanzarConDeslizamiento(DragEndDetails detalles) {
  if (widget.tipoNado != TipoNado.pecho) {
    return;
  }

  final velocidad = detalles.primaryVelocity ?? 0;

  if (velocidad < 0) {
    avanzarNadador();
  }
}
```

Pecho solo usa deslizamiento hacia arriba.

En Flutter, velocidad menor que 0 significa hacia arriba.

Si el nado no es pecho, no hace nada.

## Paso 6: Actualizar la piscina simple o VistaPiscina

La piscina debe recibir estas funciones y datos:

- `alTocarLado`
- `alDeslizarArriba`
- `alCambiarLadoMariposa`
- `ladoIzquierdoPresionado`
- `ladoDerechoPresionado`

Esta parte puede quedar simple al principio:

- dividir la piscina en lado izquierdo y lado derecho
- detectar toques con `GestureDetector`
- detectar swipe con `onVerticalDragEnd`

## Paso 7: Reiniciar estados de control

Actualiza `reiniciarPractica`:

```dart
void reiniciarPractica() {
  setState(() {
    progresoActual = 0;
    practicaTerminada = false;
    ladoIzquierdoPresionado = false;
    ladoDerechoPresionado = false;
    ultimoLadoTocado = null;
  });
}
```

## Paso 8: Probar reglas

- Libre: tocar izquierda, derecha, izquierda, derecha.
- Dorso: tocar izquierda, derecha, izquierda, derecha.
- Pecho: deslizar hacia arriba.
- Mariposa: presionar ambos lados.

## Si algo sale mal

- Revisa que `LadoPantalla` exista.
- Revisa que `ultimoLadoTocado` pueda ser `null`.
- Revisa que libre y dorso usen alternancia.
- Revisa que pecho use `onVerticalDragEnd`.
- Revisa que mariposa use los dos lados.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues agregaremos sprites para que el nadador se vea animado.

## Actividad

1. Agrega `LadoPantalla`.
2. Agrega `ultimoLadoTocado`.
3. Prueba libre alternando lados.
4. Prueba pecho con deslizamiento hacia arriba.
5. Prueba mariposa con ambos lados.

Pregunta:

Por que libre no debe avanzar si tocas el mismo lado dos veces?
