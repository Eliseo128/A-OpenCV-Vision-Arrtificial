Aquí tienes la versión mejorada, atractiva y elegante de tu práctica guiada. Está diseñada específicamente para captar la atención de estudiantes de tercer semestre de preparatoria, con un tono motivador, explicaciones paso a paso claras, analogías sencillas y **el código de Python completo y corregido** (ya que el original estaba truncado). 

Puedes copiar todo el contenido del bloque de código a continuación y guardarlo como un archivo con extensión `.md` (por ejemplo, `practica_vision_artificial.md`) para descargarlo y compartirlo.

```markdown
# 🚀 Práctica Guiada: Preparación y Evaluación de Imágenes para Visión Artificial

> **Nivel:** Básico – Principiante (Desde cero)  
> **Duración:** 2 horas  
> **Asignatura:** Soluciona problemas de Visión Artificial  
> **Especialidad:** Inteligencia Artificial  
> **Semestre:** 3º de Preparatoria  
> **Herramientas:** Python, Visual Studio Code, OpenCV y NumPy.

---

## 🎯 1. Propósito de la Práctica
El objetivo es que comprendas **cómo preparar un conjunto de imágenes** antes de alimentarlas a un modelo de Inteligencia Artificial. Al final, serás capaz de:

- ✅ Identificar el tamaño y formato de las imágenes.
- ✅ Organizar imágenes en carpetas por categoría.
- ✅ Cambiar el tamaño de las imágenes a dimensiones uniformes.
- ✅ Convertir imágenes a un formato común.
- ✅ Normalizar los valores de los píxeles (¡la comida favorita de la IA!).
- ✅ Evaluar que las imágenes procesadas cumplan con los criterios establecidos.

**📦 Producto esperado:** Un conjunto de imágenes organizado, redimensionado, convertido y normalizado, acompañado de un reporte automático generado con Python.

---

## 🧠 2. Conceptos Básicos (¡Sin tecnicismos!)

Antes de escribir código, entendamos el "porqué" con una analogía: *Imagina que la IA es un chef que solo sabe cocinar si todos los ingredientes están cortados en cubos exactos de 1 cm y medidos en gramos. Si le das una papa entera o una medida en tazas, ¡la receta fallará!*

| Concepto | Explicación sencilla | Ejemplo |
| :--- | :--- | :--- |
| **Tamaño de imagen** | Cantidad de píxeles (puntitos de color) que forman la imagen. | 640 × 480 píxeles |
| **Formato** | El "apellido" del archivo que indica cómo está guardado. | `.jpg`, `.png`, `.bmp` |
| **Redimensionamiento** | Estirar o encoger la imagen a un ancho y alto específicos. | 224 × 224 píxeles |
| **Normalización** | Cambiar los valores de color (0-255) a un rango pequeño (0-1) para que la IA calcule más rápido. | De `128` a `0.502` |
| **Organización** | Clasificar imágenes en carpetas según lo que muestran. | Carpeta `gatos` y `perros` |
| **Evaluación** | Comprobar automáticamente que todo el proceso salió bien. | Verificar que mida 224×224 y sea legible |

---

## 🎒 3. Materiales Necesarios
- [ ] Computadora con Windows.
- [ ] Visual Studio Code (VS Code) instalado.
- [ ] Python instalado (versión 3.8 o superior).
- [ ] 10 imágenes digitales: 5 de una categoría (ej. gatos) y 5 de otra (ej. perros).  
  *(💡 Tip: Descárgalas de internet, asegúrate de que sean claras, diferentes entre sí y sin marcas de agua. No importa si tienen tamaños distintos).*

---

## 💻 4. Configuración del Proyecto (Paso a Paso)

Trabajaremos en un proyecto llamado `u3-p4-prep-img-0777`. Sigue estos pasos en orden:

### Paso 1: Abrir la terminal
1. Abre **Visual Studio Code**.
2. Ve al menú superior: **Terminal → Nueva Terminal**.
3. Asegúrate de que a la izquierda de la terminal diga `PowerShell`.

### Paso 2: Crear la carpeta de trabajo
Escribe estos comandos y presiona `Enter` después de cada uno:
```powershell
mkdir u3-p4-prep-img-0777
cd u3-p4-prep-img-0777
```
> *`mkdir` crea una carpeta. `cd` te permite entrar en ella.*

### Paso 3: Crear y activar el entorno virtual
Un entorno virtual es como una "mochila aislada" para que las librerías de este proyecto no interfieran con otros.
```powershell
python -m venv .env-va-0777
.\.env-va-0777\Scripts\Activate.ps1
```
> ⚠️ **¿Aparece un error en rojo sobre "Execution Policy"?**  
> No te preocupes, es una medida de seguridad de Windows. Ejecuta este comando y vuelve a intentar la activación:
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> ```
> ✅ *Éxito:* Verás algo como `(.env-va-0777) PS C:\...\u3-p4-prep-img-0777>` al inicio de la línea.

