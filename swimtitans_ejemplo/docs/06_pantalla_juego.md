# Pantalla de juego

La pantalla de juego esta en:

```text
lib/pantallas/pantalla_juego.dart
```

Esta pantalla muestra la piscina y controla la practica.

## Estado del juego

La pantalla guarda varias variables de estado.

## progresoActual

`progresoActual` guarda cuanto ha avanzado el nadador.

Cuando llega al progreso necesario, la practica termina.

## practicaTerminada

`practicaTerminada` indica si el jugador ya llego a la meta.

Si es `true`, ya no se sigue avanzando.

## elJugadorEstaNadando

`elJugadorEstaNadando` indica si hubo accion reciente.

Cuando es `true`, se muestra el sprite de nado.

Cuando pasa un tiempo sin accion, vuelve al sprite de espera.

## ultimoLadoTocado

`ultimoLadoTocado` se usa para libre y dorso.

Sirve para obligar a alternar izquierda y derecha.

## lados presionados

Para mariposa se usan:

```text
ladoIzquierdoPresionado
ladoDerechoPresionado
```

El nadador avanza cuando ambos lados estan presionados.

## Vueltas

La piscina representa 50 m.

Cada distancia se divide en vueltas:

- 50 m = 1 vuelta
- 100 m = 2 vueltas
- 200 m = 4 vueltas
- 400 m = 8 vueltas

Cada vuelta usa 100 puntos de progreso.

## Direccion

La direccion cambia en cada vuelta.

Si la vuelta es par, el nadador va hacia la derecha.

Si la vuelta es impar, el nadador va hacia la izquierda.

## Panel superior

El panel superior muestra:

- Boton volver
- Tipo de nado
- Distancia

## Piscina

La piscina se muestra con `VistaPiscina`.

Tiene tres carriles y el nadador va por el carril central.

## Panel inferior

El panel inferior muestra:

- Progreso actual
- Vuelta actual
- Distancia total
- Texto de ayuda
- Mensaje final cuando termina

## reiniciarPractica

`reiniciarPractica` vuelve el juego al inicio.

Reinicia progreso, estado de final, lados presionados, ultimo lado tocado y animacion.

## volverAlInicio

`volverAlInicio` cierra la pantalla de juego y regresa a la pantalla de inicio.
