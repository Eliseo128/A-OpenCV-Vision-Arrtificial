# 🎓 CLASE PRÁCTICA: Conjuntos de Datos para Visión Artificial
> **Unidad 3 | Práctica 4 | Clave:** `0777`  
> **Nivel:** 3er semestre de preparatoria — *Especialidad en Inteligencia Artificial* 🤖

---

## 🎯 Objetivo de la Sesión

Al finalizar esta práctica serás capaz de:
* 🧠 **Comprender** la diferencia fundamental entre los conjuntos de **Entrenamiento**, **Validación** y **Prueba**.
* 🐍 **Dividir** un conjunto de imágenes en estos tres subconjuntos utilizando Python y `scikit-learn`.
* 📊 **Visualizar** la distribución de tus datos de forma gráfica, profesional y atractiva.

---

## 💡 Conceptos Clave (5 min)

Imagina que estás preparando a un atleta o a un estudiante para un gran examen:

| 📁 Conjunto | 🧩 Analogía Didáctica | 👁️ Propósito en Visión Artificial | 📐 % Habitual |
| :--- | :--- | :--- | :---: |
| 🏋️‍♂️ **Entrenamiento (`train`)** | El libro de texto y estudio diario | El modelo aprende patrones y características clave. | **70%** |
| 📑 **Validación (`val`)** | Exámenes simulados de práctica | Ajustamos hiperparámetros y corregimos errores. | **15%** |
| 🎓 **Prueba (`test`)** | El examen final real | Evaluamos el desempeño real con datos nunca vistos. | **15%** |

> 🚨 **REGLA DE ORO EN IA:** ¡Jamás mezcles el conjunto de prueba (`test`) con el de entrenamiento (`train`)! Si lo haces, tu modelo "memorizará" las imágenes en lugar de aprender a generalizar.

---

## 🛠️ Paso a Paso desde la Terminal (VS Code)

### 📌 Paso 1: Crear la carpeta de trabajo
Abre tu terminal y crea el directorio principal del proyecto:
```bash
mkdir u3-p4-conjunto-datos-0777
cd u3-p4-conjunto-datos-0777
```

### 📌 Paso 2: Crear la estructura de subcarpetas
```bash
mkdir img-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
```

### 📌 Paso 3: Crear el entorno virtual
```bash
python -m venv .env-va-0777
```

### 📌 Paso 4: Activar el entorno virtual
Dependiendo de tu sistema operativo, ejecuta el comando correspondiente:

* 🪟 **Windows (PowerShell):**
  ```bash
  .env-va-0777\Scripts\Activate.ps1
  ```
* 🪟 **Windows (CMD):**
  ```bash
  .env-va-0777\Scripts\activate.bat
  ```
* 🍎🐧 **Linux / Mac:**
  ```bash
  source .env-va-0777/bin/activate
  ```

> ⚙️ **Verificación:** Debes observar el prefijo `(.env-va-0777)` al inicio de tu terminal.

### 📌 Paso 5: Crear el archivo de dependencias
Dentro de la carpeta `codigopy-0777`, crea el archivo `requirements.txt` con las siguientes librerías:

```txt
numpy==1.26.4
pillow==10.3.0
matplotlib==3.8.4
scikit-learn==1.4.2
opencv-python==4.9.0.80
```

### 📌 Paso 6: Instalar las librerías necesarias
```bash
pip install -r codigopy-0777/requirements.txt
```

---

## 📂 Estructura Final del Proyecto

Así debe verse tu espacio de trabajo al finalizar la configuración:

```text
u3-p4-conjunto-datos-0777/
├── 🐍 .env-va-0777/              ← Entorno virtual activo
├── 🖼️ img-original-0777/         ← Imágenes originales (generadas por el script)
├── 📜 codigopy-0777/
│   ├── 📄 requirements.txt
│   └── 🐍 p4-conjunto-datos-va-0777.py
└── 📊 resultados-img-0777/       ← Se generará automáticamente con train/val/test
```

---

## 💻 Paso 7: Código Fuente Principal

Crea el archivo `p4-conjunto-datos-va-0777.py` dentro de `codigopy-0777/` y pega el siguiente código:

