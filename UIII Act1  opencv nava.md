# Práctica demostrativa: Introducción al reconocimiento de imágenes con OpenCV



Duración: 2 horas

Nivel principiante



Asignatura: Soluciona problemas de Visión Artificial\
Semestre: Tercer semestre de preparatoria\
Especialidad: Inteligencia Artificial\
Herramienta de desarrollo: Visual Studio Code\
Lenguaje de programación: Python\
Bibliotecas: OpenCV, NumPy y Matplotlib.

## 1. Propósito de aprendizaje

Que los estudiantes conozcan los fundamentos del reconocimiento de imágenes mediante OpenCV, comprendan las diferencias entre clasificación de imágenes, detección y localización de objetos e identificación de patrones, y desarrollen cuatro ejercicios demostrativos utilizando Python.

Al finalizar, los estudiantes podrán:

1. Reconocer características básicas de una imagen digital.
2. Diferenciar clasificación y detección de objetos.
3. Identificar y localizar objetos dentro de una imagen.
4. Reconocer patrones mediante comparación de imágenes.
5. Utilizar OpenCV para procesar y visualizar imágenes.

## 2. Conceptos fundamentales de Visión Artificial

La Visión Artificial es una disciplina de la inteligencia artificial que permite a las computadoras analizar imágenes y videos para identificar objetos, reconocer características y extraer información visual.

### Diferencias entre las principales tareas

