# Práctica 14 — Detección de líneas, esquinas y características visuales

**Materia:** Soluciona problemas de Visión Artificial
**Semestre:** 3.º de preparatoria
**Duración:** 2 horas
**Modalidad:** Práctica supervisada
**Carpeta:** `p10-act14-0777`
**Entorno virtual:** `.env-filtro-0777`
**Bibliotecas:** OpenCV y NumPy

## Propósito

El estudiante experimentará con técnicas básicas de OpenCV para detectar:

* **Líneas** mediante la Transformada de Hough.
* **Esquinas** mediante el detector Harris.
* Características visuales presentes en imágenes.
* Diferentes formas de interpretar una imagen mediante sus características.

Se realizarán **2 ejemplos totalmente funcionales**, paso a paso.

---

# 1. Crear la carpeta de trabajo

Abra **Visual Studio Code**.

Seleccione:

**Terminal → New Terminal**

Ejecute:

```powershell
mkdir p10-act14-0777
```

Entre en la carpeta:

```powershell
cd p10-act14-0777
```

Compruebe la ubicación:

```powershell
pwd
```

La terminal deberá estar dentro de:

```text
p10-act14-0777
```

---

# 2. Crear el entorno virtual

Desde la terminal de VS Code:

```powershell
python -m venv .env-filtro-0777
```

Se creará:

```text
p10-act14-0777/
└── .env-filtro-0777/
```

---

# 3. Activar el entorno virtual

Ejecute:

```powershell
.env-filtro-0777\Scripts\Activate.ps1
```

La terminal deberá mostrar:

```text
(.env-filtro-0777)
```

Por ejemplo:

```text
(.env-filtro-0777) PS C:\Users\Usuario\p10-act14-0777>
```

### Si aparece un error relacionado con permisos

Ejecute:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Después vuelva a activar:

```powershell
.env-filtro-0777\Scripts\Activate.ps1
```

---

# 4. Seleccionar Python en VS Code

Presione:

```text
Ctrl + Shift + P
```

Escriba:

```text
Python: Select Interpreter
```

Seleccione:

```text
.env-filtro-0777\Scripts\python.exe
```

---

# 5. Actualizar pip

Con el entorno activado:

```powershell
python -m pip install --upgrade pip
```

---

# 6. Instalar las bibliotecas

Para esta práctica utilizaremos:

### OpenCV

```powershell
pip install opencv-python
```

### NumPy

```powershell
pip install numpy
```

---

# 7. Verificar la instalación

Verifique OpenCV:

```powershell
python -c "import cv2; print('OpenCV:', cv2.__version__)"
```

Verifique NumPy:

```powershell
python -c "import numpy; print('NumPy:', numpy.__version__)"
```

Si aparecen las versiones, las bibliotecas están correctamente instaladas.

---

# 8. Crear el archivo de requerimientos

Ejecute:

```powershell
pip freeze > requirements.txt
```

---

# 9. Crear las carpetas del proyecto

Ejecute:

```powershell
mkdir imagenes
mkdir resultados
mkdir codigo
```

La estructura será:

```text
p10-act14-0777/
│
├── .env-filtro-0777/
├── imagenes/
├── resultados/
├── codigo/
└── requirements.txt
```

---

# 10. Preparar la imagen

Para los ejemplos utilizaremos una imagen llamada:

```text
lineas_esquinas.jpg
```

Colóquela dentro de:

```text
imagenes/
```

La estructura será:

```text
p10-act14-0777/
│
├── imagenes/
│   └── lineas_esquinas.jpg
│
├── resultados/
├── codigo/
├── .env-filtro-0777/
└── requirements.txt
```

Puede utilizar una fotografía que contenga **edificios, ventanas, calles, objetos rectangulares o figuras geométricas**, porque tendrá líneas y esquinas fáciles de observar.

---

# EJEMPLO 1 — Detección de líneas

## Objetivo

Detectar líneas presentes en una imagen utilizando la **Transformada de Hough**.

OpenCV proporciona:

```python
cv2.HoughLinesP()
```

Esta técnica permite detectar segmentos de línea a partir de una imagen donde previamente se han detectado bordes.

### Proceso

```text
Imagen
   ↓
Escala de grises
   ↓
Detección de bordes
   ↓
Transformada de Hough
   ↓
Líneas detectadas
```

---

## Paso 1. Crear el archivo

Dentro de:

```text
codigo/
```

cree:

```text
ejemplo1_lineas.py
```

---

## Paso 2. Escribir el código