```python
# -*- coding: utf-8 -*-
"""
=============================================================
 PRACTICA 4 - CONJUNTOS DE DATOS EN VISION ARTIFICIAL
 Unidad 3 | Clave 0777 | 3er semestre IA
=============================================================
 Objetivo: dividir un conjunto de imágenes en train / val / test
           y visualizar la distribución de forma gráfica.
"""

import os
import shutil
import numpy as np
from PIL import Image, ImageDraw, ImageFont
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split

# ================= CONFIGURACIÓN =================
RUTA_ORIGEN   = "../img-original-0777"
RUTA_RESULT   = "../resultados-img-0777"
TOTAL_IMAGENES = 20          # cantidad de imágenes sintéticas
TAMANO = (200, 200)          # ancho x alto en pixeles
SEED = 777                   # semilla para reproducibilidad

# Proporciones didácticas
TRAIN_SIZE = 0.70
VAL_SIZE   = 0.15
TEST_SIZE  = 0.15

# ================= FUNCIONES AUXILIARES =================
def generar_imagen_sintetica(idx, tamaño):
    """Crea una imagen de colores aleatorios con un número encima."""
    arr = np.random.randint(50, 230, (tamaño[1], tamaño[0], 3), dtype=np.uint8)
    img = Image.fromarray(arr)
    draw = ImageDraw.Draw(img)
    # Dibuja un círculo y el número para que sea visualmente atractivo
    draw.ellipse([30, 30, 170, 170], fill=(255, 255, 255), outline=(0, 0, 0), width=3)
    try:
        font = ImageFont.truetype("arial.ttf", 60)
    except:
        font = ImageFont.load_default()
    draw.text((85, 75), str(idx), fill=(0, 0, 0), font=font)
    return img


def crear_dataset_original(ruta, n):
    """Genera n imágenes sintéticas y las guarda en la carpeta origen."""
    os.makedirs(ruta, exist_ok=True)
    archivos = []
    for i in range(1, n + 1):
        nombre = f"img_{i}.jpg"
        ruta_completa = os.path.join(ruta, nombre)
        img = generar_imagen_sintetica(i, TAMANO)
        img.save(ruta_completa)
        archivos.append(nombre)
    print(f"✅ Se generaron {n} imágenes en '{ruta}'")
    return archivos


def dividir_conjuntos(archivos, seed):
    """Divide los archivos en train / val / test usando sklearn."""
    # Primer split: separa test (15%) del resto (85%)
    resto, test = train_test_split(
        archivos, test_size=TEST_SIZE, random_state=seed
    )
    # Segundo split: del 85% restante, separa val (15/85 ≈ 17.65%)
    val_proporcional = VAL_SIZE / (TRAIN_SIZE + VAL_SIZE)
    train, val = train_test_split(
        resto, test_size=val_proporcional, random_state=seed
    )
    return train, val, test


def copiar_a_subconjuntos(train, val, test, ruta_base, ruta_result):
    """Crea carpetas train/val/test y copia las imágenes."""
    os.makedirs(ruta_result, exist_ok=True)
    for nombre_sub, lista in [("train", train), ("val", val), ("test", test)]:
        carpeta = os.path.join(ruta_result, nombre_sub)
        os.makedirs(carpeta, exist_ok=True)
        for archivo in lista:
            src = os.path.join(ruta_base, archivo)
            dst = os.path.join(carpeta, archivo)
            shutil.copy(src, dst)
    print(f"✅ Conjuntos creados en '{ruta_result}'")


def visualizar_distribucion(train, val, test):
    """Genera una gráfica de pastel y barras con la distribución."""
    etiquetas = ["Train", "Validación", "Test"]
    cantidades = [len(train), len(val), len(test)]
    colores = ["#4CAF50", "#FFC107", "#F44336"]

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12, 5))
    fig.suptitle("Distribución del Conjunto de Datos - VA 0777",
                 fontsize=14, fontweight="bold")

    # Pastel
    ax1.pie(cantidades, labels=etiquetas, colors=colores,
            autopct="%1.1f%%", startangle=90, textprops={"fontsize": 11})
    ax1.set_title("Proporción (%)")

    # Barras
    barras = ax2.bar(etiquetas, cantidades, color=colores, edgecolor="black")
    ax2.set_ylabel("Número de imágenes")
    ax2.set_title("Cantidad absoluta")
    for barra, cant in zip(barras, cantidades):
        ax2.text(barra.get_x() + barra.get_width()/2,
                 barra.get_height() + 0.3,
                 str(cant), ha="center", fontweight="bold")

    plt.tight_layout()
    ruta_img = os.path.join(RUTA_RESULT, "distribucion_conjuntos.png")
    plt.savefig(ruta_img, dpi=150, bbox_inches="tight")
    print(f"✅ Gráfica guardada en '{ruta_img}'")
    plt.show()


def mostrar_ejemplos(train, val, test, ruta_base):
    """Muestra 1 imagen de cada conjunto para verificar visualmente."""
    fig, ejes = plt.subplots(1, 3, figsize=(10, 4))
    titulos = [("Train", train[0]), ("Validación", val[0]), ("Test", test[0])]
    colores_tit = ["#4CAF50", "#FFC107", "#F44336"]

    for ax, (titulo, archivo), color in zip(ejes, titulos, colores_tit):
        img = Image.open(os.path.join(ruta_base, archivo))
        ax.imshow(img)
        ax.set_title(f"{titulo}\n{archivo}", color=color, fontweight="bold")
        ax.axis("off")

    plt.suptitle("Ejemplo de 1 imagen por conjunto", fontweight="bold")
    plt.tight_layout()
    ruta_img = os.path.join(RUTA_RESULT, "ejemplos_por_conjunto.png")
    plt.savefig(ruta_img, dpi=150, bbox_inches="tight")
    print(f"✅ Ejemplos guardados en '{ruta_img}'")
    plt.show()


# ================= FLUJO PRINCIPAL =================
def main():
    print("=" * 60)
    print("  P4 - CONJUNTOS DE DATOS EN VISIÓN ARTIFICIAL")
    print("=" * 60)

    # 1. Generar imágenes originales
    print("\n🔹 Paso 1: Generando imágenes sintéticas...")
    archivos = crear_dataset_original(RUTA_ORIGEN, TOTAL_IMAGENES)

    # 2. Dividir en conjuntos
    print("\n🔹 Paso 2: Dividiendo en train / val / test...")
    train, val, test = dividir_conjuntos(archivos, SEED)
    print(f"   • Train: {len(train)} imágenes ({TRAIN_SIZE*100:.0f}%)")
    print(f"   • Val:   {len(val)} imágenes  ({VAL_SIZE*100:.0f}%)")
    print(f"   • Test:  {len(test)} imágenes  ({TEST_SIZE*100:.0f}%)")

    # 3. Copiar a carpetas
    print("\n🔹 Paso 3: Copiando imágenes a sus subconjuntos...")
    copiar_a_subconjuntos(train, val, test, RUTA_ORIGEN, RUTA_RESULT)

    # 4. Visualizar
    print("\n🔹 Paso 4: Generando visualizaciones...")
    visualizar_distribucion(train, val, test)
    mostrar_ejemplos(train, val, test, RUTA_ORIGEN)

    print("\n🎉 ¡Práctica completada! Revisa la carpeta 'resultados-img-0777'")


if __name__ == "__main__":
    main()
```

