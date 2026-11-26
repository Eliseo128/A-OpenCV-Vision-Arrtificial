Te propongo una versión más didáctica, visual y organizada para los estudiantes. Conserva los **60 ejemplos**, pero mejora sus títulos, explicaciones y presentación. También ajusta algunos detalles técnicos para evitar errores al ejecutar los programas en Python.

Los ejemplos se organizan por dificultad y tipo de imagen. Cada uno incluye su número, nombre y código para que el alumno pueda identificarlo y reutilizarlo en las prácticas de visión artificial.

# 📸 60 imágenes de prueba para prácticas de Visión Artificial con Python

**Asignatura:** Soluciona problemas de Visión Artificial\
**Semestre:** Tercer semestre de preparatoria\
**Especialidad:** Inteligencia Artificial\
**Herramientas:** Visual Studio Code, Python, NumPy, Matplotlib y Scikit-image\
**Nivel:** De cero a principiante

---

## 🎯 Propósito de la actividad

Conocer y utilizar 60 imágenes diferentes para realizar prácticas de procesamiento digital de imágenes mediante Python.

Las imágenes permitirán experimentar con operaciones como:

- 🔍 Detección de bordes y contornos.
- 🎨 Análisis de colores y canales RGB.
- 🌫️ Aplicación de filtros y reducción de ruido.
- 📊 Análisis de histogramas y contraste.
- 🔄 Rotación, recorte y redimensionamiento.
- 🧩 Segmentación y reconocimiento de regiones.
- 📐 Detección de características y patrones.

**Importante:** Scikit-image incluye fotografías, imágenes científicas, texturas y patrones sintéticos. Por eso, no todos los ejemplos corresponden a fotografías reales.

## 🧰 Preparación del código

Antes de comenzar, importa las bibliotecas necesarias:

```
import numpy as np
import matplotlib.pyplot as plt

from skimage import data, draw, filters
from skimage import util, transform, exposure
from skimage import color, morphology, feature
```

Para visualizar cualquier imagen:

```
plt.imshow(imagen, cmap='gray')
plt.title('Imagen de prueba')
plt.axis('off')
plt.show()
```

> Nota: `cmap='gray'` se utiliza para imágenes en escala de grises. Para fotografías RGB, utiliza `plt.imshow(imagen)` sin indicar un mapa de color.

---

# 🅰️ Grupo A. Fotografías e imágenes clásicas de Scikit-image

**Ejemplos 1 al 15**

En este grupo conocerás imágenes de prueba que permiten practicar con objetos, personas, animales, textos y diferentes escenarios.

| Núm. | Imagen                       | Código Python                          |
| ---- | ---------------------------- | -------------------------------------- |
| 1    | 📷 Camarógrafo               | `imagen = data.camera()`               |
| 2    | 👩‍🚀 Astronauta             | `imagen = data.astronaut()`            |
| 3    | 🪙 Monedas                   | `imagen = data.coins()`                |
| 4    | 🌙 Superficie lunar          | `imagen = data.moon()`                 |
| 5    | 📄 Página de texto           | `imagen = data.page()`                 |
| 6    | 🔤 Texto impreso             | `imagen = data.text()`                 |
| 7    | 🐱 Gato Chelsea              | `imagen = data.chelsea()`              |
| 8    | ☕ Taza de café               | `imagen = data.coffee()`               |
| 9    | 🌌 Campo profundo del Hubble | `imagen = data.hubble_deep_field()`    |
| 10   | 🔬 Inmunohistoquímica        | `imagen = data.immunohistochemistry()` |
| 11   | 🖼️ Logotipo de Scikit-image | `imagen = data.logo()`                 |
| 12   | 🐎 Silueta de caballo        | `imagen = data.horse()`                |
| 13   | 🕰️ Reloj                    | `imagen = data.clock()`                |
| 14   | 🧱 Pared de ladrillos        | `imagen = data.brick()`                |
| 15   | 🌱 Césped                    | `imagen = data.grass()`                |

