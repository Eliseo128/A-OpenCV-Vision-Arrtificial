¡Bienvenido a esta práctica de **Visión Artificial**! Hoy vamos a dar nuestros primeros pasos reales manipulando imágenes como lo hace una Inteligencia Artificial: **viendolas como matrices de números**.

Para que entiendas perfectamente cómo fluye la información de arriba hacia abajo, hemos eliminado las funciones (`def main()` y `def create_sample_image()`) y estructurado todo en un **código lineal secuencial**. Además, en lugar de dibujar una imagen desde cero, descargaremos una imagen real desde internet para analizar sus colores y formas geométricas, tal como muestra este ejemplo de referencia con figuras básicas:

---

## 📁 1. Estructura de Carpeta y Archivos de Trabajo

Antes de escribir código, mantengamos el orden profesional. Tu proyecto en Visual Studio Code debe verse exactamente así:

```text
u3-act4-0777/                  <-- Carpeta principal de trabajo
├── .venv-0777/                <-- Entorno virtual aislado (se crea en el paso 2)
├── act4-basico-opencv-0777.py <-- Tu archivo de código Python
├── sample_image.jpg           <-- Imagen descargada de la red (entrada)
└── rotated_image.jpg          <-- Imagen rotada (se generará sola al ejecutar)

```

---

## ⚙️ 2. Configuración del Entorno Paso a Paso en VS Code

Sigue esta secuencia exacta en tu computadora:

1. **Crear la carpeta de trabajo:** Crea una carpeta en tu escritorio o documentos llamada `u3-act4-0777`.
2. **Abrir en VS Code:** Abre Visual Studio Code, ve a *Archivo > Abrir carpeta* (`File > Open Folder`) y selecciona `u3-act4-0777`.
3. **Abrir la terminal integrada:** Presiona `Ctrl + Ñ` (o en el menú superior: *Terminal > Nueva terminal*).
4. **Crear el entorno virtual:** Escribe el siguiente comando en la terminal para aislar nuestras librerías y presiona `Enter`:
```bash
python -m venv .venv-0777

```


5. **Activar el entorno virtual:**
* **En Windows (PowerShell/CMD):**
```bash
.venv-0777\Scripts\activate

```


* **En Mac / Linux:**
```bash
source .venv-0777/bin/activate

```




*(Sabrás que funcionó porque aparecerá `(.venv-0777)` en color verde o blanco al inicio de la línea de tu terminal).*
6. **Instalar OpenCV:** Con el entorno activado, instala la librería `opencv-python` (esta instala automáticamente `numpy`, que es indispensable para manejar matrices):
```bash
pip install opencv-python

```


7. **Obtener la imagen de prueba:** Descarga una imagen de figuras geométricas de colores desde internet (por ejemplo, buscando *"figuras geometricas colores rojo verde azul"* o guardando una imagen de prueba), colócala dentro de la carpeta `u3-act4-0777` y cámbiale el nombre exactamente a **`sample_image.jpg`**.
8. **Crear el script de Python:** En el explorador izquierdo de VS Code, haz clic en el ícono de *Nuevo Archivo* y nómbralo **`act4-basico-opencv-0777.py`**.

---

## 💻 3. Código Secuencial Explicado Línea por Línea

Copia y pega el siguiente código dentro de tu archivo `act4-basico-opencv-0777.py`. **Nota importante para el alumno:** Cada vez que aparezca una ventana con una imagen, **presiona cualquier tecla** en tu teclado (por ejemplo, la barra espaciadora) para avanzar al siguiente paso del programa.

