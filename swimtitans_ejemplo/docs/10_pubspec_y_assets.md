# pubspec.yaml y assets

`pubspec.yaml` es un archivo importante de Flutter.

Sirve para decirle al proyecto:

- Como se llama la app
- Que version tiene
- Que dependencias usa
- Que assets debe incluir
- Como generar iconos

## name

```yaml
name: swimtitans_ejemplo
```

Es el nombre interno del proyecto.

## description

```yaml
description: "A new Flutter project."
```

Describe el proyecto.

Se puede mejorar mas adelante.

## publish_to

```yaml
publish_to: 'none'
```

Indica que este paquete no se publicara en pub.dev.

## version

```yaml
version: 0.1.0+1
```

Indica la version de la app.

## environment sdk

```yaml
environment:
  sdk: ^3.11.3
```

Indica la version de Dart que usa el proyecto.

## dependencies

Las dependencias son paquetes que la app necesita para funcionar.

### flutter

```yaml
flutter:
  sdk: flutter
```

Es la dependencia principal para crear apps Flutter.

### flutter_launcher_icons

```yaml
flutter_launcher_icons: ^0.14.4
```

Sirve para generar iconos de la app.

## dev_dependencies

Las dependencias de desarrollo ayudan mientras se programa.

### flutter_test

```yaml
flutter_test:
  sdk: flutter
```

Sirve para pruebas en Flutter.

### flutter_lints

```yaml
flutter_lints: ^6.0.0
```

Ayuda a mantener reglas de calidad en el codigo.

## uses-material-design

```yaml
uses-material-design: true
```

Permite usar componentes e iconos de Material Design.

## assets

Los assets declarados son:

```yaml
assets:
  - assets/images/iconos/
  - assets/images/swimmers/
```

Esto permite usar imagenes con `Image.asset`.

## assets/images/iconos/

Esta carpeta contiene:

```text
icono.png
```

Se usa como icono visual de Swim Titans.

## assets/images/swimmers/

Esta carpeta contiene sprites del nadador:

```text
espera.png
libre.png
dorso.png
pecho.png
mariposa.png
```

## flutter_launcher_icons

La configuracion `flutter_launcher_icons` dice como generar iconos.

Usa:

```text
assets/images/iconos/icono.png
```

como imagen principal.

## image_path

`image_path` es la ruta de la imagen base del icono.

## android

```yaml
android: true
```

Indica que se generaran iconos para Android.

## ios

```yaml
ios: true
```

Indica que se generaran iconos para iOS.

## web

La seccion `web` indica que tambien se generaran iconos para web.

## background colors

Los colores de fondo se usan para iconos adaptativos y para web.

En este proyecto el fondo configurado es blanco:

```text
#ffffff
```