**Reto del estudiante:** selecciona tres imágenes y compara sus dimensiones, colores, texturas y niveles de intensidad.

---

# 🅱️ Grupo B. Imágenes sintéticas y patrones geométricos

**Ejemplos 16 al 30**

En este grupo crearás imágenes mediante NumPy y Scikit-image. Son ideales para comprender cómo funcionan los filtros y detectores, porque sus formas y patrones son controlados.

**16. 🫧 Manchas binarias aleatorias**

```
imagen = data.binary_blobs(
    length=128,
    blob_size_fraction=0.1,
    rng=7
)
```

**17. ♟️ Tablero de ajedrez**

```
imagen = data.checkerboard()
```

**18. 🌈 Degradado lineal horizontal**

```
imagen = np.tile(
    np.linspace(0, 255, 256, dtype=np.uint8),
    (256, 1)
)
```

**19. 🎯 Degradado radial**

```
x, y = np.ogrid[-1:1:256j, -1:1:256j]

imagen = np.clip(
    (1 - np.hypot(x, y)) * 255,
    0, 255
).astype(np.uint8)
```

**20. 📺 Ruido aleatorio (estática de televisión)**

```
imagen = np.random.randint(
    0, 256, (256, 256), dtype=np.uint8
)
```

**21. ⚪ Círculo sólido blanco**

```
imagen = np.zeros((100, 100), dtype=np.uint8)

rr, cc = draw.disk((50, 50), 30, shape=imagen.shape)
imagen[rr, cc] = 255
```

**22. ⬜ Cuadrado sólido blanco**

```
imagen = np.zeros((100, 100), dtype=np.uint8)

rr, cc = draw.rectangle(
    start=(25, 25),
    extent=(50, 50),
    shape=imagen.shape
)

imagen[rr, cc] = 255
```

**23. 🥚 Elipse sólida**

```
imagen = np.zeros((100, 100), dtype=np.uint8)

rr, cc = draw.ellipse(
    50, 50, 20, 40,
    shape=imagen.shape
)

imagen[rr, cc] = 255
```

**24. 📏 Línea diagonal**

```
imagen = np.zeros((100, 100), dtype=np.uint8)

rr, cc = draw.line(0, 0, 99, 99)
imagen[rr, cc] = 255
```

**25. ➕ Figura de cruz**

```
imagen = np.zeros((100, 100), dtype=np.uint8)

rr1, cc1 = draw.line(50, 10, 50, 90)
rr2, cc2 = draw.line(10, 50, 90, 50)

imagen[rr1, cc1] = 255
imagen[rr2, cc2] = 255
```

**26. 〰️ Onda senoidal bidimensional**

```
x, y = np.ogrid[0:256, 0:256]

imagen = (
    (np.sin(x / 10) * np.cos(y / 10) + 1) * 127.5
).astype(np.uint8)
```

**27. 🎯 Círculos concéntricos**

```
x, y = np.ogrid[-1:1:256j, -1:1:256j]

imagen = (
    (np.sin(15 * np.hypot(x, y)) + 1) * 127.5
).astype(np.uint8)
```

**28. 🧮 Cuadrícula de patrones**

```
imagen = data.checkerboard() > 0
```

**29. 🌈 Rueda de colores HSV**

```
from skimage.color import hsv2rgb

x, y = np.ogrid[-1:1:256j, -1:1:256j]

angulo = np.arctan2(y, x)

hsv = np.stack([
    (angulo + np.pi) / (2 * np.pi),
    np.ones_like(angulo),
    np.ones_like(angulo)
], axis=-1)

imagen = hsv2rgb(hsv)
```

**30. 🦓 Patrón de píxeles intercalados**

```
imagen = np.tile(
    np.array([[255, 0], [0, 255]], dtype=np.uint8),
    (128, 128)
)
```

**Reto del estudiante:** aplica Sobel y Canny a las imágenes 21, 22, 24 y 25. Identifica qué bordes detecta cada operador.

---

# 🅲 Grupo C. Imágenes científicas, médicas y de texturas

