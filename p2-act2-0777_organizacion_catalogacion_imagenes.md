# Práctica 2. Organización y catalogación de conjuntos de imágenes

**Visión artificial · 3.er semestre de preparatoria · Especialidad de Inteligencia Artificial · Duración: 1 hora**

## 1. Objetivo de la práctica

Organizar un pequeño conjunto de imágenes por categorías, crear una estructura de carpetas y generar automáticamente un catálogo con información básica de cada imagen, incluyendo nombre, categoría, formato, dimensiones, número de canales, tamaño del archivo y fecha de registro.

**Ejemplo que se desarrollará:** catalogar imágenes de animales, comenzando con una imagen de un gato llamada `img-gato-0777.jpg`.

## 2. Crear la carpeta de trabajo y abrirla en VS Code

### Paso 1. Abrir Visual Studio Code

1. Ejecuta Visual Studio Code.
2. Selecciona **Terminal → Nuevo terminal**.
3. Comprueba que la terminal sea PowerShell.

### Paso 2. Crear la carpeta del proyecto

Escribe el siguiente comando en la terminal:

```powershell
mkdir p2-act2-0777
cd p2-act2-0777
```

Comprueba la ubicación actual:

```powershell
Get-Location
```

### Paso 3. Crear el entorno virtual

Ejecuta:

```powershell
py -m venv .env-va-0777
```

Si el comando `py` no está disponible, prueba:

```powershell
python -m venv .env-va-0777
```

### Paso 4. Activar el entorno virtual

En PowerShell:

```powershell
.\.env-va-0777\Scripts\Activate.ps1
```

Si PowerShell bloquea la activación, ejecuta el siguiente comando únicamente para la sesión actual y vuelve a activar el entorno:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.env-va-0777\Scripts\Activate.ps1
```

Cuando el entorno esté activo, la terminal mostrará un prefijo similar a:

```text
(.env-va-0777) PS C:\...\p2-act2-0777>
```

Comprueba que Python corresponde al entorno virtual:

```powershell
python --version
python -m pip --version
```

## 3. Instalar las librerías necesarias

Para este ejemplo utilizaremos **OpenCV** para leer las imágenes y **NumPy** para consultar sus dimensiones y canales.

Ejecuta los comandos con el entorno virtual activado:

```powershell
python -m pip install --upgrade pip
python -m pip install opencv-python numpy
```

Verifica las instalaciones:

```powershell
python -c "import cv2, numpy; print('OpenCV:', cv2.__version__); print('NumPy:', numpy.__version__)"
```

### Crear el archivo de requerimientos

```powershell
python -m pip freeze > requirements.txt
```

Este archivo registrará las versiones instaladas para facilitar la reproducción del proyecto.

## 4. Crear la estructura de carpetas y archivos

### Paso 5. Crear las carpetas principales

Desde la terminal de VS Code, ejecuta:

```powershell
mkdir img-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
mkdir conjuntos-img-0777
```

Crea las carpetas para clasificar las imágenes por categoría:

```powershell
mkdir conjuntos-img-0777\animales
mkdir conjuntos-img-0777\animales\gatos
mkdir conjuntos-img-0777\animales\perros
mkdir conjuntos-img-0777\animales\aves
```

La carpeta `conjuntos-img-0777` contendrá copias organizadas por categoría. El programa creará automáticamente la carpeta correspondiente a cada imagen catalogada.

### Paso 6. Colocar la imagen del gato

Consigue una fotografía de un gato en formato JPG. Puedes utilizar una fotografía propia o una imagen de uso permitido.

Coloca la imagen en:

```text
p2-act2-0777/
└── img-original-0777/
    └── img-gato-0777.jpg
