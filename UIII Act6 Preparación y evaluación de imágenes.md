# **Práctica guiada: Preparación y evaluación de imágenes para Visión Artificial**



Nivel: básico – principiante

Duración: 2 horas



**Asignatura:** Soluciona problemas de Visión Artificial\
**Especialidad:** Inteligencia Artificial\
**Semestre:** Tercer semestre de preparatoria\
**Herramientas:** Python, Visual Studio Code, OpenCV y NumPy.

## **1. Propósito de la práctica**

Que los estudiantes comprendan cómo preparar un conjunto de imágenes antes de utilizarlas en un modelo de Inteligencia Artificial, mediante las siguientes actividades:

1. Identificar el tamaño y formato de las imágenes.
2. Organizar imágenes en carpetas según su categoría.
3. Cambiar el tamaño de las imágenes a dimensiones uniformes.
4. Convertir imágenes a un formato común.
5. Normalizar los valores de los píxeles.
6. Evaluar que las imágenes procesadas cumplan con los criterios establecidos.

**Producto esperado:** un pequeño conjunto de imágenes organizado, redimensionado, convertido y normalizado, acompañado de un reporte de evaluación generado con Python.

## **2. Conceptos básicos**

Antes de comenzar, el docente explica los siguientes conceptos:

| Concepto           | Explicación sencilla                                         | Ejemplo                           |
| ------------------ | ------------------------------------------------------------ | --------------------------------- |
| Tamaño de imagen   | Cantidad de píxeles que tiene una imagen.                    | 640 × 480                         |
| Formato            | Tipo de archivo de imagen.                                   | JPG, PNG, BMP                     |
| Redimensionamiento | Cambiar el ancho y alto de una imagen.                       | 224 × 224                         |
| Normalización      | Convertir los valores de los píxeles a un rango determinado. | De 0–255 a 0–1                    |
| Organización       | Clasificar imágenes en carpetas según su contenido.          | Gatos y perros                    |
| Evaluación         | Comprobar que las imágenes cumplen los requisitos.           | Tamaño correcto y archivo legible |

### **¿Por qué es importante preparar las imágenes?**

Un modelo de Inteligencia Artificial necesita recibir datos organizados y con características compatibles. Si las imágenes tienen diferentes tamaños, formatos o valores de píxeles, puede ser necesario procesarlas antes de utilizarlas.

