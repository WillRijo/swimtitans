# Crear pantalla inicio

**Nivel:** Practicar

## Objetivo

Crear la primera pantalla real de Swim Titans.

## Herramientas que vamos a usar

- `lib/pantallas/pantalla_inicio.dart`
- `Scaffold`
- `SafeArea`
- `Column`
- `Text`
- `FilledButton`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

La pantalla de inicio sera la entrada al juego.

Por ahora tendra:

- titulo
- texto corto
- espacio para opciones
- boton para iniciar practica

Mas adelante agregaremos:

- tipos de nado
- distancias
- navegacion a la pantalla de juego

## Paso 1: Abrir pantalla_inicio.dart

Abre este archivo:

```text
lib/pantallas/pantalla_inicio.dart
```

## Paso 2: Crear una primera version simple

Reemplaza el contenido con este codigo:

```dart
import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Swim Titans',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF075985),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Elige tu practica de natacion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Text(
                  'Aqui pondremos las opciones del juego',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              FilledButton(
                onPressed: null,
                child: Text('Iniciar practica'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
```

`Scaffold` crea la base de la pantalla.

`SafeArea` evita zonas peligrosas de la pantalla.

`Padding` deja espacio alrededor.

`Column` acomoda todo de arriba hacia abajo.

`Text` muestra palabras.

`Spacer` empuja elementos para separar espacios.

`Container` sera la tarjeta de opciones.

`FilledButton` sera el boton de inicio.

`onPressed: null` significa que el boton todavia esta desactivado.

## Paso 3: Ejecutar la app

Ejecuta:

```bash
flutter run
```

## Paso 4: Confirmar que se ve

Deberias ver:

- el titulo `Swim Titans`
- un texto debajo
- una tarjeta blanca
- un boton desactivado

## Si algo sale mal

- Revisa que `pantalla_inicio.dart` este dentro de `lib/pantallas`.
- Revisa que `aplicacion.dart` importe `pantallas/pantalla_inicio.dart`.
- Revisa que `PantallaInicio` este escrito igual.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos botones de seleccion para:

- tipo de nado
- distancia
- modo de juego

## Actividad

1. Crea la pantalla de inicio simple.
2. Ejecuta la app.
3. Cambia temporalmente el texto debajo del titulo.
4. Cambia el color del titulo.
5. Vuelve a dejar el titulo como `Swim Titans`.

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Crear modelos](03_crear_modelos.md)  
[Siguiente leccion: Crear botones seleccion](05_crear_botones_seleccion.md)  