```python
import cv2
import numpy as np

# Cargar imagen
imagen = cv2.imread("../imagenes/lineas_esquinas.jpg")

# Verificar que la imagen exista
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Convertir a escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Detectar bordes
bordes = cv2.Canny(gris, 50, 150)

# Detectar líneas mediante Hough
lineas = cv2.HoughLinesP(
    bordes,
    1,
    np.pi / 180,
    threshold=50,
    minLineLength=50,
    maxLineGap=10
)

# Crear copia de la imagen
resultado = imagen.copy()

# Dibujar líneas
if lineas is not None:

    for linea in lineas:

        x1, y1, x2, y2 = linea[0]

        cv2.line(
            resultado,
            (x1, y1),
            (x2, y2),
            (0, 0, 255),
            2
        )

# Mostrar resultados
cv2.imshow("Imagen original", imagen)
cv2.imshow("Bordes", bordes)
cv2.imshow("Lineas detectadas", resultado)

# Guardar resultado
cv2.imwrite(
    "../resultados/ejemplo1_lineas.jpg",
    resultado
)

print("Deteccion de lineas terminada.")

if lineas is not None:
    print("Cantidad de segmentos detectados:", len(lineas))
else:
    print("No se detectaron lineas.")

print("Resultado guardado en:")
print("../resultados/ejemplo1_lineas.jpg")

# Esperar una tecla
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

# 11. Ejecutar el ejemplo 1

En la terminal de VS Code:

```powershell
python codigo\ejemplo1_lineas.py
```

Se mostrarán tres ventanas:

```text
Imagen original
Bordes
Lineas detectadas
```

El resultado se almacenará en:

```text
resultados/ejemplo1_lineas.jpg
```

La terminal mostrará algo similar a:

```text
Deteccion de lineas terminada.
Cantidad de segmentos detectados: 25
Resultado guardado en:
../resultados/ejemplo1_lineas.jpg
```

El número de líneas dependerá de la imagen utilizada.

---

# 12. Experimentar con la detección de líneas

Busque esta parte:

```python
lineas = cv2.HoughLinesP(
    bordes,
    1,
    np.pi / 180,
    threshold=50,
    minLineLength=50,
    maxLineGap=10
)
```

Modifique:

```python
threshold=50
```

por:

```python
threshold=100
```

Ejecute nuevamente:

```powershell
python codigo\ejemplo1_lineas.py
```

Después pruebe:

```python
minLineLength=100
```

### Preguntas para el estudiante

1. ¿Aumentó o disminuyó la cantidad de líneas?
2. ¿Qué ocurre cuando `threshold` aumenta?
3. ¿Qué ocurre cuando aumenta `minLineLength`?
4. ¿En qué objetos de la imagen se detectaron más líneas?

---

# EJEMPLO 2 — Detección de esquinas con Harris

## Objetivo

Detectar **esquinas** o puntos donde existe un cambio importante de dirección en una imagen.

Ejemplos de esquinas:

```text
┌──────
│
│
```

Las esquinas pueden encontrarse en:

* Edificios.
* Ventanas.
* Muebles.
* Señales.
* Objetos geométricos.
* Intersecciones de líneas.

Para este ejercicio utilizaremos el detector:

```python
cv2.cornerHarris()
```

---

# 13. Crear el archivo

En:

```text
codigo/
```

cree:

```text
ejemplo2_esquinas.py
```

---

# 14. Código completo

```python
import cv2
import numpy as np

# Cargar imagen
imagen = cv2.imread("../imagenes/lineas_esquinas.jpg")

# Verificar que la imagen exista
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Convertir a escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Convertir a tipo float32
gris_float = np.float32(gris)

# Detectar esquinas mediante Harris
esquinas = cv2.cornerHarris(
    gris_float,
    2,
    3,
    0.04
)

# Dilatar para hacer visibles las esquinas
esquinas = cv2.dilate(
    esquinas,
    None
)

# Crear copia
resultado = imagen.copy()

# Umbral para identificar esquinas
umbral = 0.01 * esquinas.max()

# Marcar esquinas
resultado[esquinas > umbral] = [0, 0, 255]

# Mostrar resultados
cv2.imshow(
    "Imagen original",
    imagen
)

cv2.imshow(
    "Esquinas detectadas",
    resultado
)

# Guardar resultado
cv2.imwrite(
    "../resultados/ejemplo2_esquinas.jpg",
    resultado
)

# Contar esquinas aproximadas
cantidad_esquinas = np.sum(
    esquinas > umbral
)

print("Deteccion de esquinas terminada.")
print("Cantidad aproximada de puntos detectados:",
      cantidad_esquinas)

print("Resultado guardado en:")
print("../resultados/ejemplo2_esquinas.jpg")

# Esperar una tecla
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

# 15. Ejecutar el ejemplo 2

Desde la terminal:

```powershell
python codigo\ejemplo2_esquinas.py
```

Se mostrarán:

```text
Imagen original
Esquinas detectadas
```

El resultado se guardará en:

```text
resultados/ejemplo2_esquinas.jpg
```