[Rescale, resize, and downscale — skimage v0.20.0 docs](https://images.openai.com/static-rsc-4/nanf1EvMGnd08oY7ip2-0aIx3Df17F1Y6VKLOj--yx_AA0IcjeuNrSnA1oejQb6RQE6BwCWrL2PhFnUheScTjoU1p28ATPYTtVy5lD-uRXT1JCOi_Us3hYkXjnbL4gOhaNQwBm-HS0M8ZEBuuUGbEe7_A9ktwHEr7D4SmjBsbS8?purpose=inline)

[Extracting Chess Square Coordinates Dynamically with OpenCV Image Processing Methods | by siromer | Medium](https://images.openai.com/static-rsc-4/bMw5G_xW7eE_b4bwXksmdY-hn6HKNWmMkGCq79YsljpKpaxPxdzUe2-zAzRsyIEEX79IyUBhHcb6mOmGX4xByoxNz2HJQFSr8_YS2eubTZDSX9CfQQ0PS5f_JO6okhIKOBgvFSAk0iA3Sju2d7QdftbZRy4_26yLtVsecLhVG-o?purpose=inline)

[Ultralytics YOLO11 Pixel Normalization Explained | Ultralytics posted on the topic | LinkedIn](https://images.openai.com/static-rsc-4/jm2HAKw3fe6itLjyfzLaC6x3QCj73fDgIwj5kIFW4XqUFUtUfTG6cyLAB6Jzjs-COHWD22N3Gc8MUx8pmS23uyC4VriogCkxFWicmxZnWRX3uGLPUxmTBGSF5mSCtKUCq9F-WAx77LXFfVnS9iAqNE6hLfCMH6w2NIWCj5KAeEQ?purpose=inline)

10

## **3. Materiales necesarios**

- Computadora con Windows.
- Visual Studio Code.
- Python instalado.
- Conexión a Internet para descargar imágenes (opcional).
- Diez imágenes digitales: cinco de una categoría y cinco de otra.

**Ejemplo de conjunto de imágenes:**

[Différentes Races De Chats • Les plus belles photos par Bonjour Nature](https://images.openai.com/static-rsc-4/YUI1I-OyurYkNa0lz_VEwB9bha2ni1B1AqZp9-GI5gGPB8M4uyat4ZpK026z9CF3RY01SFyvCVGpSPNTaWW4VCdmnDDFYUDawo4FTXkd3ePMSD4iPIDL_xaMvSvrKZVHf3xqAGhFQJvghWktl5G2r6s5tkEx-6Lz_7it90x9jS0?purpose=inline)

**Categoría 1: Gatos**

cinco fotografías diferentes.

[Unsupported client – Canva](https://images.openai.com/static-rsc-4/m7nGyGj7AG6kMnkNDezHY8cMVd2TvnOccyxm7XtGIvuiBLl2gVwoDg35TNBVqX66kKtH6qA6-1v2wbGLiyUSMo43qYgEuhjaLuVeWl1M5hNG3DuszBAF4pEabtCiVturOhGnnHVLsrmJvAsEYehgPadLSY2MsEIiFPoZwzIkQDw?purpose=inline)

**Categoría 2: Perros**

cinco fotografías diferentes.

Se recomienda utilizar fotografías claras, diferentes entre sí y sin marcas de agua. No es necesario que tengan el mismo tamaño original.

## **4. Crear el proyecto desde la terminal de VS Code**

En esta práctica se utilizará el proyecto `u3-p4-prep-img-0777`.

### **Paso 1. Abrir Visual Studio Code**

1. Abre Visual Studio Code.
2. Selecciona **Terminal → New Terminal**.
3. Comprueba que la terminal esté utilizando PowerShell.

### **Paso 2. Crear la carpeta de trabajo**

Escribe los siguientes comandos:

```
mkdir u3-p4-prep-img-0777
cd u3-p4-prep-img-0777
```

**Explicación:**

- `mkdir`: crea una carpeta.
- `cd`: permite ingresar a una carpeta.

### **Paso 3. Crear el entorno virtual**

```
python -m venv .env-va-0777
```

El entorno virtual permite instalar las librerías necesarias para la práctica.

### **Paso 4. Activar el entorno virtual**

```
.\.env-va-0777\Scripts\Activate.ps1
```

Si PowerShell bloquea la activación, ejecuta:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Después vuelve a ejecutar el comando de activación.

La terminal debe mostrar algo parecido a:

```
(.env-va-0777) PS C:\...\u3-p4-prep-img-0777>
```

### **Paso 5. Instalar las librerías**

Ejecuta:

```
python -m pip install --upgrade pip
pip install opencv-python numpy
```

| Librería        | Utilidad                                           |
| --------------- | -------------------------------------------------- |
| `opencv-python` | Leer, redimensionar, convertir y guardar imágenes. |
| `numpy`         | Manipular matrices y normalizar los píxeles.       |

### **Paso 6. Crear el archivo de requerimientos**

```
pip freeze > requirements.txt
```

Este archivo almacena las librerías instaladas y sus versiones.

Para consultar su contenido:

```
Get-Content requirements.txt
```

## **5. Crear la estructura de carpetas y archivos**

Ejecuta los siguientes comandos en la terminal:

```
mkdir img-original-0777
mkdir img-preparadas-0777
mkdir codigopy-0777
mkdir resultados-img-0777

mkdir img-original-0777\gatos
mkdir img-original-0777\perros
```

La estructura inicial del proyecto será:

```
u3-p4-prep-img-0777/
│
├── .env-va-0777/
│
├── img-original-0777/
│   ├── gatos/
│   │   ├── gato1.jpg
│   │   ├── gato2.jpg
│   │   ├── gato3.jpg
│   │   ├── gato4.jpg
│   │   └── gato5.jpg
│   │
│   └── perros/
│       ├── perro1.jpg
│       ├── perro2.jpg
│       ├── perro3.jpg
│       ├── perro4.jpg
│       └── perro5.jpg
│
├── img-preparadas-0777/
│
├── codigopy-0777/
│   └── p4-preparacion-img-0777.py
│
├── resultados-img-0777/
│
└── requirements.txt
```

### **Paso 7. Colocar las imágenes originales**

1. Consigue cinco fotografías diferentes de gatos.
2. Colócalas en `img-original-0777/gatos`.
3. Consigue cinco fotografías diferentes de perros.
4. Colócalas en `img-original-0777/perros`.

Los archivos deben tener los nombres indicados en la estructura o cualquier otro nombre con extensión `.jpg`, `.jpeg` o `.png`.

**Importante:** el programa también puede leer imágenes BMP. Evita colocar archivos que no sean imágenes dentro de estas carpetas.

### **Paso 8. Crear el archivo Python**

Dentro de `codigopy-0777`, crea:

```
p4-preparacion-img-0777.py
```

Selecciona el intérprete del entorno virtual desde VS Code:

1. Presiona `Ctrl + Shift + P`.
2. Escribe `Python: Select Interpreter`.
3. Selecciona `.env-va-0777`.

## **6. Desarrollo de la práctica: preparar las imágenes**

La práctica se realizará mediante cuatro procedimientos principales:

1. Leer y analizar las imágenes originales.
2. Redimensionar y convertir las imágenes.
3. Normalizar los valores de los píxeles.
4. Evaluar y generar un reporte de resultados.

### **Paso 1. Importar las librerías**

```
import cv2import numpy as npimport osimport csv
```

**Explicación:**

- `cv2`: permite trabajar con imágenes.
- `numpy`: permite realizar operaciones matemáticas con los píxeles.
- `os`: permite crear y consultar carpetas.
- `csv`: permite generar un reporte en formato CSV.

### **Paso 2. Definir las carpetas del proyecto**

```
carpeta_original = "img-original-0777"carpeta_preparadas = "img-preparadas-0777"carpeta_resultados = "resultados-img-0777"os.makedirs(carpeta_preparadas, exist_ok=True)os.makedirs(carpeta_resultados, exist_ok=True)
```

**Explicación:**

- Se establecen las rutas de las imágenes originales y preparadas.
- `os.makedirs()` crea las carpetas si todavía no existen.
- `exist_ok=True` evita generar un error cuando la carpeta ya existe.

### **Paso 3. Leer las imágenes**

```
imagen = cv2.imread("img-original-0777/gatos/gato1.jpg")if imagen is not None:    print("Imagen cargada correctamente")    print("Dimensiones:", imagen.shape)else:    print("No se pudo cargar la imagen")
```

**Explicación:**

- `cv2.imread()`: carga una imagen.
- `imagen.shape`: permite consultar sus dimensiones.
- `imagen is not None`: comprueba que la imagen se haya leído correctamente.

Por ejemplo, una imagen puede presentar estas dimensiones:

```
(480, 640, 3)
```

Esto significa:

- 480 píxeles de alto.
- 640 píxeles de ancho.
- 3 canales de color (BGR).

### **Paso 4. Redimensionar las imágenes**

```
imagen_redimensionada = cv2.resize(    imagen,    (224, 224),    interpolation=cv2.INTER_AREA)
```

**Explicación:**

| Parámetro        | Función                                                    |
| ---------------- | ---------------------------------------------------------- |
| `imagen`         | Imagen original.                                           |
| `(224, 224)`     | Nuevo ancho y alto.                                        |
| `cv2.INTER_AREA` | Método de interpolación recomendado para reducir imágenes. |

**¿Por qué utilizar 224 × 224?**

Es un tamaño frecuente en modelos de clasificación de imágenes. En esta práctica se utiliza para que todas las imágenes tengan las mismas dimensiones.

[Finding the New ResNet18](https://images.openai.com/static-rsc-4/YoUN8F3FM4oHEsXXQkseEMBI4ZqY9R3ZHDw75IJArFvjm52no4qRaK_6GBr8FS6gV5MCPZoxyGQPqVKKGbQoN_NBzB6lXrAxlvJFuhrJumyBGbwM94Gdfz0dfmR0sqzaR4Y3v4Xg-LTBekne2Z-7OzXVBB96nKzh2j8WD1ynyNo?purpose=inline)

[Prediction de race de chiens](https://images.openai.com/static-rsc-4/wyPpo7mDSKRDA_nOFYMxhmd2p_6pWz51X8dv4Cu5KgHWB-zlXqqufB1fkJOEho2rx2Ga0vSZRXb9y1yemphaxwNEQOZ49nlmWX2WH7Na_c1kjLfKRMJbKZIsOrzkoqxgh0nNCy8bwn9Ss0CPWcArRJB4zhBHf2QeZxr5BlAcgAk?purpose=inline)

[Fire Alert System with Classification Model Explained by Class Activation Map | by Natthasit Wongsirikul | Medium](https://images.openai.com/static-rsc-4/Bo8ONE-i2eUpxiwEDisV9Ujtesb6OLyfDEmH8yDLxh2JJc7VZmpBgJlpWM3oVFjbcwznPq4hB1ptvRab0iK4caNw1QE6tNEm4JDIlWszYr5HNxv1aWdE-pE2QM8YUJ6mmsQMoP4sv2o3Ge5QanPmYl9Ae1zTQNq3lI2Gieyqwbk?purpose=inline)

9

**Importante:** cambiar una imagen de dimensiones rectangulares a cuadradas puede deformarla. En esta práctica se realiza directamente para aprender el redimensionamiento; en proyectos reales se puede conservar la proporción mediante recorte o relleno.

### **Paso 5. Normalizar los valores de los píxeles**

Una imagen digital de 8 bits utiliza valores entre 0 y 255.

Para normalizarla se divide cada píxel entre 255:

```
imagen_normalizada = imagen_redimensionada / 255.0
```

**Ejemplo:**

| Valor original | Valor normalizado |
| -------------- | ----------------- |
| 0              | 0.000             |
| 64             | 0.251             |
| 128            | 0.502             |
| 192            | 0.753             |
| 255            | 1.000             |

La fórmula utilizada es:

\\[ P\_{\text{normalizado}}=\frac{P\_{\text{original}}}{255} \\]

De esta manera, los valores quedan en el rango de 0 a 1.

**Importante:** la imagen normalizada se guardará como archivo `.npy`, ya que este formato conserva los valores decimales de NumPy. La imagen JPG se guardará por separado para visualizarla.

## **7. Código completo de la práctica**

El siguiente programa procesa automáticamente todas las imágenes que encuentre en las carpetas `gatos` y `perros`.

Realiza las siguientes operaciones:

- Lee las imágenes.
- Consulta sus dimensiones originales.
- Redimensiona a 224 × 224 píxeles.
- Guarda las imágenes preparadas en formato JPG.
- Normaliza los valores de los píxeles.
- Guarda los datos normalizados en archivos `.npy`.
- Genera un reporte CSV con los resultados de cada imagen.

Copia el código completo en `p4-preparacion-img-0777.py`.

```
        )        rango_correcto = (            imagen_normalizada.min() >= 0.0            and imagen_normalizada.max() <= 1.0        )        archivos_guardados = (            os.path.isfile(ruta_jpg)            and os.path.isfile(ruta_npy)        )        if (dimensiones_correctas                and rango_correcto                and archivos_guardados):            estado = "APROBADA"            print("Evaluacion: APROBADA")        else:            estado = "REVISAR"            print("Evaluacion: REVISAR")        # --------------------------------------------------        # 9. GUARDAR DATOS PARA EL REPORTE        # --------------------------------------------------        reporte.append([            categoria,            nombre_archivo,            "OK",            ancho_original,            alto_original,            ANCHO,            ALTO,            round(float(imagen_normalizada.min()), 3),            round(float(imagen_normalizada.max()), 3),            estado        ])# ----------------------------------------------------------# 10. GENERAR EL REPORTE CSV# ----------------------------------------------------------ruta_reporte = os.path.join(    carpeta_resultados,    "reporte_preparacion.csv")with open(    ruta_reporte,    "w",    newline="",    encoding="utf-8") as archivo:    escritor = csv.writer(archivo)    escritor.writerow([        "Categoria",        "Archivo original",        "Lectura",        "Ancho original",        "Alto original",        "Ancho preparado",        "Alto preparado",        "Valor minimo normalizado",        "Valor maximo normalizado",        "Evaluacion"    ])    escritor.writerows(reporte)
```

**Nota didáctica:** el reporte registra las imágenes que se pudieron leer y procesar. En caso de que una imagen no pueda abrirse, se marca como error. La evaluación automática comprueba las dimensiones, el rango de normalización y la existencia de los archivos generados.

## **8. Ejecutar el programa**

Desde la terminal de VS Code, asegúrate de estar dentro de la carpeta principal del proyecto y ejecuta:

```
python .\codigopy-0777\p4-preparacion-img-0777.py
```

El programa comenzará a procesar las fotografías de las dos categorías.

### **Resultado esperado en la terminal**

Un ejemplo de salida será:

```
Procesando: img-original-0777\gatos\gato1.jpg

Dimensiones originales: 640 x 480
Dimensiones nuevas: (224, 224, 3)

Valor minimo: 0.0
Valor maximo: 1.0

Evaluacion: APROBADA

===================================
RESUMEN DE LA PRACTICA
===================================

Imagenes procesadas: 10
Imagenes aprobadas: 10
Imagenes para revisar: 0

PRACTICA TERMINADA
```

Los resultados exactos dependerán de las imágenes que utilicen los estudiantes.

## **9. Estructura final del proyecto**

Después de ejecutar el programa, se generarán automáticamente las imágenes preparadas, los archivos normalizados y el reporte.

```
u3-p4-prep-img-0777/
│
├── .env-va-0777/
│
├── img-original-0777/
│   ├── gatos/
│   └── perros/
│
├── img-preparadas-0777/
│   ├── gatos/
│   │   ├── gato1.jpg
│   │   ├── gato1.npy
│   │   ├── gato2.jpg
│   │   └── gato2.npy
│   │
│   └── perros/
│       ├── perro1.jpg
│       ├── perro1.npy
│       ├── perro2.jpg
│       └── perro2.npy
│
├── codigopy-0777/
│   └── p4-preparacion-img-0777.py
│
├── resultados-img-0777/
│   └── reporte_preparacion.csv
│
└── requirements.txt
```

## **10. Evaluación de las imágenes preparadas**

El docente explica que no basta con procesar las imágenes: también es necesario verificar que cumplan los requisitos.

### **Criterios de evaluación**

| Criterio      | Condición esperada                           | Valor    |
| ------------- | -------------------------------------------- | -------- |
| Lectura       | La imagen se abre correctamente.             | 20%      |
| Dimensiones   | Todas miden 224 × 224 píxeles.               | 25%      |
| Formato       | La imagen preparada se guarda en JPG.        | 15%      |
| Normalización | Los valores se encuentran entre 0 y 1.       | 25%      |
| Organización  | Las imágenes están separadas por categorías. | 15%      |
| **Total**     |                                              | **100%** |

### **Lista de verificación del estudiante**

**Lista de verificación**

0/7 completados

Las diez imágenes están organizadas en las carpetas gatos y perros.

Todas las imágenes originales se pueden abrir.

Las imágenes preparadas tienen dimensiones de 224 × 224 píxeles.

Las imágenes procesadas se guardaron en formato JPG.

Los archivos NPY contienen valores normalizados entre 0 y 1.

Se generó el archivo reporte_preparacion.csv.

Se revisó el resultado de la evaluación automática.

Reiniciar lista

## **11. Actividad de reforzamiento**

Una vez terminada la práctica, los estudiantes realizarán las siguientes modificaciones:

1. Cambiar el tamaño de las imágenes de 224 × 224 a 128 × 128.
2. Agregar una tercera categoría llamada `aves`.
3. Incorporar cinco fotografías de aves.
4. Ejecutar nuevamente el programa.
5. Revisar el reporte CSV y comprobar que las nuevas imágenes fueron procesadas.
6. Comparar una imagen original con su versión preparada.

**Preguntas para responder en el cuaderno:**

1. ¿Qué significa redimensionar una imagen?
2. ¿Por qué es importante que las imágenes tengan las mismas dimensiones?
3. ¿Cuáles son los formatos de imagen utilizados en esta práctica?
4. ¿Qué significa normalizar los valores de los píxeles?
5. ¿Por qué se divide entre 255?
6. ¿Qué diferencia existe entre un archivo JPG y uno NPY?
7. ¿Por qué es importante organizar las imágenes por categorías?
8. ¿Qué información proporciona el reporte CSV?
9. ¿Qué podría suceder si una imagen está dañada?
10. ¿Por qué es necesario evaluar las imágenes antes de utilizarlas en un modelo de Inteligencia Artificial?

## **12. Distribución del tiempo: 2 horas**

| Etapa      | Actividad                                                     | Tiempo      |
| ---------- | ------------------------------------------------------------- | ----------- |
| Apertura   | Explicación de tamaño, formato, normalización y organización. | 15 min      |
| Desarrollo | Crear proyecto, entorno virtual e instalar librerías.         | 20 min      |
| Desarrollo | Organizar las imágenes por categorías.                        | 15 min      |
| Desarrollo | Demostrar lectura y redimensionamiento.                       | 15 min      |
| Desarrollo | Demostrar conversión de formato y normalización.              | 20 min      |
| Desarrollo | Ejecutar el programa y generar el reporte.                    | 15 min      |
| Cierre     | Evaluar resultados y responder preguntas.                     | 20 min      |
| **Total**  |                                                               | **120 min** |

## **13. Evidencias de aprendizaje**

| Evidencia                  | Características                                  | Instrumento                      |
| -------------------------- | ------------------------------------------------ | -------------------------------- |
| Estructura del proyecto    | Carpetas originales, preparadas y código Python. | Lista de cotejo                  |
| Conjunto de imágenes       | Fotografías organizadas en categorías.           | Lista de cotejo                  |
| Imágenes procesadas        | Dimensiones 224 × 224 y formato JPG.             | Observación directa              |
| Archivos normalizados      | Archivos NPY con valores entre 0 y 1.            | Revisión del código y resultados |
| Reporte CSV                | Registro de las imágenes y su evaluación.        | Revisión del archivo             |
| Actividad de reforzamiento | Modificación del tamaño y nueva categoría.       | Rúbrica                          |

## **14. Conclusión de la práctica**

La preparación de imágenes es una etapa fundamental en un proyecto de Visión Artificial. Antes de entrenar un modelo de Inteligencia Artificial, es necesario organizar las fotografías, establecer dimensiones uniformes, utilizar formatos compatibles y normalizar los valores de los píxeles.

Al finalizar la práctica, los estudiantes habrán utilizado Python, OpenCV y NumPy para construir un pequeño conjunto de imágenes preparado y evaluado.

**Aprendizaje esperado:** el estudiante prepara y evalúa imágenes digitales mediante herramientas de Python, comprendiendo la importancia de la calidad y organización de los datos antes de utilizarlos en un modelo de Inteligencia Artificial.

**Producto final:** carpeta del proyecto, código Python, archivo `requirements.txt`, imágenes preparadas, archivos `.npy` y reporte `reporte_preparacion.csv`.
