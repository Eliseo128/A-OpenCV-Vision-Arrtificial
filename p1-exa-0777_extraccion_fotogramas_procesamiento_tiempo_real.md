# Práctica 1. Extracción de fotogramas y procesamiento básico en tiempo real

**Visión artificial · 3.er semestre de preparatoria · Especialidad de Inteligencia Artificial · Práctica supervisada · Duración: 2 horas**

## 1. Objetivo de la práctica

Desarrollar un programa en Python con OpenCV que permita:

- Abrir un video de muestra de un gato.
- Leer y procesar sus fotogramas (*frames*) de forma secuencial.
- Aplicar procesamiento básico en tiempo real, como conversión a escala de grises y desenfoque.
- Guardar fotogramas seleccionados como imágenes.
- Medir la resolución, los fotogramas por segundo (FPS) y el tiempo de procesamiento para analizar el rendimiento.

**Producto final:** un programa funcional que procesa el video y guarda automáticamente fotogramas y un informe en `resultados-img-0777`.

## 2. Descargar el video de muestra

Puedes utilizar un video gratuito de dos gatos interactuando, con duración de **10 segundos**, resolución de 1080 × 1920 píxeles y 30 FPS. La página de Pexels indica que está disponible para descarga gratuita.

**Video de muestra: dos gatos interactuando**

