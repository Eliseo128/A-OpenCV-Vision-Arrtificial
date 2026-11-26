Aquí tienes la versión mejorada, optimizada y **completa** de la práctica guiada. Se han corregido los fragmentos de código que estaban cortados, se ha estandarizado el nombre de los archivos Python (usando guiones bajos `_` en lugar de guiones medios `-` para evitar errores de importación en Python) y se ha enriquecido la explicación para que sea 100% amigable para estudiantes principiantes, sin perder ninguna estructura ni contenido original.

---

# **Práctica guiada: Procesamiento de imágenes mediante filtros Sobel en el dominio de la frecuencia**

**Nivel:** Cero a principiante  
**Duración:** 2 horas  

**Asignatura:** Soluciona problemas de Visión Artificial  
**Especialidad:** Inteligencia Artificial  
**Submódulo 3:** Soluciona problemas de Visión Artificial  
**Semestre:** Tercer semestre de preparatoria  
**IDE:** Visual Studio Code  
**Lenguaje:** Python  
**Librerías:** OpenCV, NumPy, Matplotlib y Scikit-image  
**Carpeta de trabajo:** `u3-p7-proce-img-img-0777`

---

## **1. Propósito de la práctica**
Que los estudiantes comprendan cómo se pueden detectar bordes y cambios de intensidad en una imagen utilizando los filtros Sobel X y Sobel Y en el dominio de la frecuencia.

Se trabajará con la imagen clásica del "camarógrafo" incluida en `skimage.data.camera()`.

**Al finalizar, el estudiante podrá:**
1. Cargar y visualizar una imagen en escala de grises.
2. Comprender la diferencia entre el dominio espacial y el dominio de la frecuencia.
3. Identificar qué es la Transformada Rápida de Fourier (FFT).
4. Aplicar el filtro Sobel X en el dominio de la frecuencia.
5. Aplicar el filtro Sobel Y en el dominio de la frecuencia.
6. Visualizar los espectros de frecuencia antes y después del filtrado.
7. Calcular la magnitud del gradiente para identificar bordes de manera integral.

---

## **2. Explicación de los conceptos básicos**

### **2.1 Imagen del camarógrafo**
Utilizaremos una fotografía de prueba estándar que proporciona la librería Scikit-image:
```python
from skimage import data
imagen = data.camera()
```
**Características de `data.camera()`:**
- Alto: 512 píxeles.
- Ancho: 512 píxeles.
- Canales: 1 (escala de grises).
- Valores de intensidad: 0 (negro) a 255 (blanco).

### **2.2 ¿Qué es el procesamiento en el dominio espacial?**
Es trabajar directamente con los píxeles de una imagen. Por ejemplo, recorrer la imagen y aplicar una matriz (kernel) sobre cada píxel y sus vecinos para detectar bordes.

### **2.3 ¿Qué es el dominio de la frecuencia?**
Es una representación matemática de la imagen que nos permite observar qué "frecuencias" de cambio de intensidad contiene:
- **Frecuencias bajas:** Representan cambios suaves, sombras y regiones uniformes (el centro del espectro).
- **Frecuencias altas:** Representan cambios rápidos, detalles finos, ruido y **bordes** (los bordes exteriores del espectro).

Para transformar una imagen al dominio de la frecuencia utilizamos la Transformada Rápida de Fourier (FFT):
```python
transformada = np.fft.fft2(imagen)
espectro = np.fft.fftshift(transformada) # Mueve las bajas frecuencias al centro
```

### **2.4 ¿Qué es el filtro Sobel?**
Es un operador que detecta cambios de intensidad. Utiliza dos matrices (kernels) de 3x3:

**Sobel X** (Detecta bordes verticales, midiendo cambios en dirección horizontal):
$$ G_x = \begin{bmatrix} -1 & 0 & 1 \\ -2 & 0 & 2 \\ -1 & 0 & 1 \end{bmatrix} $$

**Sobel Y** (Detecta bordes horizontales, midiendo cambios en dirección vertical):
$$ G_y = \begin{bmatrix} -1 & -2 & -1 \\ 0 & 0 & 0 \\ 1 & 2 & 1 \end{bmatrix} $$