**Ejemplos 31 al 45**

Este grupo permite explorar imágenes utilizadas en investigación científica, microscopía, medicina y análisis de patrones.

> Importante: los nombres y la disponibilidad de algunos conjuntos de datos pueden variar según la versión de Scikit-image. Comprueba que la función exista en tu instalación antes de utilizarla.

| Núm. | Imagen o muestra                  | Código o procedimiento                                                            |
| ---- | --------------------------------- | --------------------------------------------------------------------------------- |
| 31   | 🔬 Células en microscopía         | `imagen = data.cells3d()`                                                         |
| 32   | 🫘 Tejido renal                   | `imagen = data.kidney()`                                                          |
| 33   | 👁️ Retina humana                 | `imagen = data.retina()`                                                          |
| 34   | 🧠 Imagen cerebral                | `imagen = data.brain()`                                                           |
| 35   | 🩺 Imagen de piel                 | `imagen = data.skin()`                                                            |
| 36   | 🧫 Muestra de mitosis humana      | `imagen = data.human_mitosis()`                                                   |
| 37   | 🔬 Células en división            | `imagen = data.human_mitosis()`                                                   |
| 38   | 🫧 Estructuras binarias simuladas | `imagen = data.binary_blobs(length=256, n_dim=2, blob_size_fraction=0.05, rng=5)` |
| 39   | 🌡️ Imagen de falso color térmico | `imagen = plt.cm.inferno(data.camera() / 255.0)[..., :3]`                         |
| 40   | 📡 Imagen con ruido tipo speckle  | `imagen = util.random_noise(data.camera(), mode='speckle', var=0.01)`             |
| 41   | 📝 Texto impreso                  | `imagen = data.text()`                                                            |
| 42   | 🧬 Estructura de ADN simulada     | Generar dos curvas con NumPy y dibujarlas en una matriz.                          |
| 43   | 🧪 Muestra histológica            | `imagen = data.immunohistochemistry()`                                            |
| 44   | 🌫️ Imagen con bajo contraste     | `imagen = np.clip(data.camera() * 0.3 + 50, 0, 255).astype(np.uint8)`             |
| 45   | ⚫ Imagen binaria invertida        | `imagen = np.logical_not(data.binary_blobs(length=128, rng=5))`                   |

**Reto del estudiante:** identifica qué imágenes son RGB, cuáles son de escala de grises y cuáles pueden requerir seleccionar un plano o canal antes de aplicar un filtro.

---

# 🅳 Grupo D. Variaciones y alteraciones de la imagen del camarógrafo

**Ejemplos 46 al 60**

En este grupo utilizarás una misma fotografía como imagen base: `data.camera()`.

El objetivo es modificar sus características para observar cómo reaccionan los filtros, detectores de bordes y algoritmos de procesamiento ante diferentes condiciones.

**46. 📷 Imagen original en escala de grises**

```
imagen = data.camera()
```

**47. 🌈 Imagen con falso color Jet**

```
imagen = plt.cm.jet(
    data.camera() / 255.0
)[..., :3]
```

**48. 🌫️ Ruido gaussiano**

```
imagen = util.random_noise(
    data.camera(),
    mode='gaussian',
    var=0.01
)
```

**49. ⚪ Ruido sal y pimienta**

```
imagen = util.random_noise(
    data.camera(),
    mode='s&p',
    amount=0.05
)
```

**50. 📡 Ruido Poisson**

```
imagen = util.random_noise(
    data.camera(),
    mode='poisson'
)
```

**51. 🌁 Desenfoque gaussiano**

```
imagen = filters.gaussian(
    data.camera(),
    sigma=3.0
)
```

**52. 🧹 Filtro de media**

```
from skimage.filters import rank
from skimage.morphology import footprint_rectangle

base = data.camera()

imagen = rank.mean(
    base,
    footprint=footprint_rectangle((5, 5))
)
```

**53. 📊 Ecualización local del histograma**