### Paso 4: Instalar las librerías necesarias
```powershell
python -m pip install --upgrade pip
pip install opencv-python numpy
```
| Librería | ¿Para qué sirve? |
| :--- | :--- |
| `opencv-python` | El "ojos" del programa: lee, redimensiona y guarda imágenes. |
| `numpy` | El "cerebro matemático": maneja las matrices de píxeles y la normalización. |

### Paso 5: Guardar la receta de instalación
```powershell
pip freeze > requirements.txt
```
*(Esto crea un archivo que recuerda qué librerías instalamos, muy útil para compartir el proyecto).*

---

## 📁 5. Estructura de Carpetas y Archivos

Crea la organización necesaria ejecutando estos comandos:
```powershell
mkdir img-original-0777
mkdir img-preparadas-0777
mkdir codigopy-0777
mkdir resultados-img-0777
mkdir img-original-0777\gatos
mkdir img-original-0777\perros
```

**Así debe verse tu proyecto:**
```text
u3-p4-prep-img-0777/
│
├── .env-va-0777/               (Tu entorno virtual, no lo toques)
├── img-original-0777/          (Aquí pegarás tus 10 fotos originales)
│   ├── gatos/ (gato1.jpg, gato2.jpg, etc.)
│   └── perros/ (perro1.jpg, perro2.jpg, etc.)
├── img-preparadas-0777/        (Aquí el programa guardará los resultados)
├── codigopy-0777/              (Aquí va nuestro código)
│   └── p4-preparacion-img-0777.py
├── resultados-img-0777/        (Aquí se guardará el reporte)
└── requirements.txt
```
> 📌 **Acción:** Ahora, copia manualmente tus 5 fotos de gatos a la carpeta `gatos` y tus 5 fotos de perros a la carpeta `perros`.

---

## ⌨️ 6. Desarrollo del Código (¡La parte emocionante!)

1. En VS Code, ve a la carpeta `codigopy-0777` y crea un archivo llamado `p4-preparacion-img-0777.py`.
2. *(Opcional pero recomendado)*: Presiona `Ctrl + Shift + P`, escribe `Python: Select Interpreter` y elige el que dice `.env-va-0777`.
3. **Copia y pega el siguiente código completo** (está diseñado para ser robusto y con comentarios explicativos):

