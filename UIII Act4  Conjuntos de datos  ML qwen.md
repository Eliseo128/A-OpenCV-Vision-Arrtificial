# 🎓 Clase: Conjuntos de Datos para Visión Artificial
**Unidad 3 | Práctica 4 | Clave 0777**
**Nivel:** 3er semestre de preparatoria — Especialidad en IA

---

## 🎯 Objetivo de la sesión

Al finalizar esta práctica, los estudiantes serán capaces de:
1. Comprender qué son los conjuntos de **entrenamiento**, **validación** y **prueba**.
2. Dividir un conjunto de imágenes en estos tres subconjuntos usando Python.
3. Visualizar la distribución de los datos de forma gráfica y atractiva.

---

## 🧠 Conceptos clave (5 min)

Imagina que estás preparando a un estudiante para un examen:

| Conjunto | Analogía | Propósito en VA |
|----------|----------|-----------------|
| **Entrenamiento (train)** | El libro de texto | El modelo *aprende* patrones (70%) |
| **Validación (val)** | Exámenes de práctica | Ajustamos hiperparámetros (15%) |
| **Prueba (test)** | Examen final real | Evaluamos el desempeño real (15%) |

> 💡 **Regla de oro:** ¡Nunca mezclar el conjunto de prueba con el de entrenamiento, o el modelo "memorizará" en lugar de "aprender"!

---

## 🛠️ Paso a paso desde la terminal de VS Code

### 📌 Paso 1 — Abrir VS Code y crear la carpeta de trabajo
```bash
mkdir u3-p4-conjunto-datos-0777
cd u3-p4-conjunto-datos-0777
```

### 📌 Paso 2 — Crear la estructura de carpetas
```bash
mkdir img-original-0777
mkdir codigopy-0777
mkdir resultados-img-0777
```

### 📌 Paso 3 — Crear el entorno virtual
```bash
python -m venv .env-va-0777
```

### 📌 Paso 4 — Activar el entorno virtual
**En Windows (PowerShell):**
```bash
.env-va-0777\Scripts\Activate.ps1
```
**En Windows (CMD):**
```bash
.env-va-0777\Scripts\activate.bat
```
**En Linux/Mac:**
```bash
source .env-va-0777/bin/activate
```
> ✅ Deberías ver `(.env-va-0777)` al inicio de tu terminal.

### 📌 Paso 5 — Crear el archivo `requirements.txt`
Dentro de `codigopy-0777`, crea un archivo llamado **`requirements.txt`** con este contenido:
```txt
numpy==1.26.4
pillow==10.3.0
matplotlib==3.8.4
scikit-learn==1.4.2
opencv-python==4.9.0.80
```

### 📌 Paso 6 — Instalar las librerías
```bash
pip install -r codigopy-0777/requirements.txt
```

---

## 📁 Estructura final del proyecto
```
u3-p4-conjunto-datos-0777/
├── .env-va-0777/              ← entorno virtual
├── img-original-0777/         ← imágenes originales (se generan automáticamente)
├── codigopy-0777/
│   ├── requirements.txt
│   └── p4-conjunto-datos-va-0777.py
└── resultados-img-0777/       ← se llena al ejecutar el script
```

---

## 💻 Paso 7 — Código fuente: `p4-conjunto-datos-va-0777.py`

Copia este código dentro de `codigopy-0777/p4-conjunto-datos-va-0777.py`:

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

## ▶️ Paso 8 — Ejecutar el programa
```bash
cd codigopy-0777
python p4-conjunto-datos-va-0777.py
```

---

## 📊 Paso 9 — Resultados esperados

Al ejecutar, el script:
1. ✅ Genera **20 imágenes sintéticas** en `img-original-0777/` (con números y círculos).
2. ✅ Las divide automáticamente: **14 train / 3 val / 3 test**.
3. ✅ Copia cada imagen a su carpeta correspondiente dentro de `resultados-img-0777/`.
4. ✅ Muestra y guarda dos gráficas:
   - `distribucion_conjuntos.png` → pastel + barras.
   - `ejemplos_por_conjunto.png` → 1 imagen representativa de cada conjunto.

---

## 🧩 Paso 10 — Reflexión guiada (preguntas para el estudiante)

1. 🔎 ¿Por qué el conjunto de **prueba** es más pequeño que el de entrenamiento?
2. 🔎 ¿Qué pasaría si usáramos las mismas imágenes para entrenar y para probar?
3. 🔎 ¿Por qué usamos una **semilla** (`random_state=777`) al dividir?
4. 🔎 ¿Cómo cambiarías las proporciones si tuvieras 10,000 imágenes en lugar de 20?

---

## 📝 Tarea para la próxima clase

Investiga qué es un **dataset etiquetado** (como CIFAR-10 o ImageNet) y trae un ejemplo de una aplicación real donde se use la división train/val/test (ej: detección de enfermedades en radiografías, reconocimiento facial, autos autónomos, etc.).

---

¡Listo! Con esta práctica tus estudiantes comprenden **de forma visual, práctica y divertida** uno de los pilares fundamentales de la visión artificial. 🚀🤖