```

**Importante:** la imagen debe ser un archivo JPG real; cambiar el nombre de otro archivo no lo convierte en JPG.

Si tienes una fotografía con otro nombre, puedes copiarla y renombrarla desde PowerShell. Sustituye la ruta de ejemplo por la ubicación real de tu fotografía:

```powershell
Copy-Item "C:\ruta\de\tu\foto.jpg" ".\img-original-0777\img-gato-0777.jpg"
```

### Paso 7. Crear el archivo Python

Crea el archivo:

```text
codigopy-0777/codigo-va-0777.py
```

Puedes abrir la carpeta actual en VS Code con:

```powershell
code .
```

En el explorador de archivos de VS Code, abre `codigopy-0777`, crea el archivo `codigo-va-0777.py` y pega el siguiente código.

## 5. Código Python completamente funcional

El programa leerá las imágenes originales, identificará su categoría a partir del nombre del archivo, copiará cada imagen a la carpeta correspondiente y generará un catálogo CSV y un resumen de texto.

```python
from pathlib import Path
from datetime import datetime
import csv
import shutil

import cv2
import numpy as np


# ============================================
# 1. RUTAS DEL PROYECTO
# ============================================

BASE_DIR = Path(__file__).resolve().parent.parent

CARPETA_ORIGINALES = BASE_DIR / "img-original-0777"
CARPETA_CONJUNTOS = BASE_DIR / "conjuntos-img-0777"
CARPETA_RESULTADOS = BASE_DIR / "resultados-img-0777"

CARPETA_RESULTADOS.mkdir(parents=True, exist_ok=True)
CARPETA_CONJUNTOS.mkdir(parents=True, exist_ok=True)


# ============================================
# 2. FUNCION PARA IDENTIFICAR LA CATEGORIA
# ============================================

def obtener_categoria(nombre_archivo):
    nombre = nombre_archivo.lower()

    if "gato" in nombre or "gatos" in nombre:
        return "animales/gatos"

    if "perro" in nombre or "perros" in nombre:
        return "animales/perros"

    if "ave" in nombre or "aves" in nombre:
        return "animales/aves"

    return "animales/sin_clasificar"


# ============================================
# 3. PREPARAR EL CATALOGO
# ============================================

extensiones_validas = {".jpg", ".jpeg", ".png", ".bmp", ".tif", ".tiff"}

archivos_catalogados = []
errores = []

if not CARPETA_ORIGINALES.exists():
    CARPETA_ORIGINALES.mkdir(parents=True, exist_ok=True)

imagenes = sorted(
    archivo
    for archivo in CARPETA_ORIGINALES.rglob("*")
    if archivo.is_file() and archivo.suffix.lower() in extensiones_validas
)

if not imagenes:
    print("No se encontraron imágenes.")
    print("Coloca img-gato-0777.jpg dentro de img-original-0777.")

# ============================================
# 4. LEER Y CLASIFICAR LAS IMAGENES
# ============================================

for ruta_imagen in imagenes:
    imagen = cv2.imread(str(ruta_imagen))

    if imagen is None:
        errores.append(f"No se pudo leer: {ruta_imagen.name}")
        continue

    alto, ancho = imagen.shape[:2]
    canales = 1 if imagen.ndim == 2 else imagen.shape[2]

    if canales == 3:
        tipo_color = "BGR (3 canales)"
    elif canales == 4:
        tipo_color = "BGRA (4 canales)"
    else:
        tipo_color = f"Escala de grises ({canales} canal)"

    categoria = obtener_categoria(ruta_imagen.name)
    carpeta_categoria = CARPETA_CONJUNTOS.joinpath(*categoria.split("/"))
    carpeta_categoria.mkdir(parents=True, exist_ok=True)

    destino = carpeta_categoria / ruta_imagen.name

    # Copiar la imagen a su categoría sin modificar el original.
    shutil.copy2(ruta_imagen, destino)

    tamano_bytes = ruta_imagen.stat().st_size
    tamano_kb = round(tamano_bytes / 1024, 2)

    # Promedio de intensidad de los píxeles.
    promedio_pixeles = round(float(np.mean(imagen)), 2)

    registro = {
        "nombre": ruta_imagen.name,
        "categoria": categoria,
        "formato": ruta_imagen.suffix.lower(),
        "ancho_px": ancho,
        "alto_px": alto,
        "canales": canales,
        "tipo_color": tipo_color,
        "tamano_bytes": tamano_bytes,
        "tamano_kb": tamano_kb,
        "promedio_pixeles": promedio_pixeles,
        "fecha_catalogacion": datetime.now().isoformat(
            timespec="seconds"
        ),
        "ruta_original": str(ruta_imagen.relative_to(BASE_DIR)),
        "ruta_clasificada": str(destino.relative_to(BASE_DIR)),
    }

    archivos_catalogados.append(registro)

    print(f"Catalogada: {ruta_imagen.name}")
    print(f"  Categoría: {categoria}")
    print(f"  Dimensiones: {ancho} x {alto} píxeles")
    print(f"  Tamaño: {tamano_kb} KB")
    print()