---

## ▶️ Paso 8: Ejecutar el Programa

Dirígete a la carpeta del código y ejecuta el script:
```bash
cd codigopy-0777
python p4-conjunto-datos-va-0777.py
```

---

## 📈 Paso 9: Resultados Esperados

Al completar la ejecución correctamente:
1. 🖼️ **Generación:** 20 imágenes sintéticas creadas dentro de `img-original-0777/`.
2. ✂️ **División:** Clasificación automática de imágenes (**14 para Train**, **3 para Validation**, **3 para Test**).
3. 📁 **Organización:** Copiado automático de archivos a sus carpetas correspondientes en `resultados-img-0777/`.
4. 📊 **Gráficas:** Generación y guardado de los archivos gráficos:
   * 🥧 `distribucion_conjuntos.png` (Gráfica de pastel + barras).
   * 🖼️ `ejemplos_por_conjunto.png` (Muestra visual representativa).

---

## 🧩 Paso 10: Reto de Reflexión Guiada

Responde en tu libreta o reporte de laboratorio:
* ❓ **1.** ¿Por qué el conjunto de **prueba (`test`)** es cuantitativamente menor que el de entrenamiento (`train`)?
* ❓ **2.** ¿Qué consecuencias tendría entrenar y evaluar el modelo utilizando exactamente el mismo conjunto de datos?
* ❓ **3.** ¿Qué función cumple la **semilla de aleatoriedad** (`random_state=777`) en proyectos colaborativos?
* ❓ **4.** Si tu dataset tuviera **1,000,000 de imágenes**, ¿mantendrías la proporción 70/15/15 o usarías otra? Justifica tu respuesta.

---

## 📝 Tarea Preparatoria (Próxima Clase)

🔎 **Investigación:**
* Busca información sobre qué es un **dataset etiquetado** comercial o académico (ejemplos: *CIFAR-10*, *ImageNet*, *COCO*).
* Prepara un ejemplo de la vida real donde la separación `train/val/test` sea crítica (ejemplo: diagnóstico médico en radiografías, vehículos autónomos o detección de fraudes).

---

¡Excelente trabajo! Con este laboratorio has dominado la estructura básica de preparación de datos utilizada por los ingenieros de IA en la industria. 🚀🤖