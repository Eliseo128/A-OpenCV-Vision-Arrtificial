# Práctica 1 — Metadatos y propiedades de imágenes con Python y OpenCV

**Especialidad:** Inteligencia Artificial  
**Nivel:** Tercer semestre de preparatoria  
**Duración:** 1 hora · Práctica guiada  
**Carpeta:** `p1-act1-0777`  
**Entorno virtual:** `.env-va-0777`

## 1. Propósito de la práctica

Aprender a utilizar Python y OpenCV para obtener información básica de una imagen digital:

- **Metadatos:** información asociada al archivo, como formato, dimensiones y tamaño.
- **Dimensiones:** ancho y alto de la imagen en píxeles.
- **Resolución:** cantidad de píxeles que componen la imagen, expresada como ancho × alto.
- **Canales:** componentes de color; por ejemplo, BGR para imágenes a color y un canal para imágenes en escala de grises.
- **Formato:** tipo de archivo, como JPG, PNG o BMP.
- **Tamaño del archivo:** espacio que ocupa en disco, expresado en bytes, KB o MB.

Al finalizar, el programa mostrará las propiedades en la terminal y generará automáticamente archivos de resultados.

## 2. Crear la carpeta de trabajo desde VS Code

Abre Visual Studio Code y selecciona **Terminal → New Terminal**.

Ejecuta los siguientes comandos en la terminal de PowerShell, uno por uno.

**Paso 1. Crear la carpeta principal:**

```powershell
mkdir p1-act1-0777
```

**Paso 2. Entrar en la carpeta:**

```powershell
cd p1-act1-0777
```

**Paso 3. Comprobar la ubicación:**

```powershell
pwd
```

La terminal debe mostrar una ruta que termine en:

```text
p1-act1-0777
```

## 3. Crear y activar el entorno virtual

**Paso 1. Crear el entorno virtual:**

```powershell
python -m venv .env-va-0777
```

**Paso 2. Activarlo:**

```powershell
.env-va-0777\Scripts\Activate.ps1
```

Cuando se active correctamente, verás al inicio de la terminal:

```text
(.env-va-0777)
```

Si PowerShell bloquea la activación, ejecuta:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Después, vuelve a ejecutar el comando de activación.

## 4. Seleccionar el intérprete de Python

En VS Code:

1. Presiona `Ctrl + Shift + P`.
2. Escribe `Python: Select Interpreter`.
3. Selecciona el intérprete correspondiente a:

```text
.env-va-0777\Scripts\python.exe
```

Así te aseguras de instalar y ejecutar las bibliotecas dentro del entorno de esta práctica.

## 5. Instalar las bibliotecas necesarias

Primero, actualiza `pip`:

```powershell
python -m pip install --upgrade pip
```

Instala OpenCV:

```powershell
python -m pip install opencv-python
```

Instala NumPy:

```powershell
python -m pip install numpy
```

Estas bibliotecas se utilizarán para leer imágenes, consultar sus dimensiones y canales, y analizar sus datos de píxeles.

### Verificar la instalación

Ejecuta:

```powershell
python -c "import cv2; print('OpenCV:', cv2.__version__)"
```

Después:

```powershell
python -c "import numpy; print('NumPy:', numpy.__version__)"
```

Si aparecen los números de versión, la instalación se realizó correctamente.

## 6. Crear el archivo de requerimientos

En la terminal, con el entorno activado, ejecuta:

```powershell
python -m pip freeze > requirements.txt
```

Este archivo registra las bibliotecas y versiones instaladas para poder reproducir el entorno posteriormente.

## 7. Crear la estructura de carpetas y archivos

Ejecuta los siguientes comandos desde la carpeta `p1-act1-0777`:

```powershell
mkdir img-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
```

Crea el archivo de código:

```powershell
New-Item codigopy-0777\codigo-va-0777.py -ItemType File
```

La estructura inicial será:

```text
p1-act1-0777/
│
├── .env-va-0777/
│
├── img-original-0777/
│   └── img-gato-0777.jpg
│
├── codigopy-0777/
│   └── codigo-va-0777.py
│
├── resultados-img-0777/
│
└── requirements.txt
```

El entorno virtual y `requirements.txt` ya se han creado. La imagen y el programa se prepararán en los siguientes pasos.

## 8. Colocar la imagen original

Necesitas una fotografía de un gato en formato JPG.

Guarda o copia la imagen dentro de:

```text
img-original-0777/
```

El nombre exacto debe ser:

```text
img-gato-0777.jpg
```

La ruta completa del archivo será:

```text
img-original-0777/img-gato-0777.jpg
```

