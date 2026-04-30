# Agregar sprites

**Nivel:** Practicar

## Objetivo

Usar imagenes para que el nadador se vea mejor.

## Herramientas que vamos a usar

- Carpeta `assets`
- Imagenes `.png`
- `pubspec.yaml`
- `Image.asset`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- Un sprite es una imagen usada en un juego.
- En Swim Titans usaremos imagenes para el icono y para el nadador.
- Algunas imagenes tendran varios dibujos en una sola fila.
- Esos dibujos se llaman frames.
- En esta leccion primero vamos a agregar las imagenes al proyecto.
- En la siguiente leccion usaremos el motor para animarlas.

## Paso 1: Crear carpetas

Crea estas carpetas:

```text
assets/images/iconos
assets/images/swimmers
```

`iconos` guarda el icono del juego.

`swimmers` guarda los sprites del nadador.

## Paso 2: Agregar imagenes

Las imagenes pueden copiarse desde la carpeta de referencia o descargarse desde los recursos del curso.

Archivos esperados:

```text
assets/images/iconos/icono.png
assets/images/swimmers/espera.png
assets/images/swimmers/libre.png
assets/images/swimmers/dorso.png
assets/images/swimmers/pecho.png
assets/images/swimmers/mariposa.png
```

`espera.png` tiene 4 frames.

Los nados tienen 8 frames.

Por ahora solo vamos a comprobar que Flutter puede leer las imagenes.

## Paso 3: Registrar assets en pubspec.yaml

En `pubspec.yaml`, agrega o revisa este bloque:

```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/iconos/
    - assets/images/swimmers/
```

`assets` le dice a Flutter donde estan las imagenes.

La indentacion en YAML importa mucho.

Los espacios deben quedar bien.

## Paso 4: Ejecutar flutter pub get

Ejecuta:

```bash
flutter pub get
```

Este comando hace que Flutter lea los cambios del `pubspec.yaml`.

## Paso 5: Probar una imagen en pantalla

En una pantalla de prueba o en `PantallaInicio`, muestra temporalmente:

```dart
Image.asset(
  'assets/images/iconos/icono.png',
  width: 160,
)
```

`Image.asset` muestra una imagen del proyecto.

La ruta debe ser igual a la del archivo.

Si la ruta esta mal, la imagen no aparece.

## Paso 6: Agregar imagen temporal del nadador

Prueba tambien:

```dart
Image.asset(
  'assets/images/swimmers/espera.png',
  width: 160,
)
```

Puede verse como una tira de imagenes.

Eso esta bien.

En la siguiente leccion usaremos un widget especial para mostrar un frame a la vez.

## Si algo sale mal

- Revisa que las carpetas existan.
- Revisa que el nombre del archivo este igual.
- Revisa mayusculas y minusculas.
- Revisa la indentacion del `pubspec.yaml`.
- Ejecuta `flutter pub get`.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues usaremos `SpriteSheetNadador`, una pieza de motor del juego, para convertir esas tiras de imagenes en animaciones.

## Actividad

1. Crea las carpetas de assets.
2. Copia `icono.png`.
3. Copia los sprites del nadador.
4. Registra las carpetas en `pubspec.yaml`.
5. Ejecuta `flutter pub get`.
6. Muestra `icono.png` temporalmente en pantalla.

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Agregar reglas nado](10_agregar_reglas_nado.md)  
[Siguiente leccion: Motor sprite sheet](12_motor_sprite_sheet_copiar_y_usar.md)  