- Duración: 10 segundos.
- Resolución original: 1080 × 1920 píxeles.
- Velocidad: 30 FPS.
- [Abrir y descargar el video en Pexels](https://www.pexels.com/video/playful-cats-in-sunlit-room-interaction-30074573/)

### Guardar el video con el nombre solicitado

1. Abre el enlace anterior.
2. Pulsa **Free download** y descarga el video.
3. Si se descarga con otro nombre, renómbralo a `video-gato-0777.mp4`.
4. Colócalo dentro de la carpeta `video-original-0777` del proyecto.

La ruta final debe ser:

```text
p1-exa-0777/
└── video-original-0777/
    └── video-gato-0777.mp4
```

Si el navegador guarda el video en `Descargas`, puedes copiarlo desde PowerShell. Ajusta la ruta si tu carpeta de descargas está en otra ubicación:

```powershell
Copy-Item "$HOME\Downloads\video-gato-0777.mp4" ".\video-original-0777\video-gato-0777.mp4"
```

Si el archivo descargado tiene un nombre diferente, sustituye el nombre de origen por el nombre real del archivo.

## 3. Crear la carpeta de trabajo y el entorno virtual

### Paso 1. Crear el proyecto

Abre Visual Studio Code, selecciona **Terminal → Nuevo terminal** y ejecuta estos comandos en PowerShell:

```powershell
mkdir p1-exa-0777
cd p1-exa-0777
```

Comprueba la ruta:

```powershell
Get-Location
```

### Paso 2. Crear el entorno virtual

```powershell
py -m venv .env-va-0777
```

Si el comando `py` no está disponible, utiliza:

```powershell
python -m venv .env-va-0777
```

### Paso 3. Activar el entorno virtual

```powershell
.\.env-va-0777\Scripts\Activate.ps1
```

Si PowerShell impide la activación, ejecuta:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\.env-va-0777\Scripts\Activate.ps1
```

Verifica que el entorno está activo:

```powershell
python --version
python -m pip --version
```

La terminal debe mostrar un prefijo parecido a:

```text
(.env-va-0777) PS C:\...\p1-exa-0777>
```

### Paso 4. Seleccionar el intérprete en VS Code

1. Presiona `Ctrl + Shift + P`.
2. Escribe `Python: Select Interpreter`.
3. Selecciona el intérprete del entorno `.env-va-0777`.

## 4. Instalar las librerías y crear los requerimientos

Para leer videos, procesar fotogramas y realizar operaciones con matrices utilizaremos OpenCV y NumPy.

Ejecuta:

```powershell
python -m pip install --upgrade pip
python -m pip install opencv-python numpy
```

Verifica que las librerías funcionan:

```powershell
python -c "import cv2, numpy; print('OpenCV:', cv2.__version__); print('NumPy:', numpy.__version__)"
```

Crea el archivo `requirements.txt`:

```powershell
python -m pip freeze > requirements.txt
```

El archivo registrará las versiones instaladas para poder reproducir el entorno posteriormente.

## 5. Crear la estructura de carpetas y archivos

Desde la terminal, ejecuta:

```powershell
mkdir video-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
```

La estructura del proyecto será:

```text
p1-exa-0777/
│
├── .env-va-0777/
│
├── video-original-0777/
│   └── video-gato-0777.mp4
│
├── codigopy-0777/
│   └── codigo-va-0777.py
│
├── resultados-img-0777/
│   ├── fotogramas/
│   ├── catalogo-fotogramas-0777.csv
│   └── informe-video-0777.txt
│
└── requirements.txt
```

Las carpetas y los archivos de resultados se generarán automáticamente cuando ejecutes el programa; no es necesario crearlos manualmente.

Para abrir el proyecto en VS Code, ejecuta:

```powershell
code .
```

En el explorador de archivos, abre `codigopy-0777` y crea el archivo `codigo-va-0777.py`.

## 6. Código Python completo y funcional

Abre `codigopy-0777/codigo-va-0777.py` y copia el siguiente programa. Está preparado para procesar el video, mostrar dos vistas en pantalla, guardar un fotograma cada dos segundos y generar un catálogo CSV y un informe de rendimiento.

```python
from pathlib import Path
import csv
import time

import cv2
import numpy as np


# ============================================
# 1. CONFIGURACION DEL PROYECTO
# ============================================

BASE_DIR = Path(__file__).resolve().parent.parent

VIDEO_ENTRADA = (
    BASE_DIR / "video-original-0777" / "video-gato-0777.mp4"
)

CARPETA_RESULTADOS = BASE_DIR / "resultados-img-0777"
CARPETA_FOTOGRAMAS = CARPETA_RESULTADOS / "fotogramas"

CARPETA_RESULTADOS.mkdir(parents=True, exist_ok=True)
CARPETA_FOTOGRAMAS.mkdir(parents=True, exist_ok=True)

ARCHIVO_CSV = CARPETA_RESULTADOS / "catalogo-fotogramas-0777.csv"
ARCHIVO_INFORME = CARPETA_RESULTADOS / "informe-video-0777.txt"


# ============================================
# 2. ABRIR EL VIDEO
# ============================================

if not VIDEO_ENTRADA.exists():
    raise FileNotFoundError(
        f"No se encontro el video: {VIDEO_ENTRADA}\n"
        "Coloca video-gato-0777.mp4 en video-original-0777."
    )

video = cv2.VideoCapture(str(VIDEO_ENTRADA))

if not video.isOpened():
    raise RuntimeError(
        "OpenCV no pudo abrir el video. Verifica el archivo MP4."
    )

ancho_original = int(video.get(cv2.CAP_PROP_FRAME_WIDTH))
alto_original = int(video.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps_original = video.get(cv2.CAP_PROP_FPS)
total_estimado = int(video.get(cv2.CAP_PROP_FRAME_COUNT))

if fps_original <= 0:
    fps_original = 25.0

duracion_estimada = total_estimado / fps_original

print("=" * 55)
print("PRACTICA: EXTRACCION Y PROCESAMIENTO DE FOTOGRAMAS")
print("=" * 55)
print(f"Video: {VIDEO_ENTRADA.name}")
print(f"Resolucion original: {ancho_original} x {alto_original}")
print(f"FPS originales: {fps_original:.2f}")
print(f"Fotogramas estimados: {total_estimado}")
print(f"Duracion estimada: {duracion_estimada:.2f} segundos")
print("Presiona Q en la ventana del video para terminar.")
print()


# ============================================
# 3. VARIABLES DE PROCESAMIENTO
# ============================================

ANCHO_MAXIMO = 480
INTERVALO_GUARDADO = 2.0

indice_fotograma = 0
fotogramas_guardados = 0
siguiente_guardado = 0.0

tiempo_procesamiento_total = 0.0
registros = []

inicio_programa = time.perf_counter()


# ============================================
# 4. LEER Y PROCESAR FOTOGRAMAS
# ============================================

try:
    while True:
        inicio_ciclo = time.perf_counter()

        correcto, fotograma = video.read()

        if not correcto:
            break

        indice_fotograma += 1

        # Tiempo aproximado del fotograma dentro del video.
        tiempo_video = (indice_fotograma - 1) / fps_original

        # Reducir resolucion para mejorar el rendimiento.
        alto, ancho = fotograma.shape[:2]

        if ancho > ANCHO_MAXIMO:
            nuevo_alto = int(alto * ANCHO_MAXIMO / ancho)
            fotograma = cv2.resize(
                fotograma,
                (ANCHO_MAXIMO, nuevo_alto),
                interpolation=cv2.INTER_AREA
            )

        alto_procesado, ancho_procesado = fotograma.shape[:2]

        # Convertir a escala de grises.
        gris = cv2.cvtColor(fotograma, cv2.COLOR_BGR2GRAY)

        # Reducir ruido mediante desenfoque gaussiano.
        suavizada = cv2.GaussianBlur(gris, (5, 5), 0)

        # Detectar bordes mediante Canny.
        bordes = cv2.Canny(suavizada, 80, 160)

        # Guardar un fotograma cada dos segundos.
        if tiempo_video >= siguiente_guardado:
            nombre = (
                f"fotograma_{fotogramas_guardados + 1:04d}_"
                f"{tiempo_video:.1f}s.jpg"
            )

            ruta_fotograma = CARPETA_FOTOGRAMAS / nombre

            if cv2.imwrite(str(ruta_fotograma), fotograma):
                fotogramas_guardados += 1

                registros.append({
                    "fotograma_video": indice_fotograma,
                    "tiempo_segundos": round(tiempo_video, 3),
                    "archivo": nombre,
                    "ancho_px": ancho_procesado,
                    "alto_px": alto_procesado,
                    "ruta": str(
                        ruta_fotograma.relative_to(BASE_DIR)
                    )
                })

                print(
                    f"Guardado: {nombre} | "
                    f"tiempo: {tiempo_video:.2f} s"
                )

            siguiente_guardado += INTERVALO_GUARDADO

        # Medir tiempo dedicado al procesamiento.
        fin_procesamiento = time.perf_counter()

        tiempo_ms = (
            fin_procesamiento - inicio_ciclo
        ) * 1000

        tiempo_procesamiento_total += tiempo_ms

        fps_procesamiento = (
            1000 / tiempo_ms if tiempo_ms > 0 else 0
        )

        # Mostrar informacion en la imagen.
        cv2.putText(
            fotograma,
            f"Frame: {indice_fotograma}",
            (10, 25),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.6,
            (0, 255, 0),
            2
        )

        cv2.putText(
            fotograma,
            f"Procesamiento: {tiempo_ms:.1f} ms",
            (10, 50),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.5,
            (0, 255, 255),
            1
        )

        cv2.putText(
            fotograma,
            f"FPS procesamiento: {fps_procesamiento:.1f}",
            (10, 75),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.5,
            (0, 255, 255),
            1
        )

        # Convertir bordes a tres canales para mostrar junto al video.
        bordes_color = cv2.cvtColor(
            bordes, cv2.COLOR_GRAY2BGR
        )

        comparacion = np.hstack((fotograma, bordes_color))

        cv2.imshow(
            "Video original reducido | Bordes Canny",
            comparacion
        )

        # Ajustar la espera para aproximar la velocidad del video.
        tiempo_ciclo_ms = (
            time.perf_counter() - inicio_ciclo
        ) * 1000

        espera_ms = max(
            1, int(1000 / fps_original - tiempo_ciclo_ms)
        )

        tecla = cv2.waitKey(espera_ms) & 0xFF

        if tecla == ord("q"):
            print("Procesamiento detenido por el usuario.")
            break

finally:
    video.release()
    cv2.destroyAllWindows()


# ============================================
# 5. CREAR EL CATALOGO CSV
# ============================================

with ARCHIVO_CSV.open(
    "w", newline="", encoding="utf-8-sig"
) as archivo_csv:

    campos = [
        "fotograma_video",
        "tiempo_segundos",
        "archivo",
        "ancho_px",
        "alto_px",
        "ruta"
    ]

    escritor = csv.DictWriter(
        archivo_csv, fieldnames=campos
    )

    escritor.writeheader()
    escritor.writerows(registros)


# ============================================
# 6. GENERAR EL INFORME
# ============================================

tiempo_total = time.perf_counter() - inicio_programa

fps_promedio_procesamiento = (
    1000 / (tiempo_procesamiento_total / indice_fotograma)
    if indice_fotograma > 0 and tiempo_procesamiento_total > 0
    else 0
)

with ARCHIVO_INFORME.open("w", encoding="utf-8") as informe:
    informe.write("INFORME DE PROCESAMIENTO DE VIDEO\n")
    informe.write("=" * 45 + "\n")
    informe.write(f"Video: {VIDEO_ENTRADA.name}\n")
    informe.write(
        f"Resolucion original: "
        f"{ancho_original} x {alto_original}\n"
    )
    informe.write(f"FPS originales: {fps_original:.2f}\n")
    informe.write(f"Duracion estimada: {duracion_estimada:.2f} s\n")
    informe.write(f"Fotogramas leidos: {indice_fotograma}\n")
    informe.write(f"Fotogramas guardados: {fotogramas_guardados}\n")
    informe.write(
        f"FPS promedio de procesamiento: "
        f"{fps_promedio_procesamiento:.2f}\n"
    )
    informe.write(f"Tiempo total de ejecucion: {tiempo_total:.2f} s\n")
    informe.write(f"Intervalo de guardado: {INTERVALO_GUARDADO} s\n")


# ============================================
# 7. MOSTRAR EL RESUMEN FINAL
# ============================================

print()
print("=" * 55)
print("PROCESAMIENTO FINALIZADO")
print("=" * 55)
print(f"Fotogramas leidos: {indice_fotograma}")
print(f"Fotogramas guardados: {fotogramas_guardados}")
print(f"FPS promedio de procesamiento: {fps_promedio_procesamiento:.2f}")
print(f"Tiempo total: {tiempo_total:.2f} segundos")
print(f"Catalogo CSV: {ARCHIVO_CSV}")
print(f"Informe: {ARCHIVO_INFORME}")
print(f"Fotogramas: {CARPETA_FOTOGRAMAS}")
```

## 7. Ejecutar la práctica

Abre la terminal de VS Code. Comprueba que estás en la carpeta `p1-exa-0777` y que el entorno virtual está activado.

Ejecuta:

```powershell
python .\codigopy-0777\codigo-va-0777.py
```

Se abrirá una ventana con dos vistas:

- **Izquierda:** fotograma del video reducido, con información de procesamiento.
- **Derecha:** bordes detectados con el método Canny.

Presiona la tecla `Q` mientras la ventana del video está activa para detener el procesamiento antes de que termine.

### ¿Qué significa cada dato?

| Dato | Explicación |
|---|---|
| Resolución | Ancho y alto del video en píxeles. |
| FPS originales | Fotogramas por segundo indicados por el video de origen. |
| Fotogramas leídos | Cantidad de fotogramas procesados por el programa. |
| Tiempo de procesamiento | Tiempo aproximado empleado en leer y procesar cada fotograma. |
| FPS de procesamiento | Velocidad aproximada de procesamiento, calculada a partir de ese tiempo. |
| Fotogramas guardados | Cantidad de imágenes extraídas y guardadas en la carpeta de resultados. |

Los FPS de procesamiento que se muestran son una estimación del tiempo empleado en el ciclo de lectura y procesamiento; no representan necesariamente los FPS efectivos de reproducción, ya que también influyen la visualización y el equipo utilizado.

## 8. Resultados que se generan automáticamente

Al finalizar, la carpeta `resultados-img-0777` contendrá:

```text
resultados-img-0777/
├── fotogramas/
│   ├── fotograma_0001_0.0s.jpg
│   ├── fotograma_0002_2.0s.jpg
│   ├── fotograma_0003_4.0s.jpg
│   ├── fotograma_0004_6.0s.jpg
│   ├── fotograma_0005_8.0s.jpg
│   └── ...
│
├── catalogo-fotogramas-0777.csv
└── informe-video-0777.txt
```

Con un video de 10 segundos, el programa guardará aproximadamente cinco fotogramas, en los tiempos 0, 2, 4, 6 y 8 segundos. El resultado exacto depende de la duración real del archivo y de si se detiene la ejecución anticipadamente.

- `fotogramas/`: contiene las imágenes extraídas.
- `catalogo-fotogramas-0777.csv`: registra el número de fotograma, el tiempo, el nombre del archivo, sus dimensiones y su ruta.
- `informe-video-0777.txt`: resume las características del video y el rendimiento del procesamiento.

## 9. Pruebas supervisadas de resolución y rendimiento

Realiza estas pruebas modificando una variable del código cada vez:

1. Cambia `ANCHO_MAXIMO = 480` a `ANCHO_MAXIMO = 320`.
2. Ejecuta nuevamente el programa y anota los FPS de procesamiento.
3. Cambia `ANCHO_MAXIMO = 480` a `ANCHO_MAXIMO = 640`.
4. Compara el rendimiento y la calidad visual de los resultados.
5. Cambia `INTERVALO_GUARDADO = 2.0` a `INTERVALO_GUARDADO = 1.0` y observa cuántas imágenes se generan.

Reducir la resolución suele disminuir el número de píxeles que se procesan y puede mejorar el rendimiento, aunque los resultados dependen del equipo y del video. Guardar más fotogramas incrementa la cantidad de archivos generados y el uso de almacenamiento.

## 10. Distribución didáctica de las dos horas

| Tiempo | Actividad supervisada | Evidencia |
|---|---|---|
| 15 min | Crear el proyecto, el entorno virtual e instalar las librerías. | Entorno activo y archivo de requerimientos. |
| 15 min | Descargar y ubicar el video de muestra. | Video en la carpeta correcta. |
| 30 min | Escribir y ejecutar el programa. | Ventana de procesamiento funcionando. |
| 20 min | Revisar los fotogramas extraídos, el CSV y el informe. | Archivos generados automáticamente. |
| 20 min | Comparar dos resoluciones y registrar los FPS. | Tabla de resultados. |
| 20 min | Contestar las preguntas y explicar las conclusiones. | Evidencia de aprendizaje. |

## 11. Preguntas de evaluación

1. ¿Qué es un fotograma (*frame*)?
2. ¿Cuál es la diferencia entre FPS del video y FPS de procesamiento?
3. ¿Qué efecto tiene reducir la resolución sobre el rendimiento?
4. ¿Para qué se utiliza la conversión a escala de grises?
5. ¿Qué información contiene el catálogo CSV?
6. ¿Por qué es útil extraer fotogramas de un video para proyectos de visión artificial?

**Resultado esperado:** el estudiante ejecuta un programa que procesa un video de muestra, visualiza los bordes detectados, extrae fotogramas de forma periódica y analiza la relación entre resolución, tiempo de procesamiento y rendimiento.
