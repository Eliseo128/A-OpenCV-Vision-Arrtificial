# Práctica demostrativa: Introducción al reconocimiento de imágenes



Nivel: cero a principiante

Duración: 2 horas



Asignatura: Soluciona problemas de Visión Artificial\
Semestre: Tercer semestre de preparatoria\
Especialidad: Inteligencia Artificial\
Herramientas: Python, Visual Studio Code, OpenCV y NumPy.

## 1. Propósito de la práctica

Que los estudiantes comprendan cuatro tareas fundamentales de la Visión Artificial mediante ejemplos prácticos en Python:

1. Clasificación de imágenes: asignar una categoría a una imagen.
2. Detección y localización de objetos: identificar regiones que contienen objetos y señalar su posición mediante rectángulos.
3. Reconocimiento de patrones: localizar una figura o región de referencia dentro de otra imagen.
4. Identificación de características y similitudes: comparar dos imágenes mediante puntos clave y descriptores visuales.

Al finalizar, los estudiantes tendrán un proyecto funcional que procesa dos imágenes y genera automáticamente resultados en una carpeta.

## 2. Diferencias entre las cuatro tareas

[Fructose & Ernährung » Wie sie auf den Stoffwechsel wirkt | MeinMed.at](https://images.openai.com/static-rsc-4/tK4iAdy_ZF5Pg7sdVX2CkyixMwz7oqI9v31wBuaAFIn5_rJF1yzM5QrJOsjmkA97LCUgYglrpPqlvsfL4kk2mWm23u4WjBrNoab-YwMrAr2B0PcH7FqmWdk2Bp5ZvV5XbDl0RIYsZaDeRLyDKKQBipaUOLMDPbTUymXr3DulHV0?purpose=inline)

Ejemplo 1. Clasificación

Determina a qué categoría pertenece una imagen. Por ejemplo, clasificar una fotografía según su color predominante.

Ejemplo 2. Detección y localización

Busca regiones que podrían contener objetos y dibuja rectángulos para indicar dónde se encuentran.

[OpenCV: Template Matching](https://images.openai.com/static-rsc-4/l5vPJIn8TDab7agDjoiViM2YIHiCh0peMhM2Z0EuMjtd34DQUApM5hMqenXjQEL3jKHGg0XeazgNMHTCVeFI4D9ajJiNasoOOcbDha3k5DHvvVaFgSWe8teJHdrWPUHWLWcZZUCmSm4s4QPtwUkX5pYjh5m_yYxU_SjI4wyhp1c?purpose=inline)

Ejemplo 3. Reconocimiento de patrones

Busca una imagen o patrón de referencia dentro de otra fotografía.

[Object-Detection | Object Detection Based on Feature Detector and Descriptors by Comparing 2 Pictures](https://images.openai.com/static-rsc-4/radb7vFcRGG7n0Nv3--cNXf2lZB5s-yjmYf5mmfqkTeYPvVFWnZ0aEXV0UtXIdyW8HiVVB8MKfZFzxYqPoNE5jMvi7sEhXrMBIpdpjubPAWXNfecWOXcA5GwN0_sDv-NdaWwpWUBgZFvXEnR3oQIp52k8S8uFrpYNnT71c9G8zs?purpose=inline)

Ejemplo 4. Identificación de características

Compara puntos clave, texturas y características visuales para determinar si dos imágenes tienen similitudes.

Nota didáctica: para que los estudiantes comprendan los fundamentos, se utilizarán métodos clásicos de OpenCV. La clasificación por color del ejemplo 1 es una clasificación sencilla basada en reglas, no un modelo de inteligencia artificial entrenado para reconocer categorías semánticas como perros, gatos o automóviles.

## 3. Preparación de las imágenes

Antes de comenzar, prepara dos fotografías:

- `img_1.jpg`: fotografía de referencia. Por ejemplo, una mochila, una botella, una fruta o un juguete.
- `img_2.jpg`: fotografía diferente donde aparezca el mismo objeto, preferentemente en otra posición o con un fondo distinto.

[Red backpack isolated over a white background. Copy space. Concept of Back to School](https://images.openai.com/static-rsc-4/t5_CKsy4MnK1yhNRq2tebfZgraK_x15kUtAqizsmiGbF2v9FRvF7FU8BgWEqXGUU7F3aE2k2U_8XQPTATlZDKcXJNLTXH685as8gAlKZyS_C2WQQixpmmGBo9vcGrrHs5lY_aSS1apmJSigqF5u7m5L06JM8R2lJKXVATzwQhV0PcpkSs5gZa7zFdsBUvaES?purpose=inline)

Imagen 1: objeto de referencia.

[Скачать картинки Пустой класс, стоковые фото Пустой класс в хорошем качестве | DepositPhotos](https://images.openai.com/static-rsc-4/S9D2l1MKzgKH6CsNYUsduE0ZA7QYJh-04-t6Ywr_9zyuKdplhpB4sKI6nXkHkCF2pwJ7rkO5d12dHjJzSUspWNXRCQvod0iTGFFGeg-pFESHLOTMjce3hSKmuuEIG4rNOocKt8cM--Cax3pDPyaFDCSzeMUX-2au0pP9-qER6Y4?purpose=inline)

Imagen 2: mismo objeto en otra escena.

Recomendaciones:

- Utiliza imágenes JPG o JPEG.
- Preferentemente, usa fotografías de al menos 400 × 400 píxeles.
- Evita fotografías completamente oscuras o desenfocadas.
- Para los ejemplos 3 y 4, procura que el mismo objeto aparezca en ambas fotografías.

## 4. Crear el proyecto desde la terminal de VS Code

### Paso 1. Crear la carpeta de trabajo

1. Abre Visual Studio Code.
2. Selecciona Terminal → New Terminal.
3. Comprueba que la terminal esté utilizando PowerShell.
4. Ejecuta los siguientes comandos uno por uno:

```
mkdir u3-p3-rec-img-0777
cd u3-p3-rec-img-0777
```

Explicación:

- `mkdir`: crea una carpeta.
- `cd`: ingresa a la carpeta creada.

### Paso 2. Crear el entorno virtual

Ejecuta:

```
python -m venv .env-va-0777
```

Explicación:

- `python`: ejecuta Python.
- `-m venv`: solicita crear un entorno virtual.
- `.env-va-0777`: nombre del entorno virtual.

El entorno virtual permite instalar las librerías necesarias sin afectar otras instalaciones de Python.

### Paso 3. Activar el entorno virtual

En PowerShell:

```
.\.env-va-0777\Scripts\Activate.ps1
```

Si PowerShell bloquea la activación por la política de ejecución, ejecuta:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Después vuelve a ejecutar:

```
.\.env-va-0777\Scripts\Activate.ps1
```

La terminal deberá mostrar un prefijo parecido a:

```
(.env-va-0777) PS C:\...\u3-p3-rec-img-0777>
```

### Paso 4. Instalar las librerías

Primero actualiza pip:

```
python -m pip install --upgrade pip
```

Instala OpenCV y NumPy:

```
pip install opencv-python numpy
```

¿Para qué sirve cada librería?

| Librería        | Función                                                 |
| --------------- | ------------------------------------------------------- |
| OpenCV (`cv2`)  | Leer, procesar, analizar y guardar imágenes.            |
| NumPy (`numpy`) | Trabajar con matrices y arreglos numéricos de imágenes. |

### Paso 5. Crear el archivo de requerimientos

Ejecuta:

```
pip freeze > requirements.txt
```

Este comando guarda las librerías y versiones instaladas para poder reproducir el entorno del proyecto.

Para consultar su contenido:

```
Get-Content requirements.txt
```

### Paso 6. Seleccionar el intérprete de Python

1. Presiona `Ctrl + Shift + P`.
2. Escribe `Python: Select Interpreter`.
3. Selecciona el intérprete del entorno `.env-va-0777`.

## 5. Crear la estructura de carpetas y archivos

En la terminal de VS Code ejecuta:

```
mkdir img-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
```

La estructura del proyecto será la siguiente:

u3-p3-rec-img-0777/

.env-va-0777/

Entorno virtual

img-original-0777/

img_1.jpg

img_2.jpg

codigopy-0777/

p3-rec-img-0777.py

resultados-img-0777/

Generación automática

Aquí se guardarán las imágenes procesadas, reportes y resultados de los cuatro ejemplos.

requirements.txt

### Paso 7. Agregar las imágenes originales

Copia tus dos fotografías dentro de:

```
img-original-0777/
```

Los nombres deben ser exactamente:

```
img_1.jpg
img_2.jpg
```

Importante: el segundo nombre debe llevar la extensión `.jpg`; no debe escribirse `img_2jpg`.

### Paso 8. Crear el archivo Python

Dentro de `codigopy-0777`, crea el archivo:

```
p3-rec-img-0777.py
```

En este archivo se programarán los cuatro ejemplos.

## 6. Programación de los cuatro ejemplos guiados

Abre el archivo `p3-rec-img-0777.py` y copia el siguiente código completo.

El programa realizará automáticamente los cuatro ejemplos, guardará las imágenes procesadas y generará un reporte de resultados.

```
        cv2.FONT_HERSHEY_SIMPLEX,        0.6,        (255, 255, 255),        2    )    cantidad_buenas = 0cv2.imwrite(    os.path.join(        CARPETA_RESULTADOS,        "ejemplo4_caracteristicas_ORB.jpg"    ),    resultado_orb)print("Puntos clave imagen 1:", len(puntos1))print("Puntos clave imagen 2:", len(puntos2))print("Coincidencias filtradas:", cantidad_buenas)reporte.append("\nEJEMPLO 4: IDENTIFICACION DE CARACTERISTICAS")reporte.append("Puntos clave imagen 1: " + str(len(puntos1)))reporte.append("Puntos clave imagen 2: " + str(len(puntos2)))reporte.append("Coincidencias filtradas: " + str(cantidad_buenas))# ------------------------------------------------------------# 7. GUARDAR REPORTE GENERAL# ------------------------------------------------------------ruta_reporte = os.path.join(    CARPETA_RESULTADOS,    "reporte_reconocimiento.txt")with open(ruta_reporte, "w", encoding="utf-8") as archivo:    archivo.write("PRACTICA 3: RECONOCIMIENTO DE IMAGENES\n")    archivo.write("=" * 50 + "\n\n")    archivo.write("Resultados de los cuatro ejemplos:\n\n")    for linea in reporte:        archivo.write(linea + "\n")print("\n" + "=" * 55)print("PROCESAMIENTO TERMINADO CORRECTAMENTE")print("Revisa la carpeta resultados-img-0777")print("=" * 55)
```

## 7. Explicación paso a paso de cada ejemplo

### Ejemplo 1. Clasificación de imágenes por color

Objetivo: analizar una fotografía y asignarle una categoría de acuerdo con su color predominante.

Procedimiento:

1. Leer la imagen utilizando `cv2.imread()`.
2. Convertir la imagen del formato BGR a HSV.
3. Obtener el promedio del tono y la saturación.
4. Comparar los valores mediante condiciones `if`, `elif` y `else`.
5. Asignar una categoría de color.
6. Escribir la categoría sobre la fotografía.
7. Guardar el resultado en la carpeta de salida.

Comandos principales:

| Comando             | Función                        |
| ------------------- | ------------------------------ |
| `cv2.cvtColor()`    | Cambia el espacio de color.    |
| `cv2.COLOR_BGR2HSV` | Convierte BGR a HSV.           |
| `np.mean()`         | Calcula el promedio.           |
| `cv2.putText()`     | Escribe texto sobre la imagen. |
| `cv2.imwrite()`     | Guarda una imagen.             |

[Scikit Image - Conversion Between RGB & HSV](https://images.openai.com/static-rsc-4/vRBk8kTaEEmb8_TlkaiAurFz3ZT0GwjCotYjBMgKcTIa0YH6zARFlJNvDwajRDKziMl4L1eW1Xp7A1R8tenxliWxAVpY3hD8l05hDe5E6aUnypXtDsyvTzgL-XvH9dwtEjunZweeDfExVpB7F6RMn5xAi2d_BeMyD1FdlmAMyLU?purpose=inline)

[tutorialspoint.com](https://www.tutorialspoint.com/scikit-image/scikit-image-conversion-between-rgb-hsv.htm?utm_source=chatgpt.com)

Resultado esperado:

Se generan dos fotografías con una etiqueta que indica su categoría de color predominante.

Nota: el cálculo utiliza promedios globales de HSV. No determina qué objeto aparece en la fotografía ni identifica su categoría semántica.

### Ejemplo 2. Detección y localización de objetos

Objetivo: encontrar regiones de una imagen que tengan contornos y dibujar rectángulos alrededor de ellas.

Procedimiento:

1. Leer la fotografía.
2. Convertirla a escala de grises.
3. Aplicar un filtro Gaussiano para reducir el ruido.
4. Detectar bordes mediante Canny.
5. Encontrar los contornos externos.
6. Calcular el área de cada contorno.
7. Ignorar las regiones menores de 500 píxeles cuadrados.
8. Dibujar rectángulos alrededor de las regiones restantes.
9. Guardar la imagen procesada.

Comandos principales:

| Comando              | Función                                         |
| -------------------- | ----------------------------------------------- |
| `cv2.cvtColor()`     | Convierte la imagen a escala de grises.         |
| `cv2.GaussianBlur()` | Reduce el ruido.                                |
| `cv2.Canny()`        | Detecta bordes.                                 |
| `cv2.findContours()` | Encuentra contornos.                            |
| `cv2.contourArea()`  | Calcula el área del contorno.                   |
| `cv2.boundingRect()` | Calcula el rectángulo que contiene un contorno. |
| `cv2.rectangle()`    | Dibuja un rectángulo.                           |

[findcontours OpenCV Python | Real Time Contours Detection](https://images.openai.com/static-rsc-4/Rwo8vlZtyzWqUtG6rDg5De1mYJ7Cj8-Pcaa2uR5QUYdoB62HiXWSKIrIqa5Z5G_ZiZrpwYQmIULOfwRLepHUtbbJAjjnn6HCbh4pRh6xMgQaD8pIow0K5_OKA0fsJNtUZkqN5alOpPLfH1wpXNVR2mpaTrLZ5u1O7Zg2PUOuCfc?purpose=inline)

[fypsolutions.com](https://www.fypsolutions.com/image-processing/findcontours-opencv-python-drawcontours-opencv-python/?utm_source=chatgpt.com)

Resultado esperado:

La fotografía mostrará rectángulos verdes alrededor de las regiones detectadas.

Interpretación: este procedimiento detecta regiones y sus ubicaciones, pero no sabe si una región corresponde a una mochila, una persona o una botella. Es una demostración de detección basada en contornos, no un detector semántico de objetos.

### Ejemplo 3. Reconocimiento de patrones

Objetivo: buscar una región de la primera fotografía dentro de la segunda.

Procedimiento:

1. Leer las dos fotografías.
2. Convertir ambas imágenes a escala de grises.
3. Extraer la región central de la primera imagen.
4. Utilizar esa región como patrón de búsqueda.
5. Ejecutar `cv2.matchTemplate()`.
6. Obtener la mejor coincidencia.
7. Calcular el porcentaje de coincidencia.
8. Dibujar un rectángulo verde en la ubicación encontrada.
9. Guardar el resultado.

Comandos principales:

| Comando               | Función                                             |
| --------------------- | --------------------------------------------------- |
| `cv2.matchTemplate()` | Busca un patrón dentro de otra imagen.              |
| `cv2.minMaxLoc()`     | Obtiene el valor máximo y mínimo y sus ubicaciones. |
| `cv2.rectangle()`     | Dibuja el rectángulo de coincidencia.               |
| `round()`             | Redondea el porcentaje.                             |

[opencv Tutorial => Template Matching with Java](https://images.openai.com/static-rsc-4/ofNHhsdI74r6brNQoZFsrl5Afb_cIEDxoEo-RGdfnrA_UBhVFN6215chrgZIUZczzRJf2-1L-iVZ9rLDVqYosbFAzHWUDIJ21pm1e0GKmmPNK2jCt1n-2EINzxqK2PzGRSRjMcnYodQ8Kq3XdMi6wQU9ZL7bh9dDDzxcP0g0uGY?purpose=inline)

[riptutorial.com](https://riptutorial.com/opencv/example/22915/template-matching-with-java?utm_source=chatgpt.com)

Resultado esperado:

La segunda fotografía mostrará un rectángulo que señala la ubicación donde el programa encontró la región más parecida al patrón.

Interpretación: este método funciona mejor cuando el objeto conserva un tamaño y una orientación similares. El porcentaje es una medida de similitud del método, no una probabilidad de que el objeto sea correcto.

### Ejemplo 4. Identificación de características mediante ORB

Objetivo: encontrar puntos clave y comparar características visuales entre dos fotografías.

Procedimiento:

1. Leer las dos fotografías.
2. Convertirlas a escala de grises.
3. Crear el detector ORB.
4. Detectar puntos clave en ambas fotografías.
5. Obtener los descriptores de cada punto.
6. Comparar los descriptores con `BFMatcher`.
7. Filtrar coincidencias mediante una prueba de razón.
8. Dibujar líneas que conectan características coincidentes.
9. Guardar la imagen de comparación.

Comandos principales:

| Comando              | Función                                      |
| -------------------- | -------------------------------------------- |
| `cv2.ORB_create()`   | Crea un detector de características ORB.     |
| `detectAndCompute()` | Detecta puntos clave y calcula descriptores. |
| `cv2.BFMatcher()`    | Compara descriptores.                        |
| `knnMatch()`         | Busca los candidatos más cercanos.           |
| `cv2.drawMatches()`  | Dibuja las coincidencias entre imágenes.     |

[Lesson 10: Feature Detection & Matching - Viet-Anh on Software](https://images.openai.com/static-rsc-4/AuBAKvQCzuVMvC2PvQTfbMqvh-TWhXvFsuOTKqImOKb0umtPBKRelZLlesQtc7fY84s5cdBk0DE4ckh-L7V9Fr8FRJKmZAAI_GECySuZhvtKX3ws-w4pMEsr_4_rG0uWkNV5atspShQJkgwvZJGJOspM_BCFHClntDE6TY6lzK0?purpose=inline)

[vietanh.dev](https://www.vietanh.dev/courses/opencv/10-feature-detection?utm_source=chatgpt.com)

Resultado esperado:

Se generará una imagen con las dos fotografías colocadas una junto a otra y líneas que conectan puntos visuales coincidentes.

Interpretación: cuando dos fotografías muestran el mismo objeto desde perspectivas o condiciones parecidas, pueden compartir características visuales. ORB permite comparar esas características sin entrenar una red neuronal.

## 8. Ejecutar el proyecto desde VS Code

### Paso 1. Verificar la estructura

Antes de ejecutar, comprueba que tengas:

```
u3-p3-rec-img-0777/
│
├── .env-va-0777/
│
├── img-original-0777/
│   ├── img_1.jpg
│   └── img_2.jpg
│
├── codigopy-0777/
│   └── p3-rec-img-0777.py
│
├── resultados-img-0777/
│
└── requirements.txt
```

### Paso 2. Verificar que el entorno esté activo

En la terminal:

```
python --version
pip list
```

Comprueba que aparezcan `opencv-python` y `numpy`.

### Paso 3. Ejecutar el programa

Desde la carpeta principal del proyecto, ejecuta:

```
python .\codigopy-0777\p3-rec-img-0777.py
```

### Paso 4. Revisar los resultados

Si el procesamiento termina correctamente, la carpeta `resultados-img-0777` tendrá los siguientes archivos:

```
resultados-img-0777/
│
├── ejemplo1_clasificacion_img1.jpg
├── ejemplo1_clasificacion_img2.jpg
│
├── ejemplo2_deteccion_img1.jpg
├── ejemplo2_deteccion_img2.jpg
│
├── ejemplo3_reconocimiento_patron.jpg
│
├── ejemplo4_caracteristicas_ORB.jpg
│
└── reporte_reconocimiento.txt
```

Resultado esperado

Se generan automáticamente 7 archivos: seis imágenes procesadas y un reporte de texto.

## 9. Interpretación de los resultados

| Ejemplo            | Archivo generado                     | ¿Qué debe observar el estudiante?             |
| ------------------ | ------------------------------------ | --------------------------------------------- |
| 1. Clasificación   | `ejemplo1_clasificacion_img1.jpg`    | Categoría de color asignada.                  |
| 1. Clasificación   | `ejemplo1_clasificacion_img2.jpg`    | Categoría de color asignada.                  |
| 2. Detección       | `ejemplo2_deteccion_img1.jpg`        | Rectángulos verdes sobre regiones detectadas. |
| 2. Detección       | `ejemplo2_deteccion_img2.jpg`        | Rectángulos verdes sobre regiones detectadas. |
| 3. Patrones        | `ejemplo3_reconocimiento_patron.jpg` | Ubicación de la mejor coincidencia.           |
| 4. Características | `ejemplo4_caracteristicas_ORB.jpg`   | Puntos y líneas de coincidencia.              |
| Reporte            | `reporte_reconocimiento.txt`         | Resumen de los resultados obtenidos.          |

## 10. Problemas frecuentes y soluciones

| Problema                     | Posible causa                                     | Solución                                                            |
| ---------------------------- | ------------------------------------------------- | ------------------------------------------------------------------- |
| `No se pudo abrir img_1.jpg` | Nombre incorrecto o imagen ausente.               | Verificar que esté dentro de `img-original-0777`.                   |
| `No se pudo abrir img_2.jpg` | Extensión incorrecta.                             | Cambiar el nombre a `img_2.jpg`.                                    |
| `No module named cv2`        | OpenCV no está instalado en el entorno activo.    | Ejecutar `pip install opencv-python`.                               |
| `No module named numpy`      | NumPy no está instalado.                          | Ejecutar `pip install numpy`.                                       |
| No aparecen rectángulos      | La imagen tiene pocos bordes o regiones pequeñas. | Utilizar una fotografía con objetos bien definidos.                 |
| Coincidencia muy baja        | Las imágenes son muy diferentes.                  | Fotografiar el mismo objeto con una perspectiva y tamaño similares. |
| Pocas coincidencias ORB      | Imagen borrosa, lisa o con poca textura.          | Utilizar fotografías nítidas con detalles visibles.                 |

Recomendación: para comprobar los ejemplos 3 y 4, utiliza dos fotografías del mismo objeto, pero cambia su posición o el fondo. No esperes coincidencias perfectas si el objeto aparece girado, muy ampliado o con iluminación diferente.

## 11. Actividad guiada: distribución de las 2 horas

| Tiempo      | Actividad del docente y estudiante                                            |
| ----------- | ----------------------------------------------------------------------------- |
| 15 minutos  | Explicar clasificación, detección, localización y reconocimiento de patrones. |
| 15 minutos  | Crear el proyecto, entorno virtual e instalar las librerías.                  |
| 20 minutos  | Ejemplo 1: clasificación por color.                                           |
| 20 minutos  | Ejemplo 2: detección y localización de regiones.                              |
| 20 minutos  | Ejemplo 3: reconocimiento de patrones.                                        |
| 20 minutos  | Ejemplo 4: identificación de características ORB.                             |
| 10 minutos  | Ejecutar, revisar resultados y responder preguntas.                           |
| 120 minutos | Total: 2 horas.                                                               |

## 12. Preguntas de evaluación

Los estudiantes deberán contestar en su cuaderno:

1. ¿Qué es el reconocimiento de imágenes?
2. ¿Cuál es la diferencia entre clasificación y detección de objetos?
3. ¿Para qué sirve convertir una imagen de BGR a HSV?
4. ¿Qué función realiza `cv2.Canny()`?
5. ¿Qué información proporciona `cv2.boundingRect()`?
6. ¿Para qué sirve `cv2.matchTemplate()`?
7. ¿Qué significa el porcentaje de coincidencia del ejemplo 3?
8. ¿Qué es un punto clave en una imagen?
9. ¿Para qué sirve el detector ORB?
10. ¿En qué aplicación de la vida real utilizarías el reconocimiento de imágenes?

## 13. Actividad de reforzamiento

Reto: reconocimiento de una mochila escolar.

Solicita a los estudiantes que realicen lo siguiente:

1. Tomar dos fotografías de una mochila.
2. Guardarlas como `img_1.jpg` e `img_2.jpg`.
3. Ejecutar el programa.
4. Observar las regiones detectadas en ambas imágenes.
5. Revisar el porcentaje de coincidencia del patrón.
6. Comparar las características ORB encontradas.
7. Explicar cuál de los cuatro procedimientos les permitió comparar mejor las fotografías y por qué.

Aplicaciones reales de estos conocimientos:

- Clasificación de productos en una tienda.
- Detección de objetos en cámaras de seguridad.
- Localización de piezas en una línea de producción.
- Comparación de imágenes para control de calidad.
- Reconocimiento de características en fotografías médicas.

## 14. Evidencias de aprendizaje

| Evidencia        | Características                                                      | Instrumento                       |
| ---------------- | -------------------------------------------------------------------- | --------------------------------- |
| Proyecto Python  | Estructura de carpetas, entorno virtual y archivo de requerimientos. | Lista de cotejo.                  |
| Ejemplo 1        | Clasificación de las dos fotografías por color.                      | Revisión del código y resultados. |
| Ejemplo 2        | Detección de regiones mediante contornos.                            | Revisión de imágenes generadas.   |
| Ejemplo 3        | Búsqueda de patrones y localización.                                 | Revisión del resultado.           |
| Ejemplo 4        | Comparación de puntos clave mediante ORB.                            | Revisión del resultado.           |
| Preguntas y reto | Explicación de las cuatro tareas y aplicación práctica.              | Cuestionario y rúbrica.           |

Criterio de logro: el estudiante ejecuta los cuatro ejemplos, identifica las diferencias entre sus resultados y explica qué tarea de Visión Artificial realiza cada uno.