```
from skimage.filters import rank
from skimage.morphology import disk

base = data.camera()

imagen = rank.equalize(
    base,
    footprint=disk(9)
)
```

**54. ⚫ Imagen binaria con umbral de Otsu**

```
base = data.camera()

umbral = filters.threshold_otsu(base)

imagen = base > umbral
```

**55. 🔍 Bordes detectados con Canny**

```
imagen = feature.canny(
    data.camera(),
    sigma=1.5
)
```

**56. 🔄 Rotación de 45 grados**

```
imagen = transform.rotate(
    data.camera(),
    angle=45,
    resize=True
)
```

**57. 📉 Reducción de tamaño al 50 %**

```
imagen = data.camera()[::2, ::2]
```

**58. ✂️ Recorte de la región central**

```
imagen = data.camera()[156:356, 156:356]
```

**59. 🌑 Imagen en negativo**

```
imagen = 255 - data.camera()
```

**60. 🎚️ Ajuste de contraste**

```
imagen = exposure.rescale_intensity(
    data.camera(),
    in_range=(50, 200)
)
```

**Reto del estudiante:** compara la imagen original con las imágenes modificadas. Identifica cuáles alteraciones dificultan la detección de bordes y cuáles pueden mejorar el análisis.

---

# 🏆 Actividad integradora: ¡Pon a prueba los filtros!

Selecciona tres imágenes de grupos diferentes y aplica el procesamiento de bordes mediante Sobel y Canny.

**Ejemplo de selección:**

| Imagen                 | Número | Característica                    |
| ---------------------- | ------ | --------------------------------- |
| 🪙 Monedas             | 3      | Objetos reales y contornos curvos |
| ⚪ Círculo sólido       | 21     | Figura geométrica controlada      |
| ⚪ Ruido sal y pimienta | 49     | Imagen alterada con ruido         |

## Procedimiento

1. Carga la primera imagen utilizando su código correspondiente.
2. Visualiza la imagen original con Matplotlib.
3. Aplica el filtro Sobel.
4. Aplica el detector Canny.
5. Visualiza los tres resultados.
6. Repite el procedimiento con las otras dos imágenes.
7. Compara los resultados y escribe tus conclusiones.

## Preguntas de análisis

1. ¿Qué imagen permitió identificar mejor sus bordes?
2. ¿Qué diferencias observaste entre Sobel y Canny?
3. ¿Qué sucede cuando se aplica un detector de bordes a una imagen con ruido?
4. ¿Por qué conviene aplicar un filtro de suavizado antes de detectar bordes?
5. ¿Qué imagen utilizarías para practicar segmentación y por qué?

## 📋 Evidencia de aprendizaje

El estudiante deberá entregar:

- Tres imágenes originales.
- Tres resultados del filtro Sobel.
- Tres resultados del detector Canny.
- Una tabla comparativa.
- Cinco respuestas de análisis.

**Producto final:** un pequeño catálogo de procesamiento de imágenes que demuestre la capacidad del estudiante para cargar, visualizar, modificar y analizar imágenes mediante Python.

---

## 📚 Documentación de consulta

- Scikit-image: [https://scikit-image.org/docs/stable/](https://scikit-image.org/docs/stable/)
- Imágenes de prueba `skimage.data`: [https://scikit-image.org/docs/stable/api/skimage.data.html](https://scikit-image.org/docs/stable/api/skimage.data.html)
- NumPy: [https://numpy.org/doc/](https://numpy.org/doc/)
- Matplotlib: [https://matplotlib.org/stable/](https://matplotlib.org/stable/)

**Correcciones técnicas importantes:** se sustituyó `draw.circle` por `draw.disk`, se corrigió la rotación de 45 grados (no es lo mismo que `np.rot90`, que gira 90 grados), se utiliza `feature.canny` en lugar de `filters.canny` y se ajustaron los filtros de rango para trabajar con imágenes compatibles.

También conviene verificar las imágenes científicas del grupo C en la versión instalada de Scikit-image: algunas funciones mencionadas en la lista original no están disponibles con esos nombres.