# ============================================
# 5. GENERAR EL CATALOGO CSV
# ============================================

ruta_csv = CARPETA_RESULTADOS / "catalogo-imagenes-0777.csv"

campos = [
    "nombre",
    "categoria",
    "formato",
    "ancho_px",
    "alto_px",
    "canales",
    "tipo_color",
    "tamano_bytes",
    "tamano_kb",
    "promedio_pixeles",
    "fecha_catalogacion",
    "ruta_original",
    "ruta_clasificada",
]

with ruta_csv.open("w", newline="", encoding="utf-8-sig") as archivo_csv:
    escritor = csv.DictWriter(archivo_csv, fieldnames=campos)
    escritor.writeheader()
    escritor.writerows(archivos_catalogados)


# ============================================
# 6. GENERAR EL RESUMEN DE TEXTO
# ============================================

ruta_resumen = CARPETA_RESULTADOS / "resumen-catalogo-0777.txt"

with ruta_resumen.open("w", encoding="utf-8") as archivo_txt:
    archivo_txt.write("CATALOGO DE IMAGENES - PRACTICA 2\n")
    archivo_txt.write("=" * 45 + "\n")
    archivo_txt.write(
        f"Fecha de generación: {datetime.now().isoformat(timespec='seconds')}\n"
    )
    archivo_txt.write(f"Total de imágenes catalogadas: {len(archivos_catalogados)}\n")
    archivo_txt.write(f"Total de errores: {len(errores)}\n\n")

    archivo_txt.write("IMAGENES POR CATEGORIA\n")
    archivo_txt.write("-" * 45 + "\n")

    conteo = {}
    for registro in archivos_catalogados:
        categoria = registro["categoria"]
        conteo[categoria] = conteo.get(categoria, 0) + 1

    for categoria, cantidad in sorted(conteo.items()):
        archivo_txt.write(f"{categoria}: {cantidad}\n")

    archivo_txt.write("\nDETALLE DE LAS IMAGENES\n")
    archivo_txt.write("-" * 45 + "\n")

    for registro in archivos_catalogados:
        archivo_txt.write(f"Nombre: {registro['nombre']}\n")
        archivo_txt.write(f"Categoría: {registro['categoria']}\n")
        archivo_txt.write(
            f"Dimensiones: {registro['ancho_px']} x "
            f"{registro['alto_px']} píxeles\n"
        )
        archivo_txt.write(f"Formato: {registro['formato']}\n")
        archivo_txt.write(f"Tamaño: {registro['tamano_kb']} KB\n")
        archivo_txt.write(f"Color: {registro['tipo_color']}\n\n")

    if errores:
        archivo_txt.write("ERRORES\n")
        for error in errores:
            archivo_txt.write(f"- {error}\n")


# ============================================
# 7. MOSTRAR RESULTADOS
# ============================================

print("=" * 45)
print("PROCESO DE CATALOGACION FINALIZADO")
print("=" * 45)
print(f"Imágenes catalogadas: {len(archivos_catalogados)}")
print(f"Errores: {len(errores)}")
print(f"Catálogo CSV: {ruta_csv}")
print(f"Resumen TXT: {ruta_resumen}")
```

## 6. Ejecutar el programa desde la terminal de VS Code

### Paso 8. Verificar la estructura del proyecto

La estructura inicial debe ser la siguiente:

```text
p2-act2-0777/
│
├── .env-va-0777/
├── img-original-0777/
│   └── img-gato-0777.jpg
│
├── conjuntos-img-0777/
│   └── animales/
│       ├── gatos/
│       ├── perros/
│       └── aves/
│
├── codigopy-0777/
│   └── codigo-va-0777.py
│
├── resultados-img-0777/
└── requirements.txt
```

Los archivos del entorno virtual no se deben modificar manualmente.

### Paso 9. Ejecutar el código

Desde la carpeta principal `p2-act2-0777`, ejecuta:

```powershell
python .\codigopy-0777\codigo-va-0777.py
```

Si la imagen existe y es válida, la terminal mostrará información similar a esta:

```text
Catalogada: img-gato-0777.jpg
  Categoría: animales/gatos
  Dimensiones: 800 x 600 píxeles
  Tamaño: 125.5 KB

