# Retos faciles

**Nivel:** Practicar

## Objetivo

Probar cambios pequenos para ganar confianza.

## Herramientas que vamos a usar

- Proyecto nuevo de Swim Titans
- Pantalla de inicio
- Pantalla de juego
- Textos
- Colores
- Valores simples

## Idea principal

Los retos faciles son cambios pequenos.

Sirven para perder miedo a tocar el codigo.

Despues de cada cambio, prueba la app.

Si algo falla, puedes deshacer el ultimo cambio.

## Reto 1: Cambiar el texto del boton principal

Archivo:

```text
lib/pantallas/pantalla_inicio.dart
```

Cambia:

```text
Iniciar practica
```

Por ejemplo:

```text
Vamos a nadar
```

Prueba que el boton se sigue viendo bien.

## Reto 2: Cambiar el color del titulo

Archivo:

```text
lib/pantallas/pantalla_inicio.dart
```

Busca el color del titulo `Swim Titans`.

Prueba otro color, por ejemplo:

```dart
Color(0xFF0EA5E9)
```

## Reto 3: Cambiar el color de la piscina

Archivo:

```text
lib/widgets/vista_piscina.dart
```

Busca el color azul de la piscina.

Prueba un azul diferente.

Ejemplo:

```dart
Color(0xFF38BDF8)
```

## Reto 4: Cambiar la velocidad de Libre

Archivo:

```text
lib/modelos/tipo_nado.dart
```

Busca:

```dart
case TipoNado.libre:
  return 3;
```

Cambia temporalmente `3` por `4`.

Prueba si el nadador avanza mas rapido.

## Reto 5: Cambiar el mensaje final

Archivo:

```text
lib/pantallas/pantalla_juego.dart
```

Busca:

```text
Llegaste a la meta
```

Cambia por:

```text
Gran trabajo
```

## Reto 6: Cambiar el tamano del icono

Archivo:

```text
lib/pantallas/pantalla_inicio.dart
```

Busca `tamanoDelIcono` o `tamanoIcono`.

Prueba un tamano un poco menor o mayor.

## Reto 7: Cambiar el texto de ayuda

Archivo:

```text
lib/pantallas/pantalla_juego.dart
```

Busca textos como:

```text
Alterna izquierda y derecha
Desliza hacia arriba
Presiona ambos lados
```

Cambia uno por un texto mas divertido.

## Consejo

Despues de cada reto, ejecuta:

```bash
flutter analyze
flutter run
```

## Si algo sale mal

- Lee el mensaje.
- Revisa el ultimo cambio.
- Deshaz el cambio si hace falta.
- Prueba otra vez.

## Actividad

1. Elige solo un reto facil.
2. Hazlo.
3. Prueba la app.
4. Escribe:

```text
El cambio que hice fue: ____
```

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Retos](00_indice.md)  
[Siguiente leccion: Retos medios](02_retos_medios.md)  