### **2.5 ¿Qué es la magnitud del gradiente?**
Es el resultado de combinar las respuestas de Sobel X y Sobel Y para obtener la intensidad total del borde, sin importar su orientación:
$$ G = \sqrt{G_x^2 + G_y^2} $$

---

## **3. Preparación del entorno de trabajo en VS Code**

### **Paso 1. Crear la carpeta del proyecto**
Abre Visual Studio Code, abre la terminal (`Terminal → New Terminal`) y asegúrate de que sea PowerShell. Escribe:
```powershell
mkdir u3-p7-proce-img-img-0777
cd u3-p7-proce-img-img-0777
```

### **Paso 2. Crear y activar el entorno virtual**
```powershell
python -m venv .env-va-0777
.\.env-va-0777\Scripts\Activate.ps1
```
*(Si aparece un error rojo de ejecución, ejecuta primero: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` y vuelve a activar).*

### **Paso 3. Instalar las librerías**
```powershell
python -m pip install --upgrade pip
pip install opencv-python numpy matplotlib scikit-image
pip freeze > requirements.txt
```

---

## **4. Estructura de carpetas y archivos**
Ejecuta en la terminal:
```powershell
mkdir codigopy-0777
mkdir resultados-img-0777
```

> **⚠️ REGLA DE ORO EN PYTHON:** Los nombres de los archivos que se van a importar como módulos **deben usar guiones bajos (`_`)**, no guiones medios (`-`), ya que Python interpreta el guion medio como un signo de resta y causará un error de sintaxis.

Crea los siguientes 5 archivos dentro de `codigopy-0777`:
1. `funciones_frecuencia_0777.py`
2. `ejemplo1_espectro_0777.py`
3. `ejemplo2_sobel_x_0777.py`
4. `ejemplo3_sobel_y_0777.py`
5. `ejemplo4_magnitud_gradiente_0777.py`

---

## **5. Preparar las funciones comunes (Código Completo)**

Abre el archivo `codigopy-0777/funciones_frecuencia_0777.py` y copia **este código completo**. Este archivo contiene las herramientas que reutilizaremos.

```python
# =====================================================
# ARCHIVO: funciones_frecuencia_0777.py
# PROPÓSITO: Funciones compartidas para procesamiento en frecuencia
# =====================================================
import numpy as np
import cv2
import os
from skimage import data
import matplotlib.pyplot as plt

def cargar_imagen():
    """Obtiene la imagen del camarógrafo en escala de grises."""
    return data.camera()

def obtener_espectro(imagen):
    """Calcula la Transformada de Fourier y devuelve el espectro visualizable."""
    # 1. Transformada de Fourier 2D
    f_transform = np.fft.fft2(imagen)
    # 2. Desplazamiento del origen al centro
    f_shift = np.fft.fftshift(f_transform)
    # 3. Magnitud y escala logarítmica para visualización (evitamos log(0) sumando 1)
    espectro = 20 * np.log(np.abs(f_shift) + 1)
    return espectro

def aplicar_filtro_frecuencia(imagen, kernel):
    """
    Aplica un kernel en el dominio de la frecuencia.
    Se añade un borde de relleno (padding) para evitar artefactos de convolución circular.
    """
    pad_size = 1
    # Rellenar la imagen con un borde reflejado
    imagen_padded = np.pad(imagen, pad_size, mode='reflect')
    rows, cols = imagen_padded.shape
    
    # Crear un kernel del mismo tamaño que la imagen, centrado en ceros
    kernel_padded = np.zeros((rows, cols), dtype=np.float32)
    k_rows, k_cols = kernel.shape
    start_r = (rows - k_rows) // 2
    start_c = (cols - k_cols) // 2
    kernel_padded[start_r:start_r+k_rows, start_c:start_c+k_cols] = kernel
    
    # Mover el centro del kernel al origen (esquina superior izquierda) para la FFT
    kernel_padded_shifted = np.fft.ifftshift(kernel_padded)
    
    # Transformada de Fourier de la imagen y del kernel
    fft_img = np.fft.fft2(imagen_padded)
    fft_ker = np.fft.fft2(kernel_padded_shifted)
    
    # Multiplicación en el dominio de la frecuencia (Teorema de la Convolución)
    resultado_fft = fft_img * fft_ker
    
    # Regresar al dominio espacial con la Transformada Inversa
    resultado_complejo = np.fft.ifft2(resultado_fft)
    resultado_real = np.real(resultado_complejo)
    
    # Quitar el píxel de relleno añadido al principio
    return resultado_real[pad_size:-pad_size, pad_size:-pad_size]

def normalizar_visualizacion(imagen):
    """Convierte una respuesta de filtro (con valores negativos/positivos) a 0-255."""
    imagen_abs = np.abs(imagen)
    imagen_normalizada = cv2.normalize(
        imagen_abs, None, 0, 255, cv2.NORM_MINMAX
    )
    return imagen_normalizada.astype(np.uint8)

def guardar_grafica(figura, nombre_archivo):
    """Guarda una figura de matplotlib dentro de la carpeta resultados-img-0777."""
    carpeta = "resultados-img-0777"
    os.makedirs(carpeta, exist_ok=True)
    ruta = os.path.join(carpeta, nombre_archivo)
    figura.savefig(ruta, dpi=150, bbox_inches="tight")
    print(f"✅ Imagen guardada correctamente en: {ruta}")
```

---

## **6. Ejemplo 1: Cargar la imagen y visualizar su espectro**

Abre `codigopy-0777/ejemplo1_espectro_0777.py` y pega el siguiente código completo:

```python
# =====================================================
# EJEMPLO 1: IMAGEN ORIGINAL Y ESPECTRO DE FRECUENCIA
# =====================================================
import matplotlib.pyplot as plt
from funciones_frecuencia_0777 import (
    cargar_imagen,
    obtener_espectro,
    guardar_grafica
)

# 1. Cargar la imagen
imagen = cargar_imagen()

# 2. Calcular el espectro de frecuencia
espectro = obtener_espectro(imagen)

# 3. Mostrar dimensiones en consola
print("--- EJEMPLO 1 ---")
print("Imagen del camarógrafo cargada.")
print(f"Dimensiones: Alto={imagen.shape[0]}, Ancho={imagen.shape[1]}")

# 4. Crear la figura con 2 subgráficas (1 fila, 2 columnas)
figura, ejes = plt.subplots(1, 2, figsize=(12, 6))

# 5. Mostrar imagen original
ejes[0].imshow(imagen, cmap="gray")
ejes[0].set_title("Imagen Original (Dominio Espacial)")
ejes[0].axis("off")

# 6. Mostrar espectro de frecuencia
ejes[1].imshow(espectro, cmap="gray")
ejes[1].set_title("Espectro de Frecuencia (Dominio de Frecuencia)")
ejes[1].axis("off")

plt.tight_layout()

# 7. Guardar y mostrar
guardar_grafica(figura, "01_imagen_y_espectro.png")
plt.show()
```
**Ejecutar:** `python .\codigopy-0777\ejemplo1_espectro_0777.py`  
**Interpretación:** El centro brillante son las frecuencias bajas (el fondo y las zonas suaves). Los puntos dispersos hacia los bordes son las frecuencias altas (los detalles y contornos del camarógrafo).

---

## **7. Ejemplo 2: Aplicar el filtro Sobel X en el dominio de la frecuencia**

Abre `codigopy-0777/ejemplo2_sobel_x_0777.py` y pega el código completo:

```python
# =====================================================
# EJEMPLO 2: SOBEL X EN EL DOMINIO DE LA FRECUENCIA
# =====================================================
import numpy as np
import matplotlib.pyplot as plt
from funciones_frecuencia_0777 import (
    cargar_imagen,
    obtener_espectro,
    aplicar_filtro_frecuencia,
    normalizar_visualizacion,
    guardar_grafica
)

# 1. Cargar imagen original
imagen = cargar_imagen()

# 2. Crear kernel Sobel X (Detecta cambios horizontales -> resalta bordes verticales)
sobel_x = np.array([
    [-1, 0, 1],
    [-2, 0, 2],
    [-1, 0, 1]
], dtype=np.float32)

# 3. Aplicar Sobel X en el dominio de la frecuencia
resultado_x = aplicar_filtro_frecuencia(imagen, sobel_x)

# 4. Calcular el espectro de la respuesta filtrada
espectro_x = obtener_espectro(resultado_x)

# 5. Normalizar la respuesta para poder visualizarla (0 a 255)
imagen_x_normalizada = normalizar_visualizacion(resultado_x)

# 6. Mostrar resultados
figura, ejes = plt.subplots(1, 3, figsize=(15, 5))

ejes[0].imshow(imagen, cmap="gray")
ejes[0].set_title("Imagen Original")
ejes[0].axis("off")

ejes[1].imshow(espectro_x, cmap="gray")
ejes[1].set_title("Espectro después de Sobel X")
ejes[1].axis("off")

ejes[2].imshow(imagen_x_normalizada, cmap="gray")
ejes[2].set_title("Respuesta Sobel X (Bordes Verticales)")
ejes[2].axis("off")

plt.tight_layout()
guardar_grafica(figura, "02_sobel_x.png")
plt.show()
```
**Ejecutar:** `python .\codigopy-0777\ejemplo2_sobel_x_0777.py`  
**Interpretación:** Observa cómo el camarógrafo y el trípode (líneas verticales) se iluminan intensamente, mientras que las líneas horizontales casi desaparecen.

---

## **8. Ejemplo 3: Aplicar el filtro Sobel Y en el dominio de la frecuencia**

Abre `codigopy-0777/ejemplo3_sobel_y_0777.py` y pega el código completo:

```python
# =====================================================
# EJEMPLO 3: SOBEL Y EN EL DOMINIO DE LA FRECUENCIA
# =====================================================
import numpy as np
import matplotlib.pyplot as plt
from funciones_frecuencia_0777 import (
    cargar_imagen,
    obtener_espectro,
    aplicar_filtro_frecuencia,
    normalizar_visualizacion,
    guardar_grafica
)

# 1. Cargar imagen original
imagen = cargar_imagen()

# 2. Crear kernel Sobel Y (Detecta cambios verticales -> resalta bordes horizontales)
sobel_y = np.array([
    [-1, -2, -1],
    [ 0,  0,  0],
    [ 1,  2,  1]
], dtype=np.float32)

# 3. Aplicar Sobel Y en el dominio de la frecuencia
resultado_y = aplicar_filtro_frecuencia(imagen, sobel_y)

# 4. Calcular el espectro de la respuesta filtrada
espectro_y = obtener_espectro(resultado_y)

# 5. Normalizar la respuesta para visualizarla
imagen_y_normalizada = normalizar_visualizacion(resultado_y)

# 6. Mostrar resultados
figura, ejes = plt.subplots(1, 3, figsize=(15, 5))

ejes[0].imshow(imagen, cmap="gray")
ejes[0].set_title("Imagen Original")
ejes[0].axis("off")

ejes[1].imshow(espectro_y, cmap="gray")
ejes[1].set_title("Espectro después de Sobel Y")
ejes[1].axis("off")

ejes[2].imshow(imagen_y_normalizada, cmap="gray")
ejes[2].set_title("Respuesta Sobel Y (Bordes Horizontales)")
ejes[2].axis("off")

plt.tight_layout()
guardar_grafica(figura, "03_sobel_y.png")
plt.show()
```
**Ejecutar:** `python .\codigopy-0777\ejemplo3_sobel_y_0777.py`  
**Interpretación:** Ahora se resaltan los bordes del sombrero, la mesa y el suelo (líneas horizontales), mientras que los bordes verticales se atenúan.

---

## **9. Ejemplo 4: Calcular la magnitud del gradiente y comparar**

Abre `codigopy-0777/ejemplo4_magnitud_gradiente_0777.py` y pega el código completo:

```python
# =====================================================
# EJEMPLO 4: MAGNITUD DEL GRADIENTE (SOBEL X + SOBEL Y)
# =====================================================
import numpy as np
import matplotlib.pyplot as plt
from funciones_frecuencia_0777 import (
    cargar_imagen,
    obtener_espectro,
    aplicar_filtro_frecuencia,
    normalizar_visualizacion,
    guardar_grafica
)

# 1. Cargar imagen original
imagen = cargar_imagen()

# 2. Definir kernels
sobel_x = np.array([[-1, 0, 1], [-2, 0, 2], [-1, 0, 1]], dtype=np.float32)
sobel_y = np.array([[-1, -2, -1], [0, 0, 0], [1, 2, 1]], dtype=np.float32)

# 3. Aplicar ambos filtros en frecuencia
resultado_x = aplicar_filtro_frecuencia(imagen, sobel_x)
resultado_y = aplicar_filtro_frecuencia(imagen, sobel_y)

# 4. Calcular la magnitud del gradiente: G = sqrt(Gx^2 + Gy^2)
# Nota: Usamos los resultados crudos (antes de normalizar) para la operación matemática correcta
magnitud_gradiente = np.sqrt(resultado_x**2 + resultado_y**2)

# 5. Normalizar todas las respuestas para visualización
img_x_norm = normalizar_visualizacion(resultado_x)
img_y_norm = normalizar_visualizacion(resultado_y)
img_mag_norm = normalizar_visualizacion(magnitud_gradiente)

# 6. Calcular espectros para visualización comparativa
espectro_x = obtener_espectro(resultado_x)
espectro_y = obtener_espectro(resultado_y)

# 7. Mostrar los 6 resultados en una cuadrícula de 2x3
figura, ejes = plt.subplots(2, 3, figsize=(18, 10))

# Fila 1: Imagen original y Espectros
ejes[0, 0].imshow(imagen, cmap="gray")
ejes[0, 0].set_title("1. Imagen Original")
ejes[0, 0].axis("off")

ejes[0, 1].imshow(espectro_x, cmap="gray")
ejes[0, 1].set_title("2. Espectro Sobel X")
ejes[0, 1].axis("off")

ejes[0, 2].imshow(espectro_y, cmap="gray")
ejes[0, 2].set_title("3. Espectro Sobel Y")
ejes[0, 2].axis("off")

# Fila 2: Respuestas espaciales y Magnitud
ejes[1, 0].imshow(img_x_norm, cmap="gray")
ejes[1, 0].set_title("4. Respuesta Sobel X (Verticales)")
ejes[1, 0].axis("off")

ejes[1, 1].imshow(img_y_norm, cmap="gray")
ejes[1, 1].set_title("5. Respuesta Sobel Y (Horizontales)")
ejes[1, 1].axis("off")

ejes[1, 2].imshow(img_mag_norm, cmap="gray")
ejes[1, 2].set_title("6. Magnitud del Gradiente (Todos los bordes)")
ejes[1, 2].axis("off")

plt.tight_layout()
guardar_grafica(figura, "04_comparacion_magnitud_gradiente.png")
plt.show()
```
**Ejecutar:** `python .\codigopy-0777\ejemplo4_magnitud_gradiente_0777.py`  
**Interpretación:** La imagen 6 es la más importante. Combina lo mejor de los filtros X e Y, logrando un mapa de bordes completo y robusto, que es la base para algoritmos avanzados como Canny Edge Detection.

---

## **10. Resultados generados automáticamente**
Al finalizar, verifica que tu carpeta `resultados-img-0777` contenga:
- `01_imagen_y_espectro.png`
- `02_sobel_x.png`
- `03_sobel_y.png`
- `04_comparacion_magnitud_gradiente.png`

---

## **11. Conceptos que el estudiante debe recordar**

| Concepto | Lo que debes comprender |
| :--- | :--- |
| **Dominio Espacial** | Trabajar directamente con los valores de los píxeles. |
| **Dominio de Frecuencia** | Trabajar con las tasas de cambio de intensidad (FFT). |
| **FFT (`np.fft.fft2`)** | La "traducción" matemática de la imagen a frecuencias. |
| **FFT Shift (`np.fft.fftshift`)** | Mueve las frecuencias bajas al centro para que sean fáciles de ver. |
| **Sobel X** | Resalta bordes **verticales** (mide cambios horizontales). |
| **Sobel Y** | Resalta bordes **horizontales** (mide cambios verticales). |
| **Magnitud del Gradiente** | La combinación $\sqrt{G_x^2 + G_y^2}$ que muestra todos los bordes. |

---

## **12. Actividad de reforzamiento**
1. Descarga o toma una foto propia en escala de grises y guárdala en la carpeta del proyecto.
2. Modifica la función `cargar_imagen()` en `funciones_frecuencia_0777.py` para que use `cv2.imread('tu_foto.jpg', cv2.IMREAD_GRAYSCALE)` en lugar de `data.camera()`.
3. Vuelve a ejecutar los 4 ejemplos.
4. **Responde en tu cuaderno:**
   - ¿Qué diferencias notaste en el espectro de tu foto comparado con el del camarógrafo?
   - ¿Por qué es necesario normalizar la imagen (`cv2.normalize`) antes de mostrarla con `plt.imshow`?
   - ¿Qué pasaría si sumáramos $G_x + G_y$ en lugar de usar la fórmula de la magnitud $\sqrt{G_x^2 + G_y^2}$?

---

## **13. Distribución del tiempo (120 min)**

| Etapa | Actividad | Tiempo |
| :--- | :--- | :--- |
| **Apertura** | Explicación teórica: dominio espacial vs. frecuencia y filtros Sobel. | 15 min |
| **Desarrollo 1** | Crear carpeta, entorno virtual, instalar librerías y crear archivos. | 20 min |
| **Desarrollo 2** | Ejemplo 1: Cargar imagen y visualizar espectro base. | 15 min |
| **Desarrollo 3** | Ejemplo 2: Aplicar y analizar Sobel X. | 20 min |
| **Desarrollo 4** | Ejemplo 3: Aplicar y analizar Sobel Y. | 20 min |
| **Desarrollo 5** | Ejemplo 4: Calcular magnitud del gradiente y comparar los 6 paneles. | 20 min |
| **Cierre** | Guardar evidencias, limpiar entorno y responder preguntas de reforzamiento. | 10 min |

---

## **14. Evidencias de aprendizaje y Lista de Cotejo**

Marca con una `X` lo que hayas completado:

- [ ] Creé la carpeta `u3-p7-proce-img-img-0777` y su estructura interna.
- [ ] Creé y activé el entorno virtual `.env-va-0777`.
- [ ] Instalé las librerías y generé el `requirements.txt`.
- [ ] El archivo `funciones_frecuencia_0777.py` no tiene errores de sintaxis.
- [ ] Ejecuté el Ejemplo 1 y se generó `01_imagen_y_espectro.png`.
- [ ] Ejecuté el Ejemplo 2 y se generó `02_sobel_x.png`.
- [ ] Ejecuté el Ejemplo 3 y se generó `03_sobel_y.png`.
- [ ] Ejecuté el Ejemplo 4 y se generó `04_comparacion_magnitud_gradiente.png`.
- [ ] Respondí las preguntas de la actividad de reforzamiento en mi cuaderno.

---

## **15. Conclusión de la práctica**
El procesamiento de imágenes en el dominio de la frecuencia demuestra que una operación compleja como la detección de bordes puede realizarse mediante una simple **multiplicación** de matrices (gracias al Teorema de la Convolución), en lugar de recorrer píxel por píxel. 

Al combinar las respuestas direccionales de Sobel X y Sobel Y mediante la magnitud del gradiente, obtenemos una representación robusta de los contornos, un paso fundamental y obligatorio en cualquier sistema moderno de Visión Artificial (como el reconocimiento facial o los coches autónomos).

**¡Felicidades! Has completado tu primer pipeline de procesamiento de imágenes en el dominio de la frecuencia.** 🚀

---
*Nota técnica para el docente/estudiante avanzado: El uso de `np.pad` con `mode='reflect'` en la función `aplicar_filtro_frecuencia` es una buena práctica para mitigar los artefactos de "wrap-around" (convolución circular) inherentes a la multiplicación directa de FFTs en imágenes finitas.*