```python
import cv2
import numpy as np
import os
import csv

# 1. Configuración inicial
carpeta_original = "img-original-0777"
carpeta_preparadas = "img-preparadas-0777"
carpeta_resultados = "resultados-img-0777"

ANCHO_DESTINO = 224
ALTO_DESTINO = 224

# Crear carpetas de salida si no existen
os.makedirs(carpeta_preparadas, exist_ok=True)
os.makedirs(carpeta_resultados, exist_ok=True)

categorias = ["gatos", "perros"]
reporte = []
imagenes_procesadas = 0
imagenes_aprobadas = 0

print("🚀 Iniciando preparación de imágenes...\n")

# 2. Recorrer cada categoría y sus archivos
for categoria in categorias:
    ruta_origen = os.path.join(carpeta_original, categoria)
    ruta_destino = os.path.join(carpeta_preparadas, categoria)
    
    os.makedirs(ruta_destino, exist_ok=True)
    
    if not os.path.exists(ruta_origen):
        print(f"⚠️ La carpeta {ruta_origen} no existe. Saltando...")
        continue
        
    for nombre_archivo in os.listdir(ruta_origen):
        # Filtrar solo archivos de imagen válidos
        if not nombre_archivo.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp')):
            continue
            
        ruta_imagen = os.path.join(ruta_origen, nombre_archivo)
        nombre_sin_ext = os.path.splitext(nombre_archivo)[0]
        
        print(f"📸 Procesando: {nombre_archivo}")
        
        # 3. Leer la imagen
        imagen = cv2.imread(ruta_imagen)
        if imagen is None:
            print(f"   ❌ Error: No se pudo leer la imagen.")
            reporte.append([categoria, nombre_archivo, "ERROR", "-", "-", "-", "-", "-", "-", "REVISAR"])
            continue
            
        imagenes_procesadas += 1
        alto_orig, ancho_orig, canales = imagen.shape
        print(f"   📏 Dimensiones originales: {ancho_orig} x {alto_orig}")
        
        # 4. Redimensionar la imagen
        imagen_redimensionada = cv2.resize(imagen, (ANCHO_DESTINO, ALTO_DESTINO), interpolation=cv2.INTER_AREA)
        print(f"   📐 Dimensiones nuevas: {ANCHO_DESTINO} x {ALTO_DESTINO}")
        
        # Guardar la imagen redimensionada como JPG
        ruta_jpg = os.path.join(ruta_destino, f"{nombre_sin_ext}.jpg")
        cv2.imwrite(ruta_jpg, imagen_redimensionada)
        
        # 5. Normalizar los valores de los píxeles (de 0-255 a 0.0-1.0)
        imagen_normalizada = imagen_redimensionada.astype(np.float32) / 255.0
        val_min = float(np.min(imagen_normalizada))
        val_max = float(np.max(imagen_normalizada))
        print(f"   🔢 Rango normalizado: {val_min:.3f} a {val_max:.3f}")
        
        # Guardar los datos numéricos normalizados como archivo .npy
        ruta_npy = os.path.join(ruta_destino, f"{nombre_sin_ext}.npy")
        np.save(ruta_npy, imagen_normalizada)
        
        # 6. Evaluar automáticamente el resultado
        dimensiones_correctas = (imagen_redimensionada.shape[0] == ALTO_DESTINO and 
                                 imagen_redimensionada.shape[1] == ANCHO_DESTINO)
        rango_correcto = (val_min >= 0.0 and val_max <= 1.0)
        archivos_guardados = os.path.isfile(ruta_jpg) and os.path.isfile(ruta_npy)
        
        if dimensiones_correctas and rango_correcto and archivos_guardados:
            estado = "APROBADA"
            imagenes_aprobadas += 1
            print(f"   ✅ Evaluación: APROBADA\n")
        else:
            estado = "REVISAR"
            print(f"   ⚠️ Evaluación: REVISAR\n")
            
        # 7. Guardar datos en la lista para el reporte final
        reporte.append([
            categoria, nombre_archivo, "OK", ancho_orig, alto_orig,
            ANCHO_DESTINO, ALTO_DESTINO, round(val_min, 3), round(val_max, 3), estado
        ])

# 8. Generar el reporte en formato CSV
ruta_reporte = os.path.join(carpeta_resultados, "reporte_preparacion.csv")
with open(ruta_reporte, "w", newline="", encoding="utf-8") as archivo:
    escritor = csv.writer(archivo)
    escritor.writerow([
        "Categoría", "Archivo original", "Lectura", 
        "Ancho original", "Alto original", "Ancho preparado", "Alto preparado", 
        "Valor mínimo norm.", "Valor máximo norm.", "Evaluación"
    ])
    escritor.writerows(reporte)

# 9. Resumen final en consola
print("=" * 45)
print("🎉 RESUMEN DE LA PRÁCTICA")
print("=" * 45)
print(f"Imágenes procesadas: {imagenes_procesadas}")
print(f"Imágenes aprobadas:  {imagenes_aprobadas}")
print(f"Imágenes a revisar:  {imagenes_procesadas - imagenes_aprobadas}")
print(f"\n📁 Reporte guardado en: {ruta_reporte}")
print("✅ PRÁCTICA TERMINADA EXITOSAMENTE")
```

---

## ▶️ 7. Ejecutar el Programa

1. Asegúrate de que la terminal de VS Code esté en la carpeta principal `u3-p4-prep-img-0777`.
2. Ejecuta el siguiente comando:
   ```powershell
   python .\codigopy-0777\p4-preparacion-img-0777.py
   ```

### 🔍 Resultado esperado en la terminal:
```text
🚀 Iniciando preparación de imágenes...

📸 Procesando: gato1.jpg
   📏 Dimensiones originales: 640 x 480
   📐 Dimensiones nuevas: 224 x 224
   🔢 Rango normalizado: 0.000 a 1.000
   ✅ Evaluación: APROBADA

=============================================
🎉 RESUMEN DE LA PRÁCTICA
=============================================
Imágenes procesadas: 10
Imágenes aprobadas:  10
Imágenes a revisar:  0

📁 Reporte guardado en: resultados-img-0777\reporte_preparacion.csv
✅ PRÁCTICA TERMINADA EXITOSAMENTE
```

---

## 📊 8. Evaluación y Verificación

No basta con que el código corra; ¡debemos verificar la calidad! Abre el archivo `reporte_preparacion.csv` en Excel o VS Code para ver los resultados.

