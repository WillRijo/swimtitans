# Instalar Flutter con VS Code

**Nivel:** Practicar

## Objetivo

Instalar Flutter usando VS Code para poder crear proyectos nuevos.

## Herramientas que vamos a usar

- VS Code
- Extension de Flutter
- Extension de Dart
- Flutter SDK
- Command Palette
- Terminal

## Idea principal

Flutter necesita dos cosas:

1. La extension de Flutter en VS Code.
2. El Flutter SDK instalado en la computadora.

Cuando instalamos la extension de Flutter, VS Code tambien instala la extension de Dart.

## Paso 1: Abrir VS Code

1. Abre VS Code desde **Applications** o con Spotlight.
2. Espera a que cargue.

## Paso 2: Instalar la extension Flutter

1. Abre **Extensions** en la barra lateral.
2. Tambien puedes usar `Command + Shift + X`.
3. Busca `Flutter`.
4. Elige la extension oficial de Flutter.
5. Presiona **Install**.

La extension de Dart se instala automaticamente.

## Paso 3: Abrir Command Palette

1. Presiona `Command + Shift + P`.
2. Se abrira **Command Palette**.

Command Palette es una cajita para buscar acciones de VS Code.

## Paso 4: Crear un proyecto para que VS Code detecte Flutter

1. Escribe `Flutter: New Project`.
2. Selecciona **Flutter: New Project**.
3. Si VS Code pregunta por el SDK y no esta instalado, elige **Download SDK**.

Elige una carpeta permanente para instalar Flutter, por ejemplo:

```text
~/developer
```

No uses carpetas protegidas como:

```text
/usr/bin
```

## Paso 5: Descargar Flutter SDK

Presiona **Clone Flutter** o **Download SDK**, segun aparezca.

Espera a que VS Code descargue Flutter.

Si VS Code pregunta si quieres agregar Flutter al `PATH`, acepta.

`PATH` significa que la computadora sabe donde encontrar Flutter cuando escribes comandos.

## Paso 6: Reiniciar VS Code

1. Cierra VS Code.
2. Abre VS Code otra vez.

Esto ayuda a que los cambios del `PATH` se apliquen.

## Si algo sale mal

- Si VS Code no encuentra Flutter, cierra y abre VS Code otra vez.
- Si pregunta donde esta el SDK, revisa la carpeta donde se descargo.
- Si aparece un error largo, copialo y pide ayuda.
- No borres carpetas sin estar seguro.

## Lo que haremos despues

En la siguiente leccion usaremos Flutter Doctor para revisar si la instalacion quedo bien.

## Actividad

1. Abre VS Code.
2. Instala la extension Flutter.
3. Confirma que Dart tambien se instalo.
4. Abre Command Palette.
5. Busca `Flutter: New Project`.
6. Si hace falta, descarga Flutter SDK desde VS Code.

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Instalar VS Code](06_instalar_vscode.md)  
[Siguiente leccion: Validar Flutter doctor](08_validar_flutter_doctor.md)  