=============================================
PROCESO DE CATALOGACION FINALIZADO
=============================================
Imágenes catalogadas: 1
Errores: 0
```

**Nota:** las dimensiones y el tamaño anteriores son ilustrativos; los resultados reales dependen de la imagen utilizada.

## 7. Archivos que se generan automáticamente

Después de ejecutar el programa, la carpeta `resultados-img-0777` contendrá:

### `catalogo-imagenes-0777.csv`

Registro tabular que puede abrirse con Excel o importarse en Pandas. Incluye nombre, categoría, formato, dimensiones, canales, tamaño, promedio de píxeles y rutas.

### `resumen-catalogo-0777.txt`

Informe legible con el total de imágenes, cantidades por categoría, detalles de cada archivo y posibles errores.

La imagen original se conserva sin modificaciones. La copia clasificada se almacena automáticamente en:

```text
conjuntos-img-0777/
└── animales/
    └── gatos/
        └── img-gato-0777.jpg
```

El programa no genera las fotografías: las lee, las clasifica y las copia a su categoría.

## 8. Agregar nuevas imágenes al conjunto de datos

Para ampliar el conjunto, copia fotografías a `img-original-0777` usando nombres que permitan reconocer su categoría:

```text
img-original-0777/
├── img-gato-0777.jpg
├── img-perro-0777.jpg
├── img-ave-0777.jpg
└── img-gato-negro-0777.jpg
```

Vuelve a ejecutar el programa:

```powershell
python .\codigopy-0777\codigo-va-0777.py
```

Las fotografías se clasificarán de acuerdo con las palabras de sus nombres. Por ejemplo, `img-perro-0777.jpg` se clasificará en `animales/perros`.

**Limitación importante:** esta práctica utiliza reglas basadas en nombres, no inteligencia artificial para reconocer animales. Si el nombre no contiene una palabra reconocida, la imagen se guardará en `animales/sin_clasificar`. Para clasificarla por su contenido visual sería necesario incorporar un modelo de visión artificial.

## 9. Distribución didáctica de la sesión — 1 hora

| Tiempo | Actividad del estudiante | Evidencia |
|---|---|---|
| 10 min | Crear la carpeta, el entorno virtual e instalar las librerías. | Entorno activo y `requirements.txt`. |
| 10 min | Crear la estructura de carpetas y colocar la fotografía del gato. | Proyecto organizado. |
| 20 min | Escribir y ejecutar el programa de catalogación. | Código funcional y ejecución sin errores. |
| 10 min | Revisar el CSV, el resumen y la copia clasificada. | Catálogo generado. |
| 10 min | Agregar una segunda imagen, repetir la ejecución y responder preguntas. | Conjunto ampliado y conclusiones. |

## 10. Preguntas de evaluación

1. ¿Cuál es la finalidad de organizar imágenes por categorías?
2. ¿Qué diferencia existe entre una imagen original y una copia clasificada?
3. ¿Qué información registra el archivo CSV?
4. ¿Para qué se utilizan OpenCV y NumPy en esta práctica?
5. ¿Por qué es importante conservar los metadatos de las imágenes?
6. ¿Qué limitación tiene clasificar imágenes únicamente por el nombre del archivo?

**Resultado esperado:** el estudiante tendrá un conjunto de imágenes organizado en carpetas por categoría y un catálogo generado automáticamente con características y metadatos básicos, preparado para utilizarse en futuras prácticas de visión artificial.