```python
# ==============================================================================
# 0. IMPORTACIÓN DE LIBRERÍAS
# ==============================================================================
import cv2  # Importa la librería OpenCV para procesamiento de imágenes y visión artificial.
import numpy as np  # Importa NumPy para manejar las imágenes como arreglos/matrices matemáticas.
import sys  # Importa Sys para poder detener el programa de forma segura si ocurre un error.

# ==============================================================================
# 1. LECTURA DE LA IMAGEN DESDE LA CARPETA
# ==============================================================================
print("\n1. LECTURA DE IMÁGENES")  # Imprime el título de la sección en la consola.
img = cv2.imread('sample_image.jpg')  # Lee la imagen 'sample_image.jpg' y la guarda como matriz en 'img'.

if img is None:  # Verifica si la variable 'img' está vacía (es decir, si no encontró el archivo).
    print("Error: No se pudo leer 'sample_image.jpg'. Revisa el nombre y ubicación.")  # Muestra mensaje de error.
    sys.exit()  # Detiene inmediatamente la ejecución del programa para evitar fallos posteriores.
else:  # Si la imagen sí se cargó correctamente...
    print("Imagen cargada exitosamente.")  # Confirma en consola que la imagen está lista.

# ==============================================================================
# 2. PROPIEDADES DE LA IMAGEN
# ==============================================================================
print("\n2. PROPIEDADES DE LA IMAGEN")  # Imprime el título de la segunda sección.
height, width, channels = img.shape  # Extrae el alto (filas), ancho (columnas) y canales de color de la matriz.
print(f"Dimensiones de la imagen: {width}x{height} píxeles")  # Muestra el ancho por el alto en consola.
print(f"Número de canales de color: {channels}")  # Muestra cuántos canales tiene (3 para BGR: Azul, Verde, Rojo).
print(f"Tipo de dato de la imagen: {img.dtype}")  # Muestra el tipo de dato (uint8 = enteros de 0 a 255).
print(f"Total de datos/píxeles: {img.size}")  # Muestra la cantidad total de valores numéricos en la matriz.

# ==============================================================================
# 3. VISUALIZACIÓN DE LA IMAGEN ORIGINAL
# ==============================================================================
print("\n3. MOSTRANDO IMAGEN ORIGINAL")  # Imprime el título de la tercera sección.
print("Presiona cualquier tecla sobre la ventana de la imagen para continuar...")  # Instrucción para el usuario.
cv2.imshow('Imagen Original', img)  # Abre una ventana llamada 'Imagen Original' y muestra la imagen cargada.
cv2.waitKey(0)  # Pausa el programa infinitamente hasta que el usuario presione una tecla.

# ==============================================================================
# 4. ACCESO Y MODIFICACIÓN DE PÍXELES INDIVIDUALES
# ==============================================================================
print("\n4. ACCEDIENDO Y MODIFICANDO PÍXELES")  # Imprime el título de la cuarta sección.
pixel_img = img.copy()  # Crea una copia exacta de la imagen original para no dañar la original.

y, x = 100, 150  # Define las coordenadas a analizar: fila (Y) = 100, columna (X) = 150.
pixel = pixel_img[y, x]  # Obtiene los 3 valores de color [Azul, Verde, Rojo] del píxel en esa posición.
print(f"Valor del píxel en ({x}, {y}): {pixel} (Formato BGR)")  # Imprime los valores BGR del píxel en consola.

pixel_img[y, x] = [0, 0, 255]  # Cambia el color de ese único píxel a Rojo puro (0 Azul, 0 Verde, 255 Rojo).
cv2.circle(pixel_img, (x, y), 15, (0, 255, 255), 2)  # Dibuja un círculo amarillo alrededor para poder verlo a simple vista.

cv2.imshow('Pixel Modificado', pixel_img)  # Muestra la imagen con el píxel alterado y señalado.
cv2.waitKey(0)  # Espera a que se presione una tecla para continuar.

# ==============================================================================
# 5. REGIÓN DE INTERÉS (ROI - REGION OF INTEREST)
# ==============================================================================
print("\n5. REGIÓN DE INTERÉS (ROI)")  # Imprime el título de la quinta sección.
roi_img = img.copy()  # Crea una nueva copia limpia de la imagen original.

roi = roi_img[50:200, 100:300]  # Recorta una sub-matriz desde la fila 50 a 200 y columna 100 a 300.
cv2.rectangle(roi_img, (100, 50), (300, 200), (0, 255, 0), 2)  # Dibuja un rectángulo verde marcando la zona recortada.

cv2.imshow('Imagen con ROI marcada', roi_img)  # Muestra la imagen completa con el recuadro verde.
cv2.waitKey(0)  # Espera a que se presione una tecla.

cv2.imshow('ROI Extraida (Recorte)', roi)  # Muestra únicamente el pedazo recortado en una ventana aparte.
cv2.waitKey(0)  # Espera a que se presione una tecla.

# ==============================================================================
# 6. SEPARACIÓN Y FUSIÓN DE CANALES DE COLOR (BGR)
# ==============================================================================
print("\n6. SEPARANDO Y FUSIONANDO CANALES")  # Imprime el título de la sexta sección.
b, g, r = cv2.split(img)  # Divide la imagen a color en 3 matrices independientes: Azul (b), Verde (g) y Rojo (r).

cv2.imshow('Canal Azul (Escala de grises)', b)  # Muestra la intensidad del canal azul en tonos de gris.
cv2.imshow('Canal Verde (Escala de grises)', g)  # Muestra la intensidad del canal verde en tonos de gris.
cv2.imshow('Canal Rojo (Escala de grises)', r)  # Muestra la intensidad del canal rojo en tonos de gris.
cv2.waitKey(0)  # Pausa el programa mientras observas las 3 ventanas en blanco y negro.

zeros = np.zeros_like(b)  # Crea una matriz llena de ceros (negro) del mismo tamaño que un canal.
blue_img = cv2.merge([b, zeros, zeros])  # Une el canal azul real con verde y rojo en cero (solo se ve azul).
green_img = cv2.merge([zeros, g, zeros])  # Une el canal verde real con azul y rojo en cero (solo se ve verde).
red_img = cv2.merge([zeros, zeros, r])  # Une el canal rojo real con azul y verde en cero (solo se ve rojo).

cv2.imshow('Canal Azul (Coloreado)', blue_img)  # Muestra la imagen filtrada únicamente en color azul.
cv2.imshow('Canal Verde (Coloreado)', green_img)  # Muestra la imagen filtrada únicamente en color verde.
cv2.imshow('Canal Rojo (Coloreado)', red_img)  # Muestra la imagen filtrada únicamente en color rojo.
cv2.waitKey(0)  # Espera a que se presione una tecla para avanzar.

# ==============================================================================
# 7. REDIMENSIONAMIENTO DE IMÁGENES (RESIZING)
# ==============================================================================
print("\n7. REDIMENSIONANDO IMÁGENES")  # Imprime el título de la séptima sección.
resized_img = cv2.resize(img, (400, 300))  # Cambia el tamaño exacto de la imagen a 400px de ancho por 300px de alto.
cv2.imshow('Redimensionada a 400x300', resized_img)  # Muestra la imagen con sus nuevas dimensiones fijas.
cv2.waitKey(0)  # Espera a que se presione una tecla.

half_size = cv2.resize(img, None, fx=0.5, fy=0.5)  # Reduce la imagen a la mitad (50% en ancho y 50% en alto).
double_size = cv2.resize(img, None, fx=1.5, fy=1.5)  # Amplía la imagen un 50% extra (escala 1.5x).

cv2.imshow('Mitad de tamano (0.5x)', half_size)  # Muestra la versión reducida.
cv2.waitKey(0)  # Espera a que se presione una tecla.
cv2.imshow('Ampliada (1.5x)', double_size)  # Muestra la versión ampliada.
cv2.waitKey(0)  # Espera a que se presione una tecla.

# ==============================================================================
# 8. ROTACIÓN DE IMÁGENES
# ==============================================================================
print("\n8. ROTANDO IMÁGENES")  # Imprime el título de la octava sección.
height, width = img.shape[:2]  # Obtiene nuevamente el alto y ancho actual de la imagen original.
rotation_matrix = cv2.getRotationMatrix2D((width / 2, height / 2), 45, 1)  # Calcula la matriz para girar 45° desde el centro.
rotated_img = cv2.warpAffine(img, rotation_matrix, (width, height))  # Aplica la rotación matemática sobre la imagen.

cv2.imshow('Imagen Rotada (45 grados)', rotated_img)  # Muestra la imagen inclinada 45 grados.
cv2.waitKey(0)  # Espera a que se presione una tecla.

# ==============================================================================
# 9. VOLTEO / ESPEJO DE IMÁGENES (FLIPPING)
# ==============================================================================
print("\n9. VOLTEANDO IMÁGENES")  # Imprime el título de la novena sección.
horizontal_flip = cv2.flip(img, 1)  # Voltea la imagen horizontalmente (código 1 = efecto espejo).
cv2.imshow('Volteo Horizontal (Espejo)', horizontal_flip)  # Muestra el volteo horizontal.
cv2.waitKey(0)  # Espera a que se presione una tecla.

vertical_flip = cv2.flip(img, 0)  # Voltea la imagen verticalmente (código 0 = de cabeza).
cv2.imshow('Volteo Vertical (De cabeza)', vertical_flip)  # Muestra el volteo vertical.
cv2.waitKey(0)  # Espera a que se presione una tecla.

both_flip = cv2.flip(img, -1)  # Voltea en ambos ejes al mismo tiempo (código -1 = horizontal + vertical).
cv2.imshow('Volteo en Ambos Ejes', both_flip)  # Muestra el volteo combinado.
cv2.waitKey(0)  # Espera a que se presione una tecla.

# ==============================================================================
# 10. GUARDADO DE RESULTADOS Y LIMPIEZA
# ==============================================================================
print("\n10. GUARDANDO IMAGEN RESULTANTE")  # Imprime el título de la décima sección.
result = cv2.imwrite('rotated_image.jpg', rotated_img)  # Guarda la imagen rotada en el disco duro como 'rotated_image.jpg'.

if result:  # Comprueba si el guardado devolvió True (verdadero).
    print("Imagen rotada guardada exitosamente como 'rotated_image.jpg'")  # Confirma que el archivo se creó.
else:  # Si ocurrió algún problema de permisos o ruta...
    print("Error: No se pudo guardar la imagen rotada.")  # Notifica el fallo en consola.

cv2.destroyAllWindows()  # Cierra todas las ventanas gráficas abiertas por OpenCV para liberar memoria RAM.
print("\n¡Todas las operaciones se completaron con éxito!")  # Mensaje final de cierre en la terminal.

```

---

## ▶️ 4. Ejecución y Verificación

1. Asegúrate de guardar tu archivo presionando `Ctrl + S`.
2. En la terminal de VS Code (verificando que siga activo `(.venv-0777)`), ejecuta:
```bash
python act4-basico-opencv-0777.py

```


3. **Observa el resultado:** Al terminar de recorrer todas las ventanas presionando una tecla en cada una, revisa tu explorador de archivos en VS Code; verás que apareció automáticamente el archivo **`rotated_image.jpg`**.

> 💡 **Dato clave de IA:** Habrás notado que OpenCV no usa el formato tradicional **RGB** (Rojo-Verde-Azul), sino **BGR** (Azul-Verde-Rojo). ¡Recordar este orden invertido te salvará de muchos dolores de cabeza cuando entrenes redes neuronales convolucionales más adelante!
