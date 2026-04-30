# Instalar herramientas en macOS

**Nivel:** Practicar

## Objetivo

Preparar macOS con las herramientas necesarias antes de instalar y usar Flutter.

## Herramientas que vamos a usar

- macOS
- Terminal
- Xcode Command Line Tools
- Git
- Rosetta 2, solo si la Mac usa chip Apple Silicon
- VS Code, se instalara en la siguiente leccion

## Idea principal

Antes de crear apps Flutter, la computadora necesita algunas herramientas basicas.

Terminal es una app donde escribimos comandos.

No pasa nada si parece raro al principio. Iremos paso a paso.

## Paso 1: Abrir Terminal

1. Presiona `Command + Space` para abrir Spotlight.
2. Escribe `Terminal`.
3. Presiona `Enter`.

Se abrira una ventana donde puedes escribir comandos.

## Paso 2: Instalar Xcode Command Line Tools

En Terminal, escribe este comando y presiona `Enter`:

```bash
xcode-select --install
```

Este comando instala herramientas que Flutter necesita.

Tambien instala Git o prepara el sistema para usar Git.

Puede aparecer una ventana. Presiona **Install** o **Instalar**.

Despues espera a que termine.

## Paso 3: Instalar Rosetta 2 solo en Mac con Apple Silicon

Este paso es solo para Mac con chip M1, M2, M3 o nuevo.

Si la Mac es Intel, puedes saltar este paso.

En Terminal, escribe este comando y presiona `Enter`:

```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

`sudo` puede pedir la contrasena de la Mac.

Cuando escribes la contrasena, puede parecer que no aparece nada. Eso es normal.

Presiona `Enter` al terminar.

## Paso 4: Revisar que Git responde

En Terminal, escribe este comando y presiona `Enter`:

```bash
git --version
```

Si aparece un numero de version, Git esta listo.

Si aparece una ventana o mensaje, leelo con calma y pide ayuda si hace falta.

## Si algo sale mal

No te preocupes.

Lee el mensaje.

No cierres Terminal inmediatamente.

Pide ayuda y copia el mensaje de error.

Muchas veces solo falta aceptar una instalacion.

## Lo que haremos despues

En la siguiente leccion instalaremos Visual Studio Code.

VS Code sera el lugar donde escribiremos el codigo.

## Actividad

1. Abre Terminal.
2. Ejecuta `xcode-select --install`.
3. Ejecuta `git --version`.
4. Escribe en una hoja o nota: "Terminal sirve para escribir comandos".
