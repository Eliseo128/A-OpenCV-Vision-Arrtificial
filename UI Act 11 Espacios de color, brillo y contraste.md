¡Bienvenidos a la sesión de **Visión Artificial**! Hoy analizaremos cómo una computadora interpreta los colores de una imagen y cómo podemos manipular sus propiedades de luminosidad usando matemática matricial simple.

---

## 1. Explicación Didáctica de los Conceptos

Para un algoritmo, una imagen es una matriz de números enteros (de 0 a 255). Para procesarla correctamente, necesitamos entender tres pilares:

### A. Espacios de Color (RGB vs. BGR vs. Grayscale)

* **RGB (Red, Green, Blue):** Es el estándar universal en monitores y librerías como Matplotlib o PIL. La imagen se compone de **3 canales**: Rojo, Verde y Azul.
* **BGR (Blue, Green, Red):** Es el formato nativo que usa la librería **OpenCV** por razones históricas. Si lees una imagen con OpenCV y la muestras directamente en Matplotlib sin convertirla, los tonos rojos y azules se verán invertidos (la piel se verá azulada).
* **Escala de Grises (Grayscale):** Reduce la matriz a **1 solo canal**. El valor 0 representa negro puro y 255 blanco puro. Se calcula ponderando la percepción del ojo humano:

$$\text{Gris} = 0.299 \cdot R + 0.587 \cdot G + 0.114 \cdot B$$
<img width="380" height="263" alt="impacto" src="https://raw.githubusercontent.com/Eliseo128/A-OpenCV-Vision-Arrtificial/refs/heads/main/licensed-image.jpg" />


---

### B. Brillo y Contraste

Matemáticamente, ajustar brillo y contraste equivale a aplicar una función lineal a cada píxel $g(x, y)$:

$$g(x, y) = \alpha \cdot f(x, y) + \beta$$

* **Contraste ($\alpha$ - Factor multiplicativo):** Controla la dispersión de las intensidades. Si $\alpha > 1$, se amplía la diferencia entre zonas claras y oscuras; si $\alpha < 1$, la imagen se vuelve opaca y homogénea.
* **Brillo ($\beta$ - Factor aditivo):** Suma o resta una constante a todos los píxeles. Si $\beta > 0$, la imagen entera se aclara; si $\beta < 0$, se oscurece.
<img width="380" height="263" alt="impacto" src="https://github.com/user-attachments/assets/bdecf1f7-7888-43dd-ad0c-08de9e74d79f" />

---

---

## 2. Ejemplos de Código (Python + OpenCV + Matplotlib)

### Ejemplo 1: Conversión entre BGR, RGB y Escala de Grises

```python
import cv2
import matplotlib.pyplot as plt

# 1. Cargar imagen desde disco (OpenCV la lee en formato BGR)
img_bgr = cv2.imread('imagen_prueba.jpg')

# 2. Conversión BGR -> RGB (para visualizar correctamente con Matplotlib)
img_rgb = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2RGB)

# 3. Conversión BGR -> Escala de grises (1 solo canal)
img_gray = cv2.cvtColor(img_bgr, cv2.COLOR_BGR2GRAY)

# 4. Mostrar los resultados comparativos
fig, axes = plt.subplots(1, 3, figsize=(12, 4))
axes[0].imshow(img_bgr)
axes[0].set_title("Original en OpenCV (BGR incorrecto)")

axes[1].imshow(img_rgb)
axes[1].set_title("Convertido a RGB")

axes[2].imshow(img_gray, cmap='gray')
axes[2].set_title("Escala de Grises")

for ax in axes:
    ax.axis('off')

plt.tight_layout()
plt.show()

```

**Descripción breve:**

* `cv2.imread()` lee la imagen como una matriz tridimensional en formato **BGR**.
* `cv2.cvtColor()` permite cambiar el espacio de color. Se usó `cv2.COLOR_BGR2RGB` para corregir la visualización y `cv2.COLOR_BGR2GRAY` para simplificar la matriz a un único canal de intensidad.

---

### Ejemplo 2: Ajuste de Brillo y Contraste usando `cv2.convertScaleAbs`

```python
import cv2
import matplotlib.pyplot as plt

img_rgb = cv2.cvtColor(cv2.imread('imagen_prueba.jpg'), cv2.COLOR_BGR2RGB)

# Parámetros: alpha (contraste [1.0 - 3.0]) y beta (brillo [-100 a 100])
alpha = 1.5  # Aumenta el contraste en un 50%
beta = 30    # Aumenta el brillo en 30 unidades

# Aplicar la fórmula lineal: g(x,y) = alpha * f(x,y) + beta
# convertScaleAbs maneja el desbordamiento (clipping entre 0 y 255) automáticamente
img_ajustada = cv2.convertScaleAbs(img_rgb, alpha=alpha, beta=beta)

# Comparar resultados
fig, axes = plt.subplots(1, 2, figsize=(10, 5))
axes[0].imshow(img_rgb)
axes[0].set_title("Original")

axes[1].imshow(img_ajustada)
axes[1].set_title(f"Ajustada (Alpha={alpha}, Beta={beta})")

for ax in axes:
    ax.axis('off')

plt.show()

```

**Descripción breve:**

* Multiplicar los valores numéricos directamente con NumPy puede causar problemas de **saturación** (por ejemplo, $240 + 30 = 270$, lo cual sobrepasa el límite de `uint8`).
* `cv2.convertScaleAbs()` ejecuta la operación matricial asegurando que todo valor menor a 0 se mantenga en 0 y todo valor superior a 255 se trunque a 255 (*clipping*).

---

## 3. Reto de Aprendizaje Basado en Problemas (ABP)

> **Escenario de Aplicación Práctica:**
> Un sistema de lectura automática de matrículas de autos (ALPR) instalado en la entrada de un estacionamiento nocturno está capturando fotos con **mucha sombra y bajo contraste**, lo que impide detectar las letras de las placas.
> **Actividad para los estudiantes:**
> 1. Escriban una función en Python que reciba la imagen con bajo contraste.
> 2. Transfórmenla a escala de grises.
> 3. Experimenten con distintos valores de $\alpha$ y $\beta$ para hacer legibles las letras de la placa sin "quemar" (saturar a blanco) el fondo.
> 
>
