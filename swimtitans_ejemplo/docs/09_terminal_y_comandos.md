# Terminal y comandos

La terminal es una ventana donde se escriben comandos.

Los comandos ayudan a preparar, revisar y ejecutar el proyecto.

## Carpeta del proyecto

Antes de correr comandos, abre la terminal en esta carpeta:

```text
D:\dev\swimtitans\swimtitans_ejemplo
```

Tambien puedes entrar con:

```powershell
cd D:\dev\swimtitans\swimtitans_ejemplo
```

## flutter pub get

```powershell
flutter pub get
```

Descarga y prepara las dependencias del proyecto.

Se usa despues de cambiar `pubspec.yaml`.

## flutter analyze

```powershell
flutter analyze
```

Revisa el codigo y busca errores o advertencias.

Es util antes de ejecutar o compilar.

## flutter build web --debug

```powershell
flutter build web --debug
```

Compila la app para web en modo debug.

Sirve para confirmar que el proyecto puede construir correctamente.

## flutter run

```powershell
flutter run
```

Ejecuta la app.

Flutter puede pedir elegir un dispositivo, como Chrome, Windows, Android o iOS.

## dart run flutter_launcher_icons

```powershell
dart run flutter_launcher_icons
```

Genera los iconos de la app usando la configuracion de `pubspec.yaml`.

## Si un comando falla

Si un comando falla, puede significar varias cosas simples:

- Flutter no esta instalado o no esta en el PATH.
- La terminal no esta en la carpeta correcta.
- Falta correr `flutter pub get`.
- Hay un error en el codigo.
- Hay un problema en `pubspec.yaml`.

La terminal normalmente muestra un mensaje que ayuda a encontrar el problema.