[1. Introduction to Machine Learning with Keras | The Deep Learning with Keras Workshop](https://images.openai.com/static-rsc-4/Iz3HOUUe5DWnmtRn2Cbzd3n9lxBpRRxsi8bWxRrTc9kbduGFd-TtWHTpgtrTr3jkJGTr51U-m-NxrsmFev0U-LAYHWVW7DjYsgjhMnK5a6dot9PwuZ_4IQj6cPaeTJsX7JVpD3DUJ0UbXgc_AxL2Sh5om37Me5GSqwB50vAwdGM?purpose=inline)

1\. Clasificación de imágenes

Consiste en asignar una categoría o etiqueta a una imagen completa.

Ejemplo: determinar si una imagen contiene un gato o un perro.

2\. Detección y localización de objetos

Consiste en identificar los objetos presentes y determinar su ubicación mediante coordenadas y rectángulos delimitadores (bounding boxes).

Ejemplo: localizar automóviles, personas y bicicletas.

[Template Matching Opencv](https://images.openai.com/static-rsc-4/Jtz1EMGk3RTJ5O0TJ2LptRE5qFsVr4eyF4I7OeLsfWD42FxJWCnQTF3U_5MTxILymTHAWaJVfR8InMvdGxWMbVta_SBLMjNhxDTPSn6YArus2TArtdTOp_72hyJLLfiYZ9cEDtt1r-9jkmZuijTwclV2lkCm2t7iIpMgBjZebw0?purpose=inline)

3\. Identificación de patrones

Consiste en encontrar características o estructuras visuales que se repiten o coinciden dentro de una imagen.

Ejemplo: localizar un logotipo o una figura determinada.

## 3. Preparación del entorno de trabajo en Visual Studio Code

Para desarrollar los cuatro ejemplos se utilizará una sola carpeta de proyecto con cuatro programas independientes.

### Paso 1. Crear la carpeta principal

Abrir Visual Studio Code y seleccionar Terminal → Nueva terminal.

Ejecutar:

```
mkdir u1-p1-va-0777
cd u1-p1-va-0777
```

### Paso 2. Crear el entorno virtual

```
python -m venv .venv-va-0777
```

Activar el entorno virtual en Windows:

```
.venv-va-0777\Scripts\activate
```

### Paso 3. Instalar las bibliotecas

Ejecutar:

```
python -m pip install opencv-python numpy matplotlib
```

### Paso 4. Verificar las bibliotecas

```
python -c "import cv2, numpy, matplotlib; print('OpenCV:', cv2.__version__); print('NumPy:', numpy.__version__); print('Matplotlib:', matplotlib.__version__)"
```

### Paso 5. Crear el archivo requirements.txt

```
pip freeze > requirements.txt
```

### 4. Estructura de carpetas y archivos

La siguiente estructura organiza las imágenes originales, los programas Python y los resultados del procesamiento.

```
u1-p1-va-0777/
│
├── .venv-va-0777/
│
├── img-original-0777/
│   ├── colores-0777.jpg
│   ├── rostro-0777.jpg
│   ├── escena-0777.jpg
│   └── patron-0777.jpg
│
├── codigopy-0777/
│   ├── ejemplo1-clasificacion-0777.py
│   ├── ejemplo2-deteccion-0777.py
│   ├── ejemplo3-localizacion-0777.py
│   └── ejemplo4-patrones-0777.py
│
├── resultados-img-0777/
│
└── requirements.txt
```

Importante: Las imágenes originales deben colocarse dentro de `img-original-0777`. Los programas guardarán los resultados en `resultados-img-0777`.

## 5. Ejemplo 1. Clasificación básica de imágenes por color

Clasificación

[Fresh red apple isolated on white. With clipping path](https://images.openai.com/static-rsc-4/2z1nPaBgUrE_3IFf0_vo-_FiQ6AI-slOOF5ac3pi5-IAg1M0Xs4QpWVRfk_L0CBFFWb_KXRH0LYk3bEoYT8PTv427leeGbX9h-FomgiGrctHLJDRCOqttw-EHMqk8MINF_NeqWvQ0LUJv-Akwykc18hrKvSO2NekrbKgewIv4sjbzg3iJwrW5vpZP-YFSiTL?purpose=inline)

[Ripe banana isolated on white background. full depth of field](https://images.openai.com/static-rsc-4/S13-3RKAIyUoWuvfkukCiglLCu_Px9P_5a196yda4LtNXa3ZP9k6BZ-skr2A7BQKnYwvVqo1Qhk219IuZSmC8DXMXIY51R6k7u1bzRmHPjj25mDvATeBXkUroKn5NWkjLgVskgc94YWTraiB7ren_94DNMeTA0ahYBpfBltmZKZiw_Fo7GDqu2HEcdbjQIFy?purpose=inline)

[Green apple isolated on white background with clipping path](https://images.openai.com/static-rsc-4/YhC6Z_LFV01y5IehLZ3MYepKDADdtqSou9kboHPoKIcOy6Qbx8JRxzjyzleZODjg1eVueIybs9yYxX-NdcgsCW4qi-9pu3CqLNmnaiwBQyhi47tW5uupqIzXy9Y_pudoWYe7slkl9u9spabuXzZmxvZ78nkQ6aTCe1YFdX6fZPgdZalA8ewinXv1y-juBKjn?purpose=inline)

Problema: Una computadora necesita analizar una imagen y clasificarla según el color predominante: rojo, verde o azul.

Objetivo: Comprender cómo una computadora puede asignar una categoría a una imagen utilizando sus características de color.

Archivo: `ejemplo1-clasificacion-0777.py`

Código Python:

```
import cv2import numpy as npimport os# Ruta de la imagenruta = "img-original-0777/colores-0777.jpg"# Cargar imagenimg = cv2.imread(ruta)# Verificar que la imagen existaif img is None:    print("Error: No se encontro la imagen")else:    # Calcular promedio de los canales BGR    promedio = np.mean(img, axis=(0, 1))    azul = promedio[0]    verde = promedio[1]    rojo = promedio[2]    print("Promedio de colores:")    print("Azul:", azul)    print("Verde:", verde)    print("Rojo:", rojo)    # Clasificar por color predominante    if rojo > verde and rojo > azul:        categoria = "ROJO"    elif verde > rojo and verde > azul:        categoria = "VERDE"    elif azul > rojo and azul > verde:        categoria = "AZUL"    else:        categoria = "COLOR MIXTO O EMPATE"    print("Clasificacion:", categoria)    # Mostrar resultado    cv2.putText(        img,        categoria,        (20, 40),        cv2.FONT_HERSHEY_SIMPLEX,        1,        (255, 255, 255),        2    )    # Crear carpeta de resultados    os.makedirs("resultados-img-0777", exist_ok=True)    # Guardar imagen    cv2.imwrite(        "resultados-img-0777/clasificacion-0777.jpg",        img
```

Explicación de las instrucciones:

| Instrucción        | Función                                            |
| ------------------ | -------------------------------------------------- |
| `cv2.imread()`     | Carga la imagen.                                   |
| `np.mean()`        | Calcula el promedio de los valores de los píxeles. |
| `axis=(0,1)`       | Calcula el promedio de cada canal de color.        |
| `promedio[0]`      | Obtiene el promedio del canal azul.                |
| `promedio[1]`      | Obtiene el promedio del canal verde.               |
| `promedio[2]`      | Obtiene el promedio del canal rojo.                |
| `if / elif / else` | Determina la categoría.                            |
| `cv2.putText()`    | Escribe la clasificación sobre la imagen.          |
| `cv2.imwrite()`    | Guarda la imagen procesada.                        |

Resultado esperado: El programa muestra en pantalla la categoría del color predominante y guarda una copia con la etiqueta correspondiente.

Aplicación real: clasificación sencilla de productos por color en una banda transportadora.

Nota didáctica: este ejercicio utiliza reglas matemáticas, no un modelo de inteligencia artificial entrenado. Clasifica el color predominante de toda la imagen, no reconoce el objeto por su significado.

## 6. Ejemplo 2. Detección de rostros mediante Haar Cascade

Detección de objetos

[Face detection using Cascade Classifier using OpenCV-Python](https://images.openai.com/static-rsc-4/BweLgL4cvaZllecJO1tsnMKoy5f_5IWpcuFYaAOYrG4qFh25mPtarhSGbNko58NvzlQw4ScqWuYAcBFNZTAS1Jiwc92eR5837-5MJI5LwVib5DROuCp5mzAaggvs3vnU9up6hqP5LMW2ufm5_2voJ4clWhbXxtA9FTc57BqsWkI?purpose=inline)

[linkedin.com](https://www.linkedin.com/pulse/face-detection-using-cascade-classifier-opencv-python-shastrakar-sgpse?utm_source=chatgpt.com)

Problema: Una computadora necesita detectar si existen rostros humanos en una fotografía y marcar su ubicación mediante rectángulos.

Objetivo: Identificar rostros utilizando un clasificador Haar Cascade incluido con OpenCV.

Archivo: `ejemplo2-deteccion-0777.py`

Código Python:

```
import cv2import os# Cargar imagenruta = "img-original-0777/rostro-0777.jpg"img = cv2.imread(ruta)if img is None:    print("Error: No se encontro la imagen")else:    # Convertir imagen a escala de grises    gris = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)    # Cargar clasificador Haar Cascade    rostro = cv2.CascadeClassifier(        cv2.data.haarcascades +        "haarcascade_frontalface_default.xml"    )    # Detectar rostros    detecciones = rostro.detectMultiScale(        gris,        scaleFactor=1.1,        minNeighbors=5,        minSize=(30, 30)    )    print("Rostros encontrados:", len(detecciones))    # Dibujar rectangulos    for (x, y, ancho, alto) in detecciones:        cv2.rectangle(
```

Explicación de las instrucciones:

| Instrucción               | Función                                                                     |
| ------------------------- | --------------------------------------------------------------------------- |
| `cv2.cvtColor()`          | Convierte la imagen a escala de grises.                                     |
| `cv2.CascadeClassifier()` | Carga el clasificador de rostros.                                           |
| `detectMultiScale()`      | Busca rostros en diferentes escalas.                                        |
| `scaleFactor=1.1`         | Reduce progresivamente el tamaño de búsqueda.                               |
| `minNeighbors=5`          | Establece cuántas detecciones vecinas se requieren para aceptar una región. |
| `minSize=(30,30)`         | Establece el tamaño mínimo de detección.                                    |
| `cv2.rectangle()`         | Dibuja un rectángulo alrededor del rostro.                                  |

Resultado esperado:

- Identifica los rostros que el clasificador puede reconocer.
- Dibuja rectángulos verdes alrededor de las detecciones.
- Muestra la cantidad de rostros encontrados.
- Guarda la imagen procesada.

Aplicación real: sistemas de conteo de personas y cámaras inteligentes.

Nota: Haar Cascade es un método clásico de detección; puede producir falsos positivos o no detectar rostros con iluminación, orientación o condiciones desfavorables. No identifica la identidad de las personas.

## 7. Ejemplo 3. Localización de objetos mediante contornos

Localización de objetos

[Shape Detection using OpenCV/C++](https://images.openai.com/static-rsc-4/9ph_wAYR3FNxsAljAXOdzV0xWuFiHGZz9oF0tH8wnI6PVMAYUwHoM5d2q57xPZk2j7uQcX3nyCEmcLw-CtOOVD_ZassT-0UEcqjvhnjr19pzXn1es3znkXyGdn_za-jEPqiROFGG6c4ZIVtY4kdrlW-0S1Sh8rD-4JPjmiw1iZY?purpose=inline)

[embeddedhow.com](https://www.embeddedhow.com/post/shape-detection-using-opencv-c?utm_source=chatgpt.com)

Problema: Una computadora necesita localizar objetos geométricos dentro de una imagen y marcar su posición mediante rectángulos.

Objetivo: Utilizar técnicas de procesamiento de imágenes para encontrar contornos y obtener las coordenadas de los objetos.

Archivo: `ejemplo3-localizacion-0777.py`

Código Python:

```
import cv2import os# Cargar imagenruta = "img-original-0777/escena-0777.jpg"img = cv2.imread(ruta)if img is None:    print("Error: No se encontro la imagen")else:    # Convertir a escala de grises    gris = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)    # Aplicar desenfoque    suavizada = cv2.GaussianBlur(        gris,        (5, 5),        0    )    # Convertir imagen a blanco y negro    _, binaria = cv2.threshold(        suavizada,        100,        255,        cv2.THRESH_BINARY    )    # Buscar contornos externos    contornos, jerarquia = cv2.findContours(        binaria,        cv2.RETR_EXTERNAL,        cv2.CHAIN_APPROX_SIMPLE
```

Explicación de las instrucciones:

| Instrucción               | Función                                                                        |
| ------------------------- | ------------------------------------------------------------------------------ |
| `cv2.GaussianBlur()`      | Reduce el ruido de la imagen.                                                  |
| `cv2.threshold()`         | Convierte la imagen en una imagen binaria.                                     |
| `cv2.findContours()`      | Encuentra los contornos de las regiones.                                       |
| `cv2.RETR_EXTERNAL`       | Recupera solamente los contornos externos.                                     |
| `cv2.CHAIN_APPROX_SIMPLE` | Simplifica los puntos de los contornos.                                        |
| `cv2.boundingRect()`      | Obtiene las coordenadas y dimensiones del rectángulo que contiene un contorno. |
| `cv2.rectangle()`         | Dibuja el rectángulo de localización.                                          |

Resultado esperado:

- Identifica regiones que cumplen las condiciones del procesamiento.
- Obtiene las coordenadas `x`, `y`, ancho y alto.
- Dibuja rectángulos verdes alrededor de las regiones encontradas.

Aplicación real: inspección de productos, conteo de piezas y localización de componentes electrónicos.

Nota didáctica: encontrar contornos no equivale a reconocer semánticamente un objeto. Para obtener buenos resultados se recomienda utilizar imágenes con objetos bien contrastados respecto al fondo.

## 8. Ejemplo 4. Identificación de patrones mediante Template Matching

Identificación de patrones

[Object Detection Lite: Template Matching - Analytics Vidhya](https://images.openai.com/static-rsc-4/2lGHNjmsqU0P1N8SVWWxQtQMzEKFaru9yNZ6dT5f7Z4a7PLXXUCiioyVUdBN4FOo1a4Krq077i3FO1oDtRNhVmD5RU1JzMO2tOh1NGxSn5tVLPPiId-wHIWIXoqu5jZ8aQeM8Wq5YZc1H3eFI1G-g7ffYkuGSMljuw_RRjrHJT8?purpose=inline)

[analyticsvidhya.com](https://www.analyticsvidhya.com/blog/2022/08/object-detection-lite-template-matching/?utm_source=chatgpt.com)

Problema: Una computadora necesita encontrar una figura específica dentro de una imagen más grande, comparando sus características visuales.

Objetivo: Identificar una región que coincida con una imagen de referencia utilizando la técnica Template Matching de OpenCV.

¿Qué se necesita?

- `patron-0777.jpg`: imagen completa donde se buscará el patrón.
- `plantilla-0777.jpg`: imagen pequeña que contiene el patrón que se desea localizar.

Agregar estos dos archivos dentro de `img-original-0777`.

Archivo: `ejemplo4-patrones-0777.py`

Código Python:

```
import cv2import os# Cargar imagen principalimagen = cv2.imread(    "img-original-0777/patron-0777.jpg")# Cargar imagen de referenciaplantilla = cv2.imread(    "img-original-0777/plantilla-0777.jpg")if imagen is None or plantilla is None:    print("Error: No se encontraron las imagenes")else:    # Convertir ambas imagenes a escala de grises    gris = cv2.cvtColor(        imagen,        cv2.COLOR_BGR2GRAY    )    plantilla_gris = cv2.cvtColor(        plantilla,        cv2.COLOR_BGR2GRAY    )    # Obtener dimensiones de la plantilla    alto, ancho = plantilla_gris.shape    # Buscar coincidencias    resultado = cv2.matchTemplate(        gris,        plantilla_gris,        cv2.TM_CCOEFF_NORMED    )    # Obtener la mejor coincidencia    min_val, max_val, min_loc, max_loc = cv2.minMaxLoc(        resultado    )    print("Nivel de coincidencia:", max_val)    # Establecer nivel minimo de coincidencia    if max_val >= 0.80:        # Coordenadas de la coincidencia        x, y = max_loc        # Dibujar rectangulo        cv2.rectangle(            imagen,            (x, y),            (x + ancho, y + alto),            (0, 255, 0),            3        )
```

Explicación de las instrucciones:

| Instrucción            | Función                                                    |
| ---------------------- | ---------------------------------------------------------- |
| `cv2.imread()`         | Carga la imagen principal y la plantilla.                  |
| `cv2.cvtColor()`       | Convierte las imágenes a escala de grises.                 |
| `plantilla_gris.shape` | Obtiene el alto y ancho de la plantilla.                   |
| `cv2.matchTemplate()`  | Compara la plantilla con diferentes regiones de la imagen. |
| `cv2.TM_CCOEFF_NORMED` | Utiliza un método de comparación normalizada.              |
| `cv2.minMaxLoc()`      | Obtiene el valor máximo y su ubicación.                    |
| `max_val`              | Representa el nivel de coincidencia.                       |
| `max_loc`              | Indica las coordenadas de la mejor coincidencia.           |
| `cv2.rectangle()`      | Marca la ubicación del patrón encontrado.                  |

Resultado esperado:

- Compara la imagen principal con la plantilla.
- Obtiene el nivel de coincidencia.
- Localiza la región con mayor similitud.
- Dibuja un rectángulo verde alrededor del patrón.

Aplicación real: identificación de logotipos, revisión de componentes electrónicos y búsqueda de piezas en procesos industriales.

Nota: Template Matching funciona mejor cuando el patrón mantiene dimensiones, orientación e iluminación similares a las de la imagen de referencia. No es un detector robusto ante cambios importantes de escala o rotación.

## 9. Comparación de los cuatro ejemplos

| Ejemplo | Técnica                 | ¿Qué realiza?                                     | Resultado                  |
| ------- | ----------------------- | ------------------------------------------------- | -------------------------- |
| 1       | Clasificación por color | Clasifica una imagen según su color predominante. | Etiqueta de color.         |
| 2       | Haar Cascade            | Detecta rostros humanos.                          | Rectángulos sobre rostros. |
| 3       | Detección de contornos  | Encuentra y localiza regiones de objetos.         | Coordenadas y rectángulos. |
| 4       | Template Matching       | Busca una figura de referencia.                   | Ubicación del patrón.      |

## 10. Ejecución de los programas en Visual Studio Code

Desde la terminal, activar el entorno virtual:

```
.venv-va-0777\Scripts\activate
```

Ejecutar los cuatro ejemplos individualmente:

```
python codigopy-0777/ejemplo1-clasificacion-0777.py
```

```
python codigopy-0777/ejemplo2-deteccion-0777.py
```

```
python codigopy-0777/ejemplo3-localizacion-0777.py
```

```
python codigopy-0777/ejemplo4-patrones-0777.py
```

Importante: Antes de ejecutar los programas, verificar que las imágenes estén guardadas con los nombres exactos indicados en `img-original-0777`. En los ejemplos 2 y 3 se necesita una fotografía apropiada; en el ejemplo 4 se necesitan dos imágenes relacionadas. El clasificador Haar Cascade se incluye con la instalación habitual de OpenCV.

## 11. Organización didáctica de las 2 horas

| Fase       | Actividades de enseñanza-aprendizaje                                                                                                                                                                                                                                                                                                  | Tiempo  |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| Apertura   | 1. El docente explica qué es la Visión Artificial. 2. Presenta las diferencias entre clasificación, detección, localización e identificación de patrones. 3. Muestra ejemplos visuales.                                                                                                                                               | 20 min  |
| Desarrollo | 4. El docente demuestra la creación de carpetas, entorno virtual e instalación de bibliotecas. 5. Explica el ejemplo 1 de clasificación por color. 6. Demuestra la detección de rostros con Haar Cascade. 7. Explica la localización de objetos mediante contornos. 8. Demuestra la identificación de patrones con Template Matching. | 80 min  |
| Cierre     | 9. Los estudiantes comparan los cuatro resultados. 10. Identifican qué técnica utilizarían para resolver diferentes problemas reales.                                                                                                                                                                                                 | 20 min  |
| Total      |                                                                                                                                                                                                                                                                                                                                       | 120 min |

## 12. Actividad de aprendizaje para los estudiantes

Después de observar los cuatro ejemplos, responder las siguientes preguntas:

1. ¿Qué es la Visión Artificial?
2. ¿Qué significa clasificar una imagen?
3. ¿Cuál es la diferencia entre clasificación y detección?
4. ¿Qué función de OpenCV permite cargar una imagen?
5. ¿Qué biblioteca permite trabajar con arreglos numéricos?
6. ¿Para qué sirve Haar Cascade?
7. ¿Qué son los contornos de una imagen?
8. ¿Qué significa localizar un objeto mediante coordenadas?
9. ¿Qué es Template Matching?
10. Menciona dos aplicaciones reales de la Visión Artificial.

## 13. Evidencias de aprendizaje e instrumentos de evaluación

| Evidencias             | Características                                           | Instrumento           |
| ---------------------- | --------------------------------------------------------- | --------------------- |
| E1. Entorno de trabajo | Crea carpetas, entorno virtual e instala las bibliotecas. | Lista de cotejo       |
| E2. Clasificación      | Ejecuta el programa y obtiene una categoría de color.     | Guía de observación   |
| E3. Detección          | Identifica rostros y muestra rectángulos.                 | Práctica demostrativa |
| E4. Localización       | Identifica contornos y coordenadas de objetos.            | Ejercicio práctico    |
| E5. Patrones           | Encuentra coincidencias mediante una plantilla.           | Ejercicio práctico    |
| E6. Cuestionario       | Diferencia las principales tareas de Visión Artificial.   | Cuestionario          |

## 14. Resultado esperado

Aprendizaje esperado

Al finalizar las dos horas, el estudiante será capaz de:

- Explicar los fundamentos del reconocimiento de imágenes.
- Diferenciar clasificación, detección, localización e identificación de patrones.
- Crear un proyecto de Visión Artificial utilizando Python y OpenCV.
- Identificar características visuales mediante procesamiento de imágenes.
- Ejecutar programas que permitan analizar y localizar elementos dentro de una imagen.

## 15. Bibliotecas utilizadas

| Biblioteca | Instalación                 | Función                                       |
| ---------- | --------------------------- | --------------------------------------------- |
| OpenCV     | `pip install opencv-python` | Procesamiento y análisis de imágenes.         |
| NumPy      | `pip install numpy`         | Operaciones matemáticas y arreglos numéricos. |
| Matplotlib | `pip install matplotlib`    | Visualización de imágenes y resultados.       |

Recomendación didáctica: Para estudiantes principiantes, desarrollar los ejemplos en orden. Primero trabajar con colores, después con rostros, continuar con contornos y finalizar con identificación de patrones. De esta manera, comprenderán progresivamente cómo una computadora procesa información visual antes de abordar modelos de aprendizaje profundo como YOLO y redes neuronales convolucionales (CNN).
