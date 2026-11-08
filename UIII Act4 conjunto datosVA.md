¡Hola, futuros ingenieros e ingenieras en Inteligencia Artificial! 🚀

Hoy nos pondremos las botas de trabajo en la terminal para aprender un pilar fundamental en **Visión Artificial**: cómo organizar nuestros datos para entrenar y evaluar modelos sin trampas.

Cuando trabajamos en inteligencia artificial, nunca debemos evaluar a nuestro modelo con las mismas imágenes con las que aprendió. Por eso dividimos nuestros datos en tres grandes grupos:

* **Entrenamiento (Training, 70%):** El "libro de texto" con el que la IA aprende patrones.
* **Validación (Validation, 15%):** Los "exámenes parciales" para ajustar el modelo sin sesgarlo.
* **Prueba (Test, 15%):** El "examen final" con datos totalmente nuevos para medir el desempeño real.

---

## Estrategia: Aprendizaje Basado en Ejemplos

En este ejercicio programaremos una herramienta automatizada que toma una colección de imágenes y las clasifica en estas tres carpetas de forma aleatoria y proporcional.

### Estructura del proyecto

Al finalizar el procedimiento, nuestro proyecto quedará estructurado de la siguiente manera:

```text
u3-p4-conjunto-datos-0777/
├── .env-va-0777/
├── img-original-0777/
│   ├── img_1.jpg
│   ├── img_2.jpg
│   ├── img_3.jpg
│   ├── img_4.jpg
│   └── img_5.jpg
├── codigopy-0777/
│   └── p4-conjunto-datos-va-0777.py
├── resultados-img-0777/      <-- (Se genera automáticamente al ejecutar el código)
│   ├── train/
│   ├── val/
│   └── test/
└── requirements.txt

```

---

## Secuencia Didáctica Paso a Paso

1. **Paso 1: Creación de la carpeta de trabajo:** Terminal de VS Code.
Abre tu terminal integrada en VS Code (`Ctrl + ~` o `Cmd + ~`) y crea la carpeta del proyecto. Luego accede a ella:

```bash
mkdir u3-p4-conjunto-datos-0777
cd u3-p4-conjunto-datos-0777

```


2. **Paso 2: Creación y activación del entorno virtual:** Aislamiento de dependencias.
Creamos el entorno virtual `.env-va-0777` para mantener limpias nuestras librerías y lo activamos según tu sistema operativo.

**En Windows (PowerShell):**

```powershell
python -m venv .env-va-0777
.\.env-va-0777\Scripts\activate

```

**En Linux / macOS:**

```bash
python3 -m venv .env-va-0777
source .env-va-0777/bin/activate

```


3. **Paso 3: Creación del archivo de requerimientos e instalación:** Librerías de Visión y Procesamiento.
Crea el archivo `requirements.txt` en la raíz de la carpeta de trabajo e incluye las siguientes librerías:

```text
opencv-python
numpy
pillow

```

Instala las librerías desde la terminal ejecutando:

```bash
pip install -r requirements.txt

```


4. **Paso 4: Creación de la estructura de carpetas e imágenes iniciales:** Preparación de insumos.
Genera las carpetas de origen del proyecto ejecutando:

```bash
mkdir img-original-0777 codigopy-0777

```

Para asegurar un ejemplo **100% funcional sin salir de la terminal**, crearemos 5 imágenes sintéticas de prueba dentro de `img-original-0777` usando un script rápido de Python:

```bash
python -c "
from PIL import Image, ImageDraw
import os

colores = ['red', 'blue', 'green', 'yellow', 'purple']
for i, color in enumerate(colores, 1):
    img = Image.new('RGB', (200, 200), color=color)
    draw = ImageDraw.Draw(img)
    draw.text((20, 90), f'Imagen {i}', fill='white')
    img.save(f'img-original-0777/img_{i}.jpg')
print('✅ Imágenes de prueba creadas exitosamente.')
"

```


5. **Paso 5: Creación y desarrollo del código Python:** Procesamiento y división de datasets.
Crea el archivo `p4-conjunto-datos-va-0777.py` dentro de la carpeta `codigopy-0777` y pega el siguiente código estructurado:

```python
import os
import cv2
import random
import shutil

def preparar_dataset():
    # 1. Definir rutas del proyecto
    ruta_origen = "img-original-0777"
    ruta_destino = "resultados-img-0777"
    
    subconjuntos = ['train', 'val', 'test']
    
    # 2. Crear carpetas de resultados automáticamente
    for sub in subconjuntos:
        os.makedirs(os.path.join(ruta_destino, sub), exist_ok=True)
        
    # 3. Obtener lista de imágenes
    imagenes = [f for f in os.listdir(ruta_origen) if f.endswith(('.jpg', '.png'))]
    random.shuffle(imagenes)  # Mezclar aleatoriamente para evitar sesgos
    
    total = len(imagenes)
    print(f"📊 Total de imágenes encontradas: {total}")
    
    # 4. Calcular proporciones (70% train, 15% val, 15% test)
    num_train = max(1, int(total * 0.70))
    num_val = max(1, int(total * 0.15))
    
    train_files = imagenes[:num_train]
    val_files = imagenes[num_train:num_train + num_val]
    test_files = imagenes[num_train + num_val:]
    
    divisiones = {
        'train': train_files,
        'val': val_files,
        'test': test_files
    }
    
    # 5. Procesar y organizar imágenes con OpenCV
    for sub, lista_archivos in divisiones.items():
        print(f"\n📂 Procesando conjunto [{sub.upper()}] ({len(lista_archivos)} archivos):")
        for archivo in lista_archivos:
            path_in = os.path.join(ruta_origen, archivo)
            path_out = os.path.join(ruta_destino, sub, archivo)
            
            # Carga de la imagen mediante OpenCV
            img = cv2.imread(path_in)
            
            if img is not None:
                # Guardar la imagen en el subconjunto correspondiente
                cv2.imwrite(path_out, img)
                print(f"   └─ Copiado {archivo} -> {ruta_destino}/{sub}/")
            else:
                print(f"   ⚠️ Error al leer {archivo}")

    print("\n✅ Division del dataset completada con éxito.")

if __name__ == "__main__":
    preparar_dataset()

```


6. **Paso 6: Ejecución del script y verificación:** Resultado final.
Desde la raíz del proyecto, ejecuta el código script con el entorno virtual activo:

```bash
python codigopy-0777/p4-conjunto-datos-va-0777.py

```

Verás en la consola la clasificación de tus imágenes y la creación automática de la estructura `resultados-img-0777/` dividida en `train/`, `val/` y `test/`.


---
