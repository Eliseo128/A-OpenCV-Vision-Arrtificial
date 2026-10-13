# Práctica de Visión Artificial: Transformación de imágenes con Python y OpenCV

![Gato de ejemplo]([img-original-0777/img-gato-0777.jpg](https://raw.githubusercontent.com/Eliseo128/A-OpenCV-Vision-Arrtificial/refs/heads/main/img-gato-0777.jpg))

**Nivel:** Tercer semestre de preparatoria\
**Carpeta del proyecto:** `exa-va-0777`\
**Archivo principal:** `codigo-va-0777.py`\
**Bibliotecas:** OpenCV y Pandas

## Objetivo de la práctica

Aprender a leer una imagen, visualizarla, rotarla 90° y 45°,
redimensionarla a 600 × 500 píxeles, dibujar un rectángulo rojo y
guardar las imágenes procesadas en una carpeta de resultados utilizando
Python, Visual Studio Code y OpenCV.

**Nota técnica:** Pandas se instalará porque forma parte de las
instrucciones, aunque no es necesario para transformar imágenes. Para
estas operaciones utilizaremos `opencv-python` (`cv2`) y `numpy`.

## 1. Crear la carpeta de trabajo

En Windows, realiza los siguientes pasos:

1.  Abre el Explorador de archivos.
2.  Selecciona la ubicación donde guardarás tus prácticas, por ejemplo,
    `Documentos`.
3.  Crea una carpeta con el nombre exacto `exa-va-0777`.

La ruta de ejemplo será:

``` text
C:\\Users\\TU_USUARIO\\Documents\\exa-va-0777
```

`TU_USUARIO` representa el nombre de tu cuenta de Windows. No escribas
literalmente ese texto; utiliza tu ruta real.

## 2. Abrir la carpeta con Visual Studio Code

1.  Abre Visual Studio Code.
2.  En el menú superior, selecciona **Archivo → Abrir carpeta** (*File →
    Open Folder*).
3.  Busca y selecciona `exa-va-0777`.
4.  Pulsa **Seleccionar carpeta** y acepta la confianza en la carpeta si
    VS Code te lo solicita.

## 3. Abrir la terminal integrada de VS Code

1.  En el menú superior, selecciona **Terminal → Nueva terminal**.
2.  Aparecerá una terminal en la parte inferior de VS Code.
3.  Comprueba que la ruta actual termine en `exa-va-0777`.

Ejecuta:

``` powershell
Get-Location
```

El resultado debe mostrar la ruta de la carpeta del proyecto. Si aparece
otra ruta, cambia a la carpeta correcta antes de continuar.

## 4. Crear el entorno virtual `.venv-exa-0777`

En la terminal de VS Code, ejecuta:

``` powershell
py -m venv .venv-exa-0777
```

**¿Qué hace este comando?**

-   `py`: ejecuta Python en Windows.
-   `-m venv`: crea un entorno virtual.
-   `.venv-exa-0777`: nombre del entorno que utilizará esta práctica.

Si `py` no está reconocido, comprueba la instalación de Python con
`python --version` y utiliza `python -m venv .venv-exa-0777` si
funciona.

## 5. Activar el entorno virtual

Ejecuta en la terminal PowerShell:

``` powershell
.\\.venv-exa-0777\\Scripts\\Activate.ps1
```

Cuando se active correctamente, la terminal mostrará un prefijo similar
a este:

``` text
(.venv-exa-0777) PS C:\\...\\exa-va-0777>
```

Si PowerShell bloquea la ejecución del archivo de activación, puedes
activar el entorno desde una terminal CMD con:

``` bat
.venv-exa-0777\\Scripts\\activate.bat
```

No necesitas crear otro entorno virtual si el anterior ya está
funcionando.

## 6. Instalar Pandas desde la terminal de VS Code

Verifica primero que el entorno virtual esté activado. Después ejecuta
los siguientes comandos, uno por uno.

**Instalar Pandas:**

``` powershell
python -m pip install pandas
```

**Instalar OpenCV:**

``` powershell
python -m pip install opencv-python
```

**Instalar NumPy:**

``` powershell
python -m pip install numpy
```

Verifica que las bibliotecas se hayan instalado correctamente:

``` powershell
python -m pip list
```

Para comprobarlas mediante Python, ejecuta:

``` powershell
python -c "import cv2, numpy, pandas; print('OpenCV:', cv2.__version__); print('NumPy:', numpy.__version__); print('Pandas:', pandas.__version__)"
```

Si aparecen las tres versiones, las bibliotecas están disponibles.

## 7. Crear la estructura de carpetas y archivos

En la terminal de VS Code, asegúrate de estar en la carpeta
`exa-va-0777` y ejecuta:

``` powershell
New-Item -ItemType Directory -Force -Path "img-original-0777"
New-Item -ItemType Directory -Force -Path "codigopy-0777"
New-Item -ItemType Directory -Force -Path "resultados-img-0777"
New-Item -ItemType File -Force -Path "codigopy-0777\\codigo-va-0777.py"
```

La estructura final será la siguiente:

``` text
exa-va-0777/
├── .venv-exa-0777/
├── img-original-0777/
│   └── img-gato-0777.jpg
├── codigopy-0777/
│   └── codigo-va-0777.py
└── resultados-img-0777/
```

## 8. Colocar la imagen original

1.  Utiliza la imagen del gato proporcionada para esta práctica.
2.  Copia la imagen dentro de `img-original-0777`.
3.  Cambia su nombre a `img-gato-0777.jpg`, si es necesario.
4.  Comprueba que el archivo tenga realmente esa extensión.

La ruta relativa de la imagen será:

``` text
img-original-0777/img-gato-0777.jpg
```

Si tu imagen original es PNG, conserva el formato y cambia la ruta del
código a `img-gato-0777.png`. No basta con cambiar el nombre de la
extensión para convertir el formato de imagen.

## 9. Seleccionar el intérprete de Python

Antes de ejecutar el programa:

1.  Abre `codigo-va-0777.py` en VS Code.
2.  Presiona `Ctrl + Shift + P`.
3.  Escribe `Python: Select Interpreter`.
4.  Selecciona el intérprete ubicado en:

``` text
.venv-exa-0777\\Scripts\\python.exe
```

Esto permite que VS Code utilice las bibliotecas instaladas en el
entorno virtual de la práctica.

## 10. Escribir el código en `codigo-va-0777.py`

Abre el archivo `codigopy-0777/codigo-va-0777.py` y copia el siguiente
programa completo.

El programa utiliza la imagen original, crea cuatro transformaciones,
muestra cinco ventanas y guarda los resultados en la carpeta
correspondiente.

``` python
# Eliseo Nava NC= 0777

import cv2
from pathlib import Path

# 1. Definir las rutas de trabajo
carpeta_proyecto = Path(__file__).resolve().parent.parent

ruta_original = (
    carpeta_proyecto
    / "img-original-0777"
    / "img-gato-0777.jpg"
)

carpeta_resultados = (
    carpeta_proyecto / "resultados-img-0777"
)

# Crear la carpeta de resultados si no existe
carpeta_resultados.mkdir(parents=True, exist_ok=True)

# 2. Leer la imagen original con imread
img0777 = cv2.imread(str(ruta_original))

# Comprobar que la imagen se haya leído correctamente
if img0777 is None:
    raise FileNotFoundError(
        f"No se pudo leer la imagen: {ruta_original}"
    )

# 3. Rotar la imagen 90 grados en sentido horario
img90_0777 = cv2.rotate(
    img0777, cv2.ROTATE_90_CLOCKWISE
)

# 4. Rotar la imagen 45 grados
alto, ancho = img0777.shape[:2]

centro = (ancho // 2, alto // 2)

matriz_rotacion = cv2.getRotationMatrix2D(
    centro, 45, 1.0
)

img45_0777 = cv2.warpAffine(
    img0777,
    matriz_rotacion,
    (ancho, alto)
)

# 5. Redimensionar a 600 píxeles de ancho
# y 500 píxeles de alto
img600x500_0777 = cv2.resize(
    img0777, (600, 500)
)

# 6. Dibujar un rectángulo rojo de 100 x 200
# píxeles sobre una copia de la imagen original
img_rojo_0777 = img0777.copy()

x1, y1 = 50, 50
x2, y2 = x1 + 100, y1 + 200

cv2.rectangle(
    img_rojo_0777,
    (x1, y1),
    (x2, y2),
    (0, 0, 255),
    3
)

# 7. Mostrar las cinco imágenes con sus títulos
cv2.imshow("gato original 0777", img0777)

cv2.imshow("gato 90 0777", img90_0777)

cv2.imshow("gato 45 0777", img45_0777)

cv2.imshow(
    "gato 600x500 0777",
    img600x500_0777
)

cv2.imshow("gato rojo 0777", img_rojo_0777)

# 8. Guardar las cuatro imágenes procesadas
cv2.imwrite(
    str(carpeta_resultados / "img-gato1-0777.jpg"),
    img90_0777
)

cv2.imwrite(
    str(carpeta_resultados / "img-gato2-0777.jpg"),
    img45_0777
)

cv2.imwrite(
    str(carpeta_resultados / "img-gato3-0777.jpg"),
    img600x500_0777
)

cv2.imwrite(
    str(carpeta_resultados / "img-gato4-0777.jpg"),
    img_rojo_0777
)

# 9. Esperar una tecla y cerrar las ventanas
print("Imágenes procesadas y guardadas.")
print("Presiona una tecla en las ventanas para finalizar.")

cv2.waitKey(0)
cv2.destroyAllWindows()
```

## 11. Explicación didáctica de las instrucciones principales

  -----------------------------------------------------------------------
  Instrucción                         ¿Qué hace?
  ----------------------------------- -----------------------------------
  `cv2.imread()`                      Lee la imagen desde el archivo.

  `cv2.rotate()`                      Rota la imagen 90° en sentido
                                      horario.

  `cv2.getRotationMatrix2D()`         Calcula la matriz de rotación para
                                      45°.

  `cv2.warpAffine()`                  Aplica la rotación a los píxeles de
                                      la imagen.

  `cv2.resize()`                      Cambia el tamaño a 600 × 500
                                      píxeles.

  `img0777.copy()`                    Crea una copia para no modificar la
                                      imagen original.

  `cv2.rectangle()`                   Dibuja el rectángulo rojo.

  `cv2.imshow()`                      Muestra la imagen en una ventana.

  `cv2.imwrite()`                     Guarda la imagen procesada en un
                                      archivo.

  `cv2.waitKey(0)`                    Espera hasta que se presione una
                                      tecla.
  -----------------------------------------------------------------------

### ¿Cómo se define el rectángulo rojo?

``` python
cv2.rectangle(
    img_rojo_0777,
    (50, 50),
    (150, 250),
    (0, 0, 255),
    3
)
```

-   `(50, 50)`: coordenadas de la esquina superior izquierda.
-   `(150, 250)`: coordenadas de la esquina inferior derecha.
-   `(0, 0, 255)`: color rojo en formato BGR de OpenCV.
-   `3`: grosor del borde en píxeles.

El rectángulo mide 100 píxeles de ancho y 200 de alto, con un borde de 3
píxeles. Si se encuentra cerca del borde de la imagen, una parte podría
quedar fuera del área visible.

## 12. Ejecutar el programa desde la terminal

En VS Code, abre la terminal y verifica que esté activado
`.venv-exa-0777`. Ejecuta:

``` powershell
python .\\codigopy-0777\\codigo-va-0777.py
```

Deben aparecer cinco ventanas con estos títulos:

1.  **gato original 0777** --- Imagen original sin transformaciones.
2.  **gato 90 0777** --- Imagen girada 90° en sentido horario.
3.  **gato 45 0777** --- Imagen girada 45°. Puede recortarse parte de la
    imagen.
4.  **gato 600x500 0777** --- Imagen con ancho de 600 y alto de 500
    píxeles.
5.  **gato rojo 0777** --- Imagen original con un rectángulo de borde
    rojo.

Para cerrar las ventanas, selecciona una de ellas y presiona una tecla.
El programa cerrará todas las ventanas abiertas.

## 13. Verificar las imágenes guardadas

Al terminar, abre la carpeta `resultados-img-0777`. Debe contener estos
cuatro archivos:

  Archivo                Contenido
  ---------------------- ------------------------------------
  `img-gato1-0777.jpg`   Imagen rotada 90°.
  `img-gato2-0777.jpg`   Imagen rotada 45°.
  `img-gato3-0777.jpg`   Imagen redimensionada a 600 × 500.
  `img-gato4-0777.jpg`   Imagen con el rectángulo rojo.

La imagen original se muestra en pantalla, pero no se guarda nuevamente,
porque se solicitó guardar cuatro imágenes procesadas.

## 14. Solución de problemas frecuentes

-   **No se puede leer la imagen:** verifica que el archivo esté dentro
    de `img-original-0777` y que el nombre y la extensión coincidan con
    la ruta del código.
-   **`ModuleNotFoundError: No module named 'cv2'`:** activa
    `.venv-exa-0777` e instala `opencv-python` dentro de ese entorno.
-   **No aparecen las ventanas:** ejecuta el programa desde una sesión
    de escritorio de Windows y comprueba que OpenCV se haya instalado
    correctamente.
-   **No aparecen los archivos guardados:** revisa la terminal en busca
    de errores y comprueba la ruta `resultados-img-0777`.

## Resultado de aprendizaje esperado

El estudiante identifica las operaciones básicas de lectura, rotación,
redimensionamiento, dibujo y escritura de imágenes mediante OpenCV, y
organiza correctamente los archivos de una práctica de visión
artificial.
