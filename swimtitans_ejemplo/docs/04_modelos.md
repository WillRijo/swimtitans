# Modelos

Los modelos guardan datos simples del juego.

En este proyecto se usan enums.

## Que es un enum

Un enum es una lista corta de opciones.

Sirve cuando queremos que una variable solo pueda tener ciertos valores.

Por ejemplo, un tipo de nado solo puede ser:

- Libre
- Mariposa
- Pecho
- Dorso

## ModoJuego

`ModoJuego` esta en:

```text
lib/modelos/modo_juego.dart
```

Tiene estos valores:

```text
practica
competencia
```

Por ahora la app usa practica.

Competencia se muestra como una opcion futura.

## TipoNado

`TipoNado` esta en:

```text
lib/modelos/tipo_nado.dart
```

Tiene estos valores:

```text
libre
mariposa
pecho
dorso
```

Cada tipo de nado tiene una `etiqueta`.

La etiqueta es el texto que se muestra en pantalla:

- Libre
- Mariposa
- Pecho
- Dorso

Tambien tiene `avancePorAccion`.

`avancePorAccion` indica cuantos puntos avanza el nadador cuando el jugador hace una accion correcta.

## DistanciaNado

`DistanciaNado` esta en:

```text
lib/modelos/distancia_nado.dart
```

Tiene estos valores:

```text
metros50
metros100
metros200
metros400
```

Cada distancia tiene:

- `etiqueta`
- `metros`
- `vueltas`
- `progresoNecesarioParaGanar`

## etiquetas

`etiqueta` es el texto amigable que se muestra al jugador.

Ejemplo:

```text
DistanciaNado.metros100 -> 100 m
```

## metros

`metros` dice cuantos metros tiene la distancia.

Ejemplo:

```text
metros100 -> 100
```

## vueltas

Cada vuelta representa 50 m.

Ejemplos:

```text
50 m = 1 vuelta
100 m = 2 vueltas
200 m = 4 vueltas
400 m = 8 vueltas
```

## progresoNecesarioParaGanar

Cada vuelta usa 100 puntos de progreso.

Entonces:

```text
progresoNecesarioParaGanar = vueltas * 100
```
