Aquí tienes **60 ejemplos diferentes y numerados**, diseñados específicamente para prácticas de Visión Artificial en Python. 

Para llegar a 60 ejemplos útiles y reales (ya que `skimage` tiene un número limitado de imágenes nativas), he dividido la lista en **4 categorías**: imágenes nativas de `scikit-image`, imágenes sintéticas generadas con `numpy`/`skimage`, imágenes científicas/médicas de `skimage`, y **variaciones procesadas de la imagen del camarógrafo** (ideal para probar cómo reaccionan los filtros ante diferentes condiciones).

Todos los ejemplos asumen que ya has importado:  
`import numpy as np`, `from skimage import data, draw, filters, util`, `import matplotlib.pyplot as plt`.

---

### **Grupo A: Imágenes clásicas de prueba de `skimage.data` (1-15)**
1. **Camarógrafo:** `imagen = data.camera()`
2. **Astronauta:** `imagen = data.astronaut()`
3. **Monedas:** `imagen = data.coins()`
4. **Luna:** `imagen = data.moon()`
5. **Página de texto:** `imagen = data.page()`
6. **Texto microscópico:** `imagen = data.text()`
7. **Gato (Chelsea):** `imagen = data.chelsea()`
8. **Taza de café:** `imagen = data.coffee()`
9. **Campo profundo del Hubble:** `imagen = data.hubble_deep_field()`
10. **Inmunohistoquímica:** `imagen = data.immunohistochemistry()`
11. **Logo de scikit-image:** `imagen = data.logo()`
12. **Caballo:** `imagen = data.horse()`
13. **Reloj antiguo:** `imagen = data.clock()`
14. **Pared de ladrillos:** `imagen = data.brick()`
15. **Césped:** `imagen = data.grass()`

---

### **Grupo B: Imágenes sintéticas y patrones generados (16-30)**
*(Ideales para probar filtros sin el "ruido" de una fotografía real)*
16. **Manchas binarias aleatorias:** `imagen = data.binary_blobs(length=128, blob_size_fraction=0.1)`
17. **Tablero de ajedrez:** `imagen = data.checkerboard()`
18. **Degradado lineal horizontal:** `imagen = np.linspace(0, 255, 256, dtype=np.uint8).reshape(1, 256)`
19. **Degradado radial (círculo):** `x, y = np.ogrid[-1:1:256j, -1:1:256j]; imagen = (1 - np.hypot(x, y)) * 255`
20. **Ruido aleatorio (TV estática):** `imagen = np.random.randint(0, 256, (256, 256), dtype=np.uint8)`
21. **Círculo sólido blanco:** `imagen = np.zeros((100, 100)); rr, cc = draw.circle(50, 50, 30); imagen[rr, cc] = 255`
22. **Cuadrado sólido blanco:** `imagen = np.zeros((100, 100)); rr, cc = draw.rectangle((25, 25), extent=(50, 50)); imagen[rr, cc] = 255`
23. **Elipse sólida:** `imagen = np.zeros((100, 100)); rr, cc = draw.ellipse(50, 50, 20, 40); imagen[rr, cc] = 255`
24. **Línea diagonal:** `imagen = np.zeros((100, 100)); rr, cc = draw.line(0, 0, 99, 99); imagen[rr, cc] = 255`
25. **Cruz (+):** `imagen = np.zeros((100, 100)); rr1, cc1 = draw.line(50, 10, 50, 90); rr2, cc2 = draw.line(10, 50, 90, 50); imagen[rr1, cc1] = 255; imagen[rr2, cc2] = 255`
26. **Onda senoidal 2D:** `x, y = np.ogrid[0:256, 0:256]; imagen = (np.sin(x/10) * np.cos(y/10) + 1) * 127`
27. **Círculos concéntricos:** `x, y = np.ogrid[-1:1:256j, -1:1:256j]; imagen = (np.sin(15 * np.hypot(x, y)) + 1) * 127`
28. **Cuadrícula (Grid):** `imagen = data.checkerboard() > 0.5` (o generar con `np.indices`)
29. **Rueda de colores (HSV a RGB):** `x, y = np.ogrid[-1:1:256j, -1:1:256j]; angulo = np.arctan2(y, x); imagen = hsv2rgb(np.stack([ (angulo+np.pi)/(2*np.pi), np.ones_like(angulo), np.ones_like(angulo) ], axis=-1))`
30. **Píxeles intercalados (patrón de cebra):** `imagen = np.tile([[255, 0], [0, 255]], (128, 128))`

---