**Importante:** OpenCV no crea una fotografía real a partir del nombre del archivo. Debes colocar una imagen JPG válida en esa ubicación. Si el archivo no existe o tiene otro nombre, el programa indicará el error.

## 9. Crear el programa `codigo-va-0777.py`

Abre en VS Code el archivo:

```text
codigopy-0777/codigo-va-0777.py
```

Copia el siguiente código completo. El programa leerá la imagen, mostrará sus propiedades y generará automáticamente un informe de texto y una copia de la imagen para documentar la práctica.

```python
import cv2
import numpy as np
from pathlib import Path

# -----------------------------------------
# 1. Definir las rutas del proyecto
# -----------------------------------------

CARPETA_PROYECTO = Path(__file__).resolve().parent.parent

RUTA_IMAGEN = (
    CARPETA_PROYECTO
    / "img-original-0777"
    / "img-gato-0777.jpg"
)

CARPETA_RESULTADOS = (
    CARPETA_PROYECTO / "resultados-img-0777"
)

# Crear la carpeta de resultados si no existe
CARPETA_RESULTADOS.mkdir(parents=True, exist_ok=True)

# -----------------------------------------
# 2. Comprobar que existe la imagen
# -----------------------------------------

if not RUTA_IMAGEN.is_file():
    print("ERROR: No se encontro la imagen.")
    print("Coloca img-gato-0777.jpg en:")
    print(RUTA_IMAGEN)
    raise SystemExit(1)

# -----------------------------------------
# 3. Obtener el tamaño del archivo
# -----------------------------------------

tamano_bytes = RUTA_IMAGEN.stat().st_size
tamano_kb = tamano_bytes / 1024
tamano_mb = tamano_bytes / (1024 * 1024)

# -----------------------------------------
# 4. Leer la imagen con OpenCV
# -----------------------------------------

imagen = cv2.imread(str(RUTA_IMAGEN), cv2.IMREAD_COLOR)

if imagen is None:
    print("ERROR: El archivo no es una imagen valida")
    print("o el formato no se pudo interpretar.")
    raise SystemExit(1)

# -----------------------------------------
# 5. Obtener dimensiones y canales
# -----------------------------------------

alto, ancho, canales = imagen.shape

total_pixeles = ancho * alto
resolucion = f"{ancho} x {alto}"

# -----------------------------------------
# 6. Consultar propiedades de los pixeles
# -----------------------------------------

tipo_datos = str(imagen.dtype)
valor_minimo = int(np.min(imagen))
valor_maximo = int(np.max(imagen))
promedio = float(np.mean(imagen))

# OpenCV lee las imagenes a color en orden BGR.
# Calcular promedios de los canales B, G y R.
promedio_b = float(np.mean(imagen[:, :, 0]))
promedio_g = float(np.mean(imagen[:, :, 1]))
promedio_r = float(np.mean(imagen[:, :, 2]))

# -----------------------------------------
# 7. Preparar el informe
# -----------------------------------------

informe = f"""
INFORME DE METADATOS Y PROPIEDADES
==================================

Nombre del archivo: {RUTA_IMAGEN.name}
Ruta del archivo: {RUTA_IMAGEN}
Formato por extension: {RUTA_IMAGEN.suffix.upper()}
Tamano en bytes: {tamano_bytes}
Tamano en KB: {tamano_kb:.2f}
Tamano en MB: {tamano_mb:.4f}

DIMENSIONES
-----------
Ancho: {ancho} pixeles
Alto: {alto} pixeles
Resolucion: {resolucion}
Total de pixeles: {total_pixeles:,}

CANALES Y DATOS
---------------
Numero de canales: {canales}
Orden de canales: BGR
Tipo de datos: {tipo_datos}
Valor minimo de pixel: {valor_minimo}
Valor maximo de pixel: {valor_maximo}
Promedio general de los valores: {promedio:.2f}

PROMEDIO POR CANAL
------------------
Azul (B): {promedio_b:.2f}
Verde (G): {promedio_g:.2f}
Rojo (R): {promedio_r:.2f}

Nota: el formato se identifica por la extension
del archivo. La resolucion indica las dimensiones
en pixeles y no los puntos por pulgada (DPI).
"""

# -----------------------------------------
# 8. Mostrar el informe en la terminal
# -----------------------------------------

print(informe)

# -----------------------------------------
# 9. Guardar el informe automaticamente
# -----------------------------------------

ruta_informe = CARPETA_RESULTADOS / "metadatos-img-0777.txt"

ruta_informe.write_text(informe, encoding="utf-8")

# -----------------------------------------
# 10. Guardar una copia de la imagen
# -----------------------------------------

ruta_copia = CARPETA_RESULTADOS / "copia-img-gato-0777.jpg"

if not cv2.imwrite(str(ruta_copia), imagen):
    print("No se pudo guardar la copia de la imagen.")
    raise SystemExit(1)

# -----------------------------------------
# 11. Finalizar
# -----------------------------------------

print("Practica completada correctamente.")
print("Informe:", ruta_informe)
print("Copia de imagen:", ruta_copia)
```