Las esquinas detectadas aparecerán marcadas en la imagen.

---

# 16. Experimentar con el detector Harris

Busque:

```python
umbral = 0.01 * esquinas.max()
```

Pruebe:

```python
umbral = 0.02 * esquinas.max()
```

Después:

```python
umbral = 0.05 * esquinas.max()
```

Ejecute cada vez:

```powershell
python codigo\ejemplo2_esquinas.py
```

Compare los resultados.

### Preguntas para el estudiante

1. ¿Con qué valor aparecen más esquinas?
2. ¿Con qué valor aparecen menos puntos?
3. ¿Todas las esquinas detectadas corresponden realmente a esquinas visibles?
4. ¿Qué ocurre cuando la imagen tiene mucha textura?

---

# 17. ¿Qué son las características visuales?

Una **característica visual** es una propiedad de una imagen que puede utilizarse para describir o identificar una región u objeto.

En esta práctica se observaron principalmente:

| Característica | Ejemplo                            |
| -------------- | ---------------------------------- |
| Líneas         | Bordes de una ventana              |
| Esquinas       | Esquina de una mesa                |
| Bordes         | Contorno de un objeto              |
| Forma          | Rectángulo, triángulo, círculo     |
| Textura        | Superficie de madera, pared o tela |

Podemos representar el análisis de una imagen así:

```text
                 IMAGEN
                    │
        ┌───────────┼───────────┐
        │           │           │
        ▼           ▼           ▼
      Líneas     Esquinas     Texturas
        │           │           │
        └───────────┼───────────┘
                    ▼
          Características
              visuales
                    │
                    ▼
           Identificación
             de objetos
```

---

# 18. Comparación de los dos ejemplos

| Aspecto           | Ejemplo 1                      | Ejemplo 2                  |
| ----------------- | ------------------------------ | -------------------------- |
| Característica    | Líneas                         | Esquinas                   |
| Técnica           | Transformada de Hough          | Harris                     |
| Función principal | `cv2.HoughLinesP()`            | `cv2.cornerHarris()`       |
| Entrada           | Bordes                         | Imagen en escala de grises |
| Resultado         | Segmentos de línea             | Puntos de esquina          |
| Aplicación        | Carreteras, edificios, objetos | Ventanas, esquinas, formas |

---

# 19. Estructura final del proyecto

Al finalizar deberá tener:

```text
p10-act14-0777/
│
├── .env-filtro-0777/
│   ├── Scripts/
│   ├── Lib/
│   └── ...
│
├── imagenes/
│   └── lineas_esquinas.jpg
│
├── resultados/
│   ├── ejemplo1_lineas.jpg
│   └── ejemplo2_esquinas.jpg
│
├── codigo/
│   ├── ejemplo1_lineas.py
│   └── ejemplo2_esquinas.py
│
└── requirements.txt
```

---

# 20. Documentación de resultados

Como parte de la práctica supervisada, cada estudiante deberá elaborar una pequeña tabla de observaciones:

| Ejemplo | Característica | Técnica utilizada | ¿Qué detectó?     | Observaciones |
| ------- | -------------- | ----------------- | ----------------- | ------------- |
| 1       | Líneas         | Hough             | Líneas rectas     |               |
| 2       | Esquinas       | Harris            | Puntos de esquina |               |

Además, deberá guardar las imágenes generadas:

```text
ejemplo1_lineas.jpg
ejemplo2_esquinas.jpg
```

---

# 21. Distribución de las 2 horas

|      Tiempo | Actividad                                                  | Estrategia   |
| ----------: | ---------------------------------------------------------- | ------------ |
|      10 min | Explicación de líneas, esquinas y características visuales | Demostrativa |
|      10 min | Crear carpeta y entorno virtual                            | Guiada       |
|      10 min | Instalar y verificar OpenCV y NumPy                        | Guiada       |
|      25 min | Ejemplo 1: detección de líneas                             | Supervisada  |
|      15 min | Experimentar con parámetros de Hough                       | Supervisada  |
|      25 min | Ejemplo 2: detección de esquinas Harris                    | Supervisada  |
|      15 min | Experimentar con diferentes umbrales                       | Supervisada  |
|      10 min | Documentar y comparar resultados                           | Supervisada  |
| **120 min** | **Total**                                                  |              |

## Producto final

El estudiante deberá entregar la carpeta **`p10-act14-0777`** con:

* Entorno virtual `.env-filtro-0777`.
* `requirements.txt`.
* Imagen original.
* `ejemplo1_lineas.py`.
* `ejemplo2_esquinas.py`.
* Resultado de detección de líneas.
* Resultado de detección de esquinas.
* Tabla de observaciones.
* Conclusión breve sobre **cómo las líneas y esquinas pueden utilizarse como características visuales para identificar objetos o formas**.