### **Grupo C: Imágenes científicas y médicas de `skimage` (31-45)**
*(Excelentes para practicar segmentación y detección de bordes en texturas complejas)*
31. **Célula (microscopía):** `imagen = data.cell()`
32. **Tejido renal:** `imagen = data.kidney()`
33. **Retina humana:** `imagen = data.retina()`
34. **Corte de cerebro (MRI):** `imagen = data.brain()`
35. **Lesión de piel (melanoma):** `imagen = data.skin()`
36. **Radiografía de tórax (simulada):** `imagen = np.load(data.get_data_file("data", "lung.npz"))['lung']` *(Nota: requiere descarga previa o usar `data.human_mitosis` como alternativa segura)* -> **Alternativa segura:** `imagen = data.human_mitosis()`
37. **Células en mitosis:** `imagen = data.human_mitosis()`
38. **Vasos sanguíneos (simulado con blobs):** `imagen = data.binary_blobs(length=256, n_dim=2, blob_size_fraction=0.05)`
39. **Imagen térmica simulada:** `base = data.camera(); imagen = plt.cm.inferno(base / 255.0)[..., :3]`
40. **Ultrasonido simulado (con ruido speckle):** `base = data.camera(); imagen = base + np.random.normal(0, 30, base.shape)`
41. **Texto manuscrito:** `imagen = data.text()`
42. **Estructura de ADN (simulada):** `x = np.linspace(0, 4*np.pi, 256); y1 = np.sin(x); y2 = np.cos(x); imagen = np.zeros((256,256));` *(requiere dibujo con `draw.line`)*
43. **Muestra histológica:** `imagen = data.immunohistochemistry()`
44. **Imagen con bajo contraste:** `imagen = np.uint8(data.camera() * 0.3 + 50)`
45. **Imagen binaria invertida:** `imagen = ~data.binary_blobs(length=128)`

---

### **Grupo D: Variaciones procesadas de la imagen del Camarógrafo (46-60)**
*(Fundamental para que el estudiante vea cómo un mismo filtro Sobel/FFT se comporta ante diferentes alteraciones de la imagen base)*

46. **Camarógrafo original (escala de grises):** `imagen = data.camera()`
47. **Camarógrafo en "Falso Color" (Colormap Jet):** `imagen = plt.cm.jet(data.camera() / 255.0)[..., :3]`
48. **Camarógrafo con Ruido Gaussiano:** `imagen = util.random_noise(data.camera(), mode='gaussian', var=0.01)`
49. **Camarógrafo con Ruido Sal y Pimienta:** `imagen = util.random_noise(data.camera(), mode='s&p', amount=0.05)`
50. **Camarógrafo con Ruido Poisson:** `imagen = util.random_noise(data.camera(), mode='poisson')`
51. **Camarógrafo con Desenfoque Gaussiano (Blur):** `imagen = filters.gaussian(data.camera(), sigma=3.0)`
52. **Camarógrafo con Desenfoque Medio (Mean):** `imagen = filters.rank.mean(data.camera(), np.ones((5,5)))`
53. **Camarógrafo con Ecualización de Histograma:** `imagen = filters.rank.equalize(data.camera(), np.ones((9,9)))`
54. **Camarógrafo Binario (Umbral de Otsu):** `imagen = data.camera() > filters.threshold_otsu(data.camera())`
55. **Camarógrafo con bordes Canny (como imagen base):** `imagen = filters.canny(data.camera(), sigma=1.5)`
56. **Camarógrafo rotado 45 grados:** `imagen = np.rot90(data.camera(), k=1)` *(o usar `transform.rotate`)*
57. **Camarógrafo escalado al 50% (Downsampling):** `imagen = data.camera()[::2, ::2]`
58. **Camarógrafo con recorte (Crop) al centro:** `imagen = data.camera()[156:356, 156:356]`
59. **Camarógrafo en negativo (Invertido):** `imagen = 255 - data.camera()`
60. **Camarógrafo con ajuste de contraste (Stretch):** `imagen = exposure.rescale_intensity(data.camera(), in_range=(50, 200))`

---

### 💡 **Cómo usar esta lista en clase:**
Puedes pedir a los estudiantes que elijan **3 ejemplos de diferentes grupos** (por ejemplo: el #3 *Monedas*, el #20 *Círculo sólido* y el #49 *Camarógrafo con Sal y Pimienta*) y que apliquen el **Ejemplo 4 (Magnitud del Gradiente)** de la práctica anterior a cada uno. 

Esto les permitirá observar cómo:
1. El filtro Sobel funciona perfecto en formas sintéticas (#20).
2. El ruido "Sal y Pimienta" (#49) genera falsos bordes que el filtro detecta erróneamente (introduciendo la necesidad de filtros de suavizado previos).
3. Las texturas complejas (#3) generan respuestas de gradiente muy ricas en detalles.
