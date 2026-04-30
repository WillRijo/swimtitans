# Mover nadador

**Nivel:** Practicar

## Objetivo

Hacer que el nadador cambie de posicion cuando el jugador interactua.

## Herramientas que vamos a usar

- `pantalla_juego.dart`
- Estado del juego
- `setState`
- `GestureDetector`
- `_PiscinaSimple`
- Proyecto de referencia: `swimtitans_ejemplo`

## Idea principal

- El nadador se mueve porque cambia `progresoActual`.
- Cuando `progresoActual` cambia, tambien cambia `porcentajeDeLaVuelta`.
- La piscina usa ese porcentaje para dibujar el nadador mas adelante.
- Primero haremos que avance tocando la piscina.

## Paso 1: Recordar avanzarNadador

Ya existe esta funcion:

```dart
void avanzarNadador() {
  if (practicaTerminada) {
    return;
  }

  setState(() {
    progresoActual += widget.tipoNado.avancePorAccion;

    if (progresoActual >= progresoNecesarioParaGanar) {
      progresoActual = progresoNecesarioParaGanar;
      practicaTerminada = true;
    }
  });
}
```

Si la practica termino, no avanza.

Si no termino, suma avance al progreso.

Si llega a la meta, marca `practicaTerminada`.

## Paso 2: Hacer que la piscina reciba una funcion

Actualiza `_PiscinaSimple` para recibir una funcion:

```dart
class _PiscinaSimple extends StatelessWidget {
  const _PiscinaSimple({
    required this.porcentajeDeLaVuelta,
    required this.vaHaciaLaDerecha,
    required this.alTocarPiscina,
  });

  final double porcentajeDeLaVuelta;
  final bool vaHaciaLaDerecha;
  final VoidCallback alTocarPiscina;
```

## Paso 3: Envolver la piscina con GestureDetector

Dentro de `_PiscinaSimple`, envuelve el `Container` con `GestureDetector`:

```dart
return GestureDetector(
  onTap: alTocarPiscina,
  child: Container(
    height: 260,
    decoration: BoxDecoration(
      color: const Color(0xFF7DD3FC),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white, width: 6),
    ),
    child: Stack(
      children: [
        const _CarrilesSimples(),
        _NadadorTemporal(
          porcentajeDeLaVuelta: porcentajeDeLaVuelta,
          vaHaciaLaDerecha: vaHaciaLaDerecha,
        ),
      ],
    ),
  ),
);
```

`GestureDetector` detecta toques.

`onTap` ocurre cuando se toca.

`alTocarPiscina` es la funcion que queremos ejecutar.

## Paso 4: Pasar avanzarNadador a la piscina

Cuando uses `_PiscinaSimple`, pasa la funcion:

```dart
_PiscinaSimple(
  porcentajeDeLaVuelta: porcentajeDeLaVuelta,
  vaHaciaLaDerecha: vaHaciaLaDerecha,
  alTocarPiscina: avanzarNadador,
)
```

## Paso 5: Mostrar progreso para comprobar

Muestra el progreso:

```dart
Text(
  'Progreso: ${progresoActual.toInt()} / ${progresoNecesarioParaGanar.toInt()}',
)
```

## Paso 6: Mostrar mensaje si termina

Agrega:

```dart
if (practicaTerminada)
  const Text(
    'Llegaste a la meta',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  )
```

## Paso 7: Probar

1. Ejecuta la app.
2. Elige distancia.
3. Entra al juego.
4. Toca la piscina.
5. Mira que el nadador avanza.
6. Sigue tocando hasta llegar a la meta.

## Si algo sale mal

- Revisa que `_PiscinaSimple` tenga `alTocarPiscina`.
- Revisa que `GestureDetector` envuelva el `Container`.
- Revisa que `onTap` llame a `alTocarPiscina`.
- Revisa que `avanzarNadador` use `setState`.
- Si aparece error, copia el mensaje.

## Lo que haremos despues

Despues agregaremos reglas diferentes para cada tipo de nado:

- libre
- dorso
- pecho
- mariposa

## Actividad

1. Agrega `GestureDetector` a la piscina.
2. Toca la piscina para avanzar.
3. Cambia temporalmente `avancePorAccion` de Libre.
4. Prueba si el nadador avanza mas rapido o mas lento.

Pregunta:

Que variable cambia cuando el nadador avanza?

---

## Navegacion

[Volver al indice de seccion](00_indice.md)  
[Volver al indice principal](../00_indice.md)  
[Leccion anterior: Crear piscina simple](08_crear_piscina_simple.md)  
[Siguiente leccion: Agregar reglas nado](10_agregar_reglas_nado.md)  
