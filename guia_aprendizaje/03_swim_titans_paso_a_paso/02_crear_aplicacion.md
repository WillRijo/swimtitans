# Crear aplicacion

**Nivel:** Practicar

## Objetivo

Limpiar la app inicial y preparar la primera estructura de Swim Titans.

## Herramientas que vamos a usar

- `lib/main.dart`
- `lib/aplicacion.dart`
- `lib/pantallas/pantalla_inicio.dart`
- `MaterialApp`
- `Scaffold`
- VS Code
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

Flutter crea una app inicial con contador.

Ahora vamos a quitar esa app de prueba.

Vamos a seguir una estructura parecida al juego terminado.

- `main.dart` empieza la app.
- `aplicacion.dart` configura la app.
- `pantalla_inicio.dart` sera la primera pantalla.

Por ahora la pantalla de inicio solo mostrara un texto simple.

## Paso 1: Crear carpetas

Dentro de `lib/`, crea esta carpeta:

```text
lib/pantallas
```

## Paso 2: Crear archivo pantalla_inicio.dart

Dentro de `lib/pantallas/`, crea este archivo:

```text
lib/pantallas/pantalla_inicio.dart
```

Usa este codigo:

```dart
import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Swim Titans'),
      ),
    );
  }
}
```

`PantallaInicio` es la primera pantalla.

Por ahora solo muestra el texto del juego.

Despues la vamos a mejorar.

## Paso 3: Dejar main.dart simple

`main.dart` debe quedar como entrada de la app.

Usa este codigo:

```dart
import 'package:flutter/material.dart';

import 'aplicacion.dart';

void main() {
  runApp(const AplicacionSwimTitans());
}
```

`main` empieza la app.

`runApp` prende Flutter.

`AplicacionSwimTitans` sera nuestra app.

## Paso 4: Crear aplicacion.dart

Dentro de `lib/`, crea o actualiza este archivo:

```text
lib/aplicacion.dart
```

Usa este codigo:

```dart
import 'package:flutter/material.dart';

import 'pantallas/pantalla_inicio.dart';

class AplicacionSwimTitans extends StatelessWidget {
  const AplicacionSwimTitans({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swim Titans',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFE6F7FF),
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}
```

`MaterialApp` prepara la app.

`theme` guarda colores generales.

`home` dice cual es la primera pantalla.

`PantallaInicio` viene del archivo `pantallas/pantalla_inicio.dart`.

## Paso 5: Ejecutar la app

Usa la terminal integrada:

```bash
flutter run
```

Tambien puedes usar `F5` si ya lo tienes listo en VS Code.

## Paso 6: Confirmar el resultado

Deberia verse una pantalla simple con el texto `Swim Titans`.

## Si algo sale mal

- Revisa que la carpeta se llame `pantallas`.
- Revisa que `pantalla_inicio.dart` este dentro de `lib/pantallas/`.
- Revisa que el import sea `import 'pantallas/pantalla_inicio.dart';`.
- Revisa que `PantallaInicio` este escrito igual en el archivo y en `aplicacion.dart`.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues crearemos modelos para representar:

- modo de juego
- tipo de nado
- distancia

## Actividad

1. Crea la carpeta `lib/pantallas`.
2. Crea `lib/pantallas/pantalla_inicio.dart`.
3. Reemplaza `lib/main.dart`.
4. Crea `lib/aplicacion.dart`.
5. Ejecuta la app.
6. Confirma que aparece `Swim Titans`.