### Lista de Verificación del Estudiante (Checklist)
Marca con una `X` lo que hayas logrado:
- [ ] Las 10 imágenes están organizadas en las carpetas `gatos` y `perros`.
- [ ] Todas las imágenes originales se abren correctamente.
- [ ] Las imágenes en `img-preparadas-0777` tienen dimensiones de 224 × 224 píxeles.
- [ ] Se generaron archivos `.jpg` (para visualizar) y `.npy` (con datos normalizados).
- [ ] El archivo `reporte_preparacion.csv` existe y muestra "APROBADA" en la evaluación.

### Rúbrica de Evaluación (Para el docente)
| Criterio | Condición esperada | Ponderación |
| :--- | :--- | :---: |
| **Lectura** | La imagen se abre sin errores. | 20% |
| **Dimensiones** | Todas miden exactamente 224 × 224 píxeles. | 25% |
| **Formato** | La imagen preparada se guarda correctamente en JPG. | 15% |
| **Normalización** | Los valores en el archivo `.npy` están entre 0.0 y 1.0. | 25% |
| **Organización** | Las carpetas respetan la estructura por categorías. | 15% |
| **TOTAL** | | **100%** |

---

## 🧩 9. Actividad de Reforzamiento: "Misión Extra"

¿Terminaste antes de tiempo? ¡Acepta este desafío para subir de nivel! Modifica tu código para:
1. Cambiar el tamaño de destino de `224 × 224` a `128 × 128`.
2. Agregar una tercera categoría llamada `aves` en la lista `categorias = ["gatos", "perros", "aves"]`.
3. Colocar 5 fotografías de aves en la carpeta `img-original-0777/aves`.
4. Volver a ejecutar el programa y verificar que el reporte CSV incluya las nuevas imágenes.

### 📝 Preguntas para reflexionar (Responde en tu cuaderno):
1. ¿Qué significa redimensionar una imagen y por qué puede deformarla si no se cuida la proporción?
2. ¿Por qué es crucial que todas las imágenes tengan las *mismas* dimensiones para una IA?
3. ¿Qué diferencia práctica existe entre guardar una imagen como `.jpg` y como `.npy`?
4. Si una imagen da "ERROR" en la lectura, ¿cuáles podrían ser las causas? (Piensa en el nombre del archivo o su formato real).

---

## ⏱️ 10. Distribución del Tiempo (120 minutos)

| Etapa | Actividad | Tiempo |
| :--- | :--- | :---: |
| **Apertura** | Explicación de conceptos con analogías y demostración. | 15 min |
| **Desarrollo 1** | Crear proyecto, entorno virtual e instalar librerías. | 20 min |
| **Desarrollo 2** | Organizar las imágenes originales por categorías. | 15 min |
| **Desarrollo 3** | Escritura y explicación del código Python paso a paso. | 30 min |
| **Desarrollo 4** | Ejecutar el programa, depurar errores y generar reporte. | 20 min |
| **Cierre** | Revisión del checklist, reflexión y preguntas de reforzamiento. | 20 min |

---

## 🏆 11. Conclusión

La preparación de datos es el **80% del trabajo** en cualquier proyecto de Visión Artificial. Un modelo de IA, por muy avanzado que sea, no puede aprender bien si los datos están desordenados, en tamaños variados o con valores sin normalizar. 

Al completar esta práctica, has dado tu primer paso real como ingeniero de datos: has tomado información cruda (imágenes diversas) y la has transformado en un **conjunto de datos estructurado, limpio y listo para ser entrenado** por un algoritmo de Inteligencia Artificial.

> **🌟 Aprendizaje esperado logrado:** El estudiante prepara y evalúa imágenes digitales mediante herramientas de Python, comprendiendo la importancia crítica de la calidad y organización de los datos antes de utilizarlos en un modelo de IA.
```

### 💡 Mejoras clave aplicadas respecto al original:
1. **Código Python completo y funcional**: El fragmento original estaba cortado a la mitad. Se escribió un script completo, robusto, con manejo de errores (si una imagen no carga, no rompe el programa, solo lo registra) y comentarios didácticos.
2. **Diseño visual (Markdown elegante)**: Uso de emojis estratégicos, tablas limpias, bloques de cita (`>`) y listas de verificación interactivas (`- [ ]`) para hacerlo visualmente atractivo para adolescentes.
3. **Analogías didácticas**: Se añadió la analogía del "chef y los ingredientes" para explicar la normalización y el redimensionamiento, haciendo el concepto abstracto mucho más tangible.
4. **Manejo de errores proactivo**: Se incluye la solución al error común de `Execution Policy` en PowerShell de Windows, evitando que los estudiantes se bloqueen al inicio.
5. **Tono motivador**: Se cambió el lenguaje de "instrucciones frías" a "pasos de una misión", manteniendo el rigor técnico pero aumentando el compromiso del estudiante.
