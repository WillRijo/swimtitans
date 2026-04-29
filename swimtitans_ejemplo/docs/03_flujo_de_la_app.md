# Flujo de la app

El flujo principal de la app es:

```text
main.dart
  -> aplicacion.dart
    -> pantalla_inicio.dart
      -> pantalla_juego.dart
```

## main.dart

`main.dart` inicia Flutter.

Su trabajo es pequeno: arrancar la aplicacion.

## aplicacion.dart

`aplicacion.dart` crea `MaterialApp`.

Tambien decide que la primera pantalla sera `PantallaInicio`.

## pantalla_inicio.dart

En `PantallaInicio`, la persona que juega elige:

- Tipo de nado
- Distancia

El tipo de nado se guarda en:

```text
tipoNadoSeleccionado
```

La distancia se guarda en:

```text
distanciaSeleccionada
```

## Seleccion de tipo de nado

Los tipos de nado vienen del enum `TipoNado`.

Cuando se toca un boton, la pantalla cambia el valor de `tipoNadoSeleccionado`.

## Seleccion de distancia

Las distancias vienen del enum `DistanciaNado`.

Cuando se toca un boton, la pantalla cambia el valor de `distanciaSeleccionada`.

## Ir a la pantalla de juego

Cuando se toca `Iniciar practica`, se llama a `iniciarPractica`.

Esa funcion abre `PantallaJuego` y envia dos datos:

```text
tipoNado: tipoNadoSeleccionado
distancia: distanciaSeleccionada
```

Asi la pantalla de juego sabe que practica debe mostrar.
