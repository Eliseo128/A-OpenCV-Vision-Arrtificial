¡Hola de nuevo! 👁️🤖 ¡Bienvenidos a la sesión de **Visión Artificial con OpenCV**!

Hoy analizaremos las **4 tareas fundamentales** del procesamiento de imágenes para entender cómo las computadoras "ven" y comprenden el mundo visual.

---

### 💡 Las 4 Tareas Fundamentales en Visión Artificial

| Tarea | ¿Qué responde el modelo? | ¿En qué consiste? | Ejemplo práctico |
| --- | --- | --- | --- |
| **1. Clasificación de imágenes** 🖼️ | *¿Qué hay en la imagen?* | Asigna una etiqueta general a toda la imagen. | Identificar si una foto es un **perro** o un **gato**. |
| **2. Detección de objetos** 📦 | *¿Qué hay y dónde está?* | Identifica objetos y dibuja un cuadro delimitador (*bounding box*) sobre cada uno. | Localizar **peatones y autos** en una calle. |
| **3. Localización de objetos** 🎯 | *¿Dónde está el objeto principal?* | Ubica las coordenadas específicas del objeto de interés principal. | Ubicar el **rostro** de una persona para hacer enfoque automático. |
| **4. Identificación de patrones** 📐 | *¿Qué estructura o forma se repite?* | Detecta bordes, textura, esquinas, líneas o características geométricas. | Detectar **líneas de carril** en carretera o bordes de figuras. |

---

### 📁 Estructura de Carpetas y Archivos

Para organizar este proyecto práctico con OpenCV, utilizaremos la siguiente estructura:

```text
vision_artificial/
│
├── imagenes/                   📁 Carpeta con las imágenes de prueba
│   ├── perro.jpg
│   ├── calle.jpg
│   ├── rostro.jpg
│   └── geometrias.jpg
│
├── requisitos.txt              📄 Librerías necesarias
└── introduccion_vision.py      📄 Script principal de Python

```

---

### 📚 Librerías Necesarias (`requisitos.txt`)

Para ejecutar los ejemplos utilizaremos **OpenCV** (la librería principal de visión por computadora) y **NumPy** (para manejo de matrices de píxeles):

```text
opencv-python
numpy

```

---

### 💻 Código Demostrativo en Python (`introduccion_vision.py`)

Copia este código para realizar la demostración guiada con tus alumnos:

```python
import cv2
import numpy as np
import os

# 1. Aseguramos que exista la carpeta de imágenes
os.makedirs("imagenes", exist_ok=True)

# =========================================================
# EJEMPLO 1: Clasificación de Imágenes (Etiqueta Global) 🖼️
# =========================================================
# En visión clásica, la clasificación analiza promedios de color o características simples
img_perro = cv2.imread("imagenes/perro.jpg")
if img_perro is not None:
    # Mostramos dimensiones (Alto, Ancho, Canales)
    alto, ancho, canales = img_perro.shape
    print(f"=== 1. CLASIFICACIÓN ===")
    print(f"Imagen cargada. Resolución: {ancho}x{alto} píxeles.")
    # Clasificación simulada basada en carga de imagen
    cv2.putText(img_perro, "Clase: Perro (0.95)", (20, 40), 
                cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
    cv2.imshow("1. Clasificacion de Imagenes", img_perro)

# =========================================================
# EJEMPLO 2: Detección de Objetos (Bounding Boxes) 📦
# =========================================================
img_calle = cv2.imread("imagenes/calle.jpg")
if img_calle is not None:
    print(f"=== 2. DETECCIÓN DE OBJETOS ===")
    # Simulación de detección dibujando Bounding Boxes (x, y, ancho, alto)
    # Objeto 1: Auto (Color Azul en BGR)
    cv2.rectangle(img_calle, (50, 100), (200, 250), (255, 0, 0), 2)
    cv2.putText(img_calle, "Auto", (50, 90), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 0, 0), 2)
    
    # Objeto 2: Peatón (Color Verde en BGR)
    cv2.rectangle(img_calle, (230, 80), (300, 260), (0, 255, 0), 2)
    cv2.putText(img_calle, "Peaton", (230, 70), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
    
    cv2.imshow("2. Deteccion de Objetos", img_calle)

# =========================================================
# EJEMPLO 3: Localización de Objetos (Coordenadas) 🎯
# =========================================================
# Usamos el clasificador de rostros preentrenado de Haar Cascade incluido en OpenCV
img_rostro = cv2.imread("imagenes/rostro.jpg")
if img_rostro is not None:
    print(f"=== 3. LOCALIZACIÓN DE ROSTROS ===")
    gris = cv2.cvtColor(img_rostro, cv2.COLOR_BGR2GRAY)
    
    # Cargar detector de rostros de OpenCV
    cascade_path = cv2.data.haarcascades + 'haarcascade_frontalface_default.xml'
    face_cascade = cv2.CascadeClassifier(cascade_path)
    
    # Localizar coordenadas (x, y, w, h)
    rostros = face_cascade.detectMultiScale(gris, scaleFactor=1.1, minNeighbors=5)
    
    for (x, y, w, h) in rostros:
        # Dibujar localización exacta del rostro
        cv2.rectangle(img_rostro, (x, y), (x+w, y+h), (0, 255, 255), 2)
        print(f"Rostro localizado en Coordenadas X:{x}, Y:{y} | Ancho:{w}, Alto:{h}")
        
    cv2.imshow("3. Localizacion de Rostros", img_rostro)

# =========================================================
# EJEMPLO 4: Identificación de Patrones (Bordes de Canny) 📐
# =========================================================
img_geo = cv2.imread("imagenes/geometrias.jpg")
if img_geo is not None:
    print(f"=== 4. IDENTIFICACIÓN DE PATRONES ===")
    # Convertir a escala de grises y detectar bordes (patrones geométricos)
    gris_geo = cv2.cvtColor(img_geo, cv2.COLOR_BGR2GRAY)
    bordes = cv2.Canny(gris_geo, threshold1=100, threshold2=200)
    
    cv2.imshow("4. Patrones - Deteccion de Bordes (Canny)", bordes)

# Esperar tecla para cerrar las ventanas activas
cv2.waitKey(0)
cv2.destroyAllWindows()

```

---

### 📝 Conceptos Básicos para los Alumnos

1. **`cv2.imread()` 🖼️:** Lee una imagen y la convierte en una matriz numéricas de píxeles en formato **BGR** (Azul, Verde, Rojo).
2. **`cv2.rectangle()` 🟩:** Dibuja un rectángulo especificando las coordenadas del punto inicial `(x1, y1)` y final `(x2, y2)`.
3. **`cv2.Canny()` ⚡:** Algoritmo que detecta cambios drásticos de brillo entre píxeles adyacentes para encontrar bordes y líneas.

---

### ❓ Pregunta para comprobar el aprendizaje

Si un sistema de cámaras de seguridad escolar detecta la presencia de una persona en la entrada y **dibuja un rectángulo amarillo rodeando solo a esa persona**:

**¿Qué tarea de visión artificial está realizando el sistema: Clasificación de imágenes 🖼️ o Detección/Localización de objetos 📦?**
