# Crear botones seleccion

**Nivel:** Practicar

## Objetivo

Agregar botones para escoger tipo de nado y distancia antes de jugar.

## Herramientas que vamos a usar

- `pantalla_inicio.dart`
- `boton_tipo_nado.dart`
- `boton_distancia.dart`
- `selector_modo.dart`
- `ChoiceChip`
- `setState`
- Modelos `TipoNado` y `DistanciaNado`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

La pantalla de inicio necesita recordar dos decisiones:

- tipo de nado seleccionado
- distancia seleccionada

Para recordar datos que cambian, la pantalla debe ser `StatefulWidget`.

Usaremos `setState` para cambiar la opcion seleccionada y actualizar la pantalla.

## Paso 1: Crear carpeta widgets

Si no existe, crea esta carpeta:

```text
lib/widgets
```

## Paso 2: Crear boton_tipo_nado.dart

Crea este archivo:

```text
lib/widgets/boton_tipo_nado.dart
```

Usa este codigo:

```dart
import 'package:flutter/material.dart';

import '../modelos/tipo_nado.dart';

class BotonTipoNado extends StatelessWidget {
  const BotonTipoNado({
    super.key,
    required this.tipoNado,
    required this.estaSeleccionado,
    required this.alPresionar,
  });

  final TipoNado tipoNado;
  final bool estaSeleccionado;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(tipoNado.etiqueta),
      selected: estaSeleccionado,
      onSelected: (_) => alPresionar(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: estaSeleccionado ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF0EA5E9),
      backgroundColor: const Color(0xFFE0F2FE),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      showCheckmark: false,
    );
  }
}
```

`BotonTipoNado` recibe un tipo de nado.

`estaSeleccionado` cambia el color.

`alPresionar` avisa a la pantalla que el usuario toco el boton.

## Paso 3: Crear boton_distancia.dart

Crea este archivo:

```text
lib/widgets/boton_distancia.dart
```

Usa este codigo:

```dart
import 'package:flutter/material.dart';

import '../modelos/distancia_nado.dart';

class BotonDistancia extends StatelessWidget {
  const BotonDistancia({
    super.key,
    required this.distancia,
    required this.estaSeleccionada,
    required this.alPresionar,
  });

  final DistanciaNado distancia;
  final bool estaSeleccionada;
  final VoidCallback alPresionar;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(distancia.etiqueta),
      selected: estaSeleccionada,
      onSelected: (_) => alPresionar(),
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: estaSeleccionada ? Colors.white : const Color(0xFF0F172A),
      ),
      selectedColor: const Color(0xFF22C55E),
      backgroundColor: const Color(0xFFDCFCE7),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      showCheckmark: false,
    );
  }
}
```

## Paso 4: Crear selector_modo.dart

Crea este archivo:

```text
lib/widgets/selector_modo.dart
```

Usa esta version simple:

```dart
import 'package:flutter/material.dart';

import '../modelos/modo_juego.dart';

class SelectorModo extends StatelessWidget {
  const SelectorModo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FichaModo(
            etiqueta: ModoJuego.practica.etiqueta,
            estaSeleccionado: true,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _FichaModo(
            etiqueta: ModoJuego.competencia.etiqueta,
            estaSeleccionado: false,
            estaDeshabilitado: true,
          ),
        ),
      ],
    );
  }
}

class _FichaModo extends StatelessWidget {
  const _FichaModo({
    required this.etiqueta,
    required this.estaSeleccionado,
    this.estaDeshabilitado = false,
  });

  final String etiqueta;
  final bool estaSeleccionado;
  final bool estaDeshabilitado;

  Color get colorFondo {
    if (estaSeleccionado) {
      return const Color(0xFF0284C7);
    }

    if (estaDeshabilitado) {
      return const Color(0xFFE2E8F0);
    }

    return Colors.white;
  }

  Color get colorTexto {
    if (estaSeleccionado) {
      return Colors.white;
    }

    return const Color(0xFF64748B);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: colorFondo,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFBAE6FD)),
      ),
      child: Text(
        etiqueta,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colorTexto,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
```

Practica aparece activa.

Competencia aparece deshabilitada para el futuro.

Por ahora no se puede elegir competencia.

## Paso 5: Convertir PantallaInicio en StatefulWidget

Actualiza `pantalla_inicio.dart` para que `PantallaInicio` use estado.

Debe tener estas variables:

```dart
TipoNado tipoNadoSeleccionado = TipoNado.libre;
DistanciaNado distanciaSeleccionada = DistanciaNado.metros50;
```

`tipoNadoSeleccionado` recuerda el nado elegido.

`distanciaSeleccionada` recuerda la distancia elegida.

## Paso 6: Agregar imports en pantalla_inicio.dart

Agrega estos imports:

```dart
import '../modelos/distancia_nado.dart';
import '../modelos/tipo_nado.dart';
import '../widgets/boton_distancia.dart';
import '../widgets/boton_tipo_nado.dart';
import '../widgets/selector_modo.dart';
```

## Paso 7: Agregar opciones dentro de la tarjeta

Dentro de la tarjeta de opciones, agrega:

- `SelectorModo`
- botones de `TipoNado.values`
- botones de `DistanciaNado.values`

Para tipo de nado:

```dart
Wrap(
  spacing: 10,
  runSpacing: 10,
  children: TipoNado.values.map((tipoNado) {
    return BotonTipoNado(
      tipoNado: tipoNado,
      estaSeleccionado: tipoNadoSeleccionado == tipoNado,
      alPresionar: () {
        setState(() {
          tipoNadoSeleccionado = tipoNado;
        });
      },
    );
  }).toList(),
)
```

Para distancia:

```dart
Wrap(
  spacing: 10,
  runSpacing: 10,
  children: DistanciaNado.values.map((distancia) {
    return BotonDistancia(
      distancia: distancia,
      estaSeleccionada: distanciaSeleccionada == distancia,
      alPresionar: () {
        setState(() {
          distanciaSeleccionada = distancia;
        });
      },
    );
  }).toList(),
)
```

`TipoNado.values` trae todos los tipos de nado.

`DistanciaNado.values` trae todas las distancias.

`map` crea un boton por cada opcion.

`setState` cambia la opcion seleccionada y actualiza la pantalla.

## Paso 8: Activar el boton Iniciar practica

Por ahora el boton tendra una accion temporal:

```dart
FilledButton(
  onPressed: () {
    print('Iniciar practica');
  },
  child: const Text('Iniciar practica'),
)
```

En la proxima leccion este boton abrira la pantalla del juego.

## Si algo sale mal

- Revisa que la carpeta se llame `widgets`.
- Revisa que los imports empiecen con `../`.
- Revisa que `PantallaInicio` sea `StatefulWidget`.
- Revisa que los nombres `tipoNadoSeleccionado` y `distanciaSeleccionada` esten escritos igual.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos `PantallaJuego` y usaremos navegacion para abrirla.

## Actividad

1. Crea los tres widgets de seleccion.
2. Convierte `PantallaInicio` en `StatefulWidget`.
3. Agrega botones de tipo de nado.
4. Agrega botones de distancia.
5. Toca diferentes opciones y mira como cambia el color.
6. Presiona `Iniciar practica` y revisa que aparece el mensaje en la terminal.