## 10. Ejecutar el programa

Guarda el archivo con `Ctrl + S`.

En la terminal de VS Code, verifica que estés en la carpeta principal `p1-act1-0777` y que el entorno virtual esté activado.

Ejecuta:

```powershell
python codigopy-0777\codigo-va-0777.py
```

Si todo funciona correctamente, verás un informe con información semejante a esta. Los valores son ilustrativos y dependerán de tu imagen:

```text
INFORME DE METADATOS Y PROPIEDADES
==================================

Nombre del archivo: img-gato-0777.jpg
Formato por extension: .JPG
Tamano en bytes: 185420
Tamano en KB: 181.07

DIMENSIONES
-----------
Ancho: 800 pixeles
Alto: 600 pixeles
Resolucion: 800 x 600
Total de pixeles: 480,000

CANALES Y DATOS
---------------
Numero de canales: 3
Orden de canales: BGR
Tipo de datos: uint8
Valor minimo de pixel: 0
Valor maximo de pixel: 255
```

No es necesario que tu imagen tenga exactamente esos valores. El programa calcula los resultados a partir del archivo real.

## 11. Archivos generados automáticamente

Cuando el programa termine, la carpeta `resultados-img-0777` contendrá:

```text
resultados-img-0777/
│
├── metadatos-img-0777.txt
└── copia-img-gato-0777.jpg
```

- `metadatos-img-0777.txt`: contiene las propiedades obtenidas.
- `copia-img-gato-0777.jpg`: contiene una copia de la imagen original, guardada mediante OpenCV.

No tienes que crear manualmente estos dos archivos: el programa los genera durante su ejecución.

## 12. Interpretación de los resultados

| Propiedad | ¿Qué significa? |
|---|---|
| Ancho | Número de píxeles horizontales. |
| Alto | Número de píxeles verticales. |
| Resolución en píxeles | Combinación de ancho × alto. |
| Total de píxeles | Ancho multiplicado por alto. |
| Canales | Componentes que representan el color. |
| `uint8` | Tipo de dato que representa valores de 0 a 255. |
| Tamaño en bytes | Espacio ocupado por el archivo en disco. |
| Formato JPG | Formato de imagen comprimida con pérdida. |
| Promedio BGR | Promedio de los valores de los canales azul, verde y rojo. |

**Diferencia importante:** las dimensiones en píxeles no son lo mismo que los DPI (puntos por pulgada). Este programa obtiene las dimensiones y propiedades de los píxeles, pero no consulta los metadatos EXIF completos de la fotografía.

## 13. Estructura final del proyecto

```text
p1-act1-0777/
│
├── .env-va-0777/
│
├── img-original-0777/
│   └── img-gato-0777.jpg
│
├── codigopy-0777/
│   └── codigo-va-0777.py
│
├── resultados-img-0777/
│   ├── metadatos-img-0777.txt
│   └── copia-img-gato-0777.jpg
│
└── requirements.txt
```

## 14. Actividad de cierre

El estudiante deberá responder en su cuaderno:

1. ¿Cuál es la diferencia entre las dimensiones y el tamaño de un archivo?
2. ¿Cuántos canales tiene una imagen a color leída con OpenCV?
3. ¿Cuántos píxeles tiene una imagen de 800 × 600?
4. ¿Qué información se almacena en `metadatos-img-0777.txt`?
5. ¿Por qué es importante conocer las propiedades de una imagen antes de procesarla mediante inteligencia artificial?

## 15. Distribución de la hora de práctica

| Tiempo | Actividad |
|---:|---|
| 10 min | Explicación de metadatos y propiedades de imágenes. |
| 10 min | Crear carpeta, entorno virtual e instalar bibliotecas. |
| 10 min | Crear la estructura de carpetas y colocar la imagen. |
| 20 min | Escribir, ejecutar y analizar el programa. |
| 10 min | Revisar resultados y contestar preguntas. |
| **60 min** | **Total** |

**Producto final:** el proyecto `p1-act1-0777` con el entorno virtual, `requirements.txt`, la imagen original, el programa Python y los resultados generados automáticamente.
