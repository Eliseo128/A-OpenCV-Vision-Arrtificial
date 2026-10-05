# Práctica 13 — Detección de bordes y contornos con OpenCV

**Materia:** Soluciona problemas de Visión Artificial
**Semestre:** 3.º de preparatoria
**Duración:** 2 horas
**Modalidad:** Práctica supervisada
**Carpeta:** `p9-act13-0777`
**Entorno virtual:** `.env-bordes-0777`
**Bibliotecas:** OpenCV y NumPy

### Propósito

El estudiante aprenderá a:

* Detectar bordes en imágenes.
* Identificar contornos.
* Analizar formas geométricas.
* Aproximar contornos para reconocer figuras.
* Utilizar características de una imagen para identificar formas.

Se realizarán **4 ejemplos progresivos y totalmente funcionales**.

---

# 1. Crear la carpeta de trabajo

Abra **Visual Studio Code**.

Seleccione:

**Terminal → New Terminal**

En la terminal escriba:

```powershell
mkdir p9-act13-0777
```

Entre a la carpeta:

```powershell
cd p9-act13-0777
```

Compruebe la ubicación:

```powershell
pwd
```

La terminal deberá encontrarse dentro de:

```text
p9-act13-0777
```

---

# 2. Crear el entorno virtual

En la terminal de VS Code ejecute:

```powershell
python -m venv .env-bordes-0777
```

Se creará:

```text
p9-act13-0777/
└── .env-bordes-0777/
```

---

# 3. Activar el entorno virtual

Ejecute:

```powershell
.env-bordes-0777\Scripts\Activate.ps1
```

Si se activó correctamente, aparecerá:

```text
(.env-bordes-0777)
```

al inicio de la terminal.

Por ejemplo:

```text
(.env-bordes-0777) PS C:\Users\Usuario\p9-act13-0777>
```

### Si PowerShell no permite ejecutar el entorno

Ejecute:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Después:

```powershell
.env-bordes-0777\Scripts\Activate.ps1
```

---

# 4. Seleccionar el intérprete de Python

En VS Code presione:

```text
Ctrl + Shift + P
```

Escriba:

```text
Python: Select Interpreter
```

Seleccione:

```text
.env-bordes-0777\Scripts\python.exe
```

Esto garantiza que los programas utilicen el entorno virtual de esta práctica.

---

# 5. Actualizar pip

Con el entorno activado:

```powershell
python -m pip install --upgrade pip
```

---

# 6. Instalar las bibliotecas

Para los cuatro ejemplos utilizaremos OpenCV y NumPy.

Instale OpenCV:

```powershell
pip install opencv-python
```

Instale NumPy:

```powershell
pip install numpy
```

### Verificar OpenCV

```powershell
python -c "import cv2; print('OpenCV:', cv2.__version__)"
```

### Verificar NumPy

```powershell
python -c "import numpy; print('NumPy:', numpy.__version__)"
```

Debe aparecer la versión instalada de cada biblioteca.

---

# 7. Crear `requirements.txt`

Ejecute:

```powershell
pip freeze > requirements.txt
```

La estructura inicial será:

```text
p9-act13-0777/
│
├── .env-bordes-0777/
│
└── requirements.txt
```

---

# 8. Crear las carpetas del proyecto

Ejecute:

```powershell
mkdir imagenes
mkdir resultados
mkdir codigo
```

La estructura será:

```text
p9-act13-0777/
│
├── .env-bordes-0777/
│
├── imagenes/
│
├── resultados/
│
├── codigo/
│
└── requirements.txt
```

---

# 9. Preparar la imagen de trabajo

Coloque una imagen dentro de:

```text
imagenes/
```

Por ejemplo:

```text
figuras.jpg
```

La estructura será:

```text
p9-act13-0777/
│
├── imagenes/
│   └── figuras.jpg
│
├── resultados/
├── codigo/
├── .env-bordes-0777/
└── requirements.txt
```

**Importante:** el nombre `figuras.jpg` debe coincidir exactamente con el utilizado en los programas.

---

# EJEMPLO 1 — Detección de bordes con Canny

## Objetivo

Detectar los bordes principales de los objetos de una imagen utilizando el algoritmo **Canny**.

OpenCV proporciona la función:

```python
cv2.Canny()
```

El resultado es una imagen donde los bordes aparecen resaltados.

---

## Paso 1. Crear el archivo

Dentro de:

```text
codigo/
```

cree:

```text
ejemplo1_canny.py
```

## Código completo

```python
import cv2

# Cargar la imagen
imagen = cv2.imread("../imagenes/figuras.jpg")

# Comprobar que la imagen fue cargada
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Convertir a escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Detectar bordes mediante Canny
bordes = cv2.Canny(gris, 100, 200)

# Mostrar resultados
cv2.imshow("Imagen original", imagen)
cv2.imshow("Imagen en escala de grises", gris)
cv2.imshow("Bordes Canny", bordes)

# Guardar resultado
cv2.imwrite("../resultados/ejemplo1_canny.jpg", bordes)

print("Detección de bordes completada.")
print("Resultado guardado en resultados/ejemplo1_canny.jpg")

# Esperar una tecla
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

## Paso 2. Ejecutar

Desde la terminal:

```powershell
python codigo\ejemplo1_canny.py
```

Se mostrarán tres ventanas:

```text
Imagen original
Imagen en escala de grises
Bordes Canny
```

El resultado se guardará en:

```text
resultados/ejemplo1_canny.jpg
```

### ¿Qué significa?

La instrucción:

```python
bordes = cv2.Canny(gris, 100, 200)
```

detecta cambios importantes de intensidad entre píxeles.

Conceptualmente:

```text
Imagen
   ↓
Escala de grises
   ↓
Canny
   ↓
Bordes
```

### Actividad supervisada

Cambie:

```python
cv2.Canny(gris, 100, 200)
```

por:

```python
cv2.Canny(gris, 50, 150)
```

Compare ambos resultados.

---

# EJEMPLO 2 — Detección de contornos

## Objetivo

Detectar los **contornos** de los objetos presentes en una imagen.

Los contornos representan curvas que delimitan regiones u objetos.

Utilizaremos:

```python
cv2.findContours()
```

y:

```python
cv2.drawContours()
```

---

## Paso 1. Crear archivo

En:

```text
codigo/
```

cree:

```text
ejemplo2_contornos.py
```

## Código completo

```python
import cv2

# Cargar imagen
imagen = cv2.imread("../imagenes/figuras.jpg")

# Comprobar imagen
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Convertir a escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Convertir a imagen binaria mediante umbral
_, binaria = cv2.threshold(
    gris,
    127,
    255,
    cv2.THRESH_BINARY
)

# Detectar contornos
contornos, jerarquia = cv2.findContours(
    binaria,
    cv2.RETR_EXTERNAL,
    cv2.CHAIN_APPROX_SIMPLE
)

# Dibujar los contornos
resultado = imagen.copy()

cv2.drawContours(
    resultado,
    contornos,
    -1,
    (0, 255, 0),
    2
)

# Mostrar resultados
cv2.imshow("Imagen original", imagen)
cv2.imshow("Imagen binaria", binaria)
cv2.imshow("Contornos detectados", resultado)

# Guardar resultado
cv2.imwrite(
    "../resultados/ejemplo2_contornos.jpg",
    resultado
)

print("Cantidad de contornos encontrados:", len(contornos))
print("Resultado guardado en resultados/ejemplo2_contornos.jpg")

# Esperar
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

## Paso 2. Ejecutar

```powershell
python codigo\ejemplo2_contornos.py
```

La terminal mostrará algo similar a:

```text
Cantidad de contornos encontrados: 5
```

El número dependerá de la imagen utilizada.

El resultado estará en:

```text
resultados/ejemplo2_contornos.jpg
```

### Concepto importante

El proceso realizado es:

```text
Imagen original
       ↓
Escala de grises
       ↓
Umbralización
       ↓
Imagen binaria
       ↓
findContours()
       ↓
Contornos
```

---

# EJEMPLO 3 — Dibujar y contar objetos mediante contornos

## Objetivo

Utilizar los contornos para **identificar y contar objetos**.

Este ejemplo muestra cómo una técnica de visión artificial puede utilizarse para obtener información de una imagen.

---

## Paso 1. Crear archivo

Cree:

```text
ejemplo3_contar_objetos.py
```

## Código completo

```python
import cv2

# Cargar imagen
imagen = cv2.imread("../imagenes/figuras.jpg")

# Comprobar imagen
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Convertir a escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Aplicar umbral
_, binaria = cv2.threshold(
    gris,
    127,
    255,
    cv2.THRESH_BINARY
)

# Encontrar contornos externos
contornos, _ = cv2.findContours(
    binaria,
    cv2.RETR_EXTERNAL,
    cv2.CHAIN_APPROX_SIMPLE
)

# Crear copia
resultado = imagen.copy()

# Contador
cantidad = 0

# Analizar cada contorno
for contorno in contornos:

    # Calcular área
    area = cv2.contourArea(contorno)

    # Ignorar objetos demasiado pequeños
    if area > 500:

        cantidad += 1

        # Dibujar contorno
        cv2.drawContours(
            resultado,
            [contorno],
            -1,
            (0, 255, 0),
            2
        )

        # Obtener rectángulo
        x, y, ancho, alto = cv2.boundingRect(contorno)

        # Dibujar rectángulo
        cv2.rectangle(
            resultado,
            (x, y),
            (x + ancho, y + alto),
            (255, 0, 0),
            2
        )

        # Mostrar número del objeto
        cv2.putText(
            resultado,
            f"Objeto {cantidad}",
            (x, y - 10),
            cv2.FONT_HERSHEY_SIMPLEX,
            0.6,
            (0, 0, 255),
            2
        )

# Mostrar resultado
cv2.imshow("Objetos identificados", resultado)

# Guardar
cv2.imwrite(
    "../resultados/ejemplo3_objetos.jpg",
    resultado
)

print("Objetos identificados:", cantidad)
print("Resultado guardado en resultados/ejemplo3_objetos.jpg")

# Esperar
cv2.waitKey(0)

# Cerrar
cv2.destroyAllWindows()
```

---

## Paso 2. Ejecutar

```powershell
python codigo\ejemplo3_contar_objetos.py
```

El programa mostrará:

```text
Objetos identificados: 4
```

El número dependerá de los objetos presentes en `figuras.jpg`.

El resultado se guardará como:

```text
resultados/ejemplo3_objetos.jpg
```

### ¿Qué estamos haciendo?

Para cada contorno:

```python
area = cv2.contourArea(contorno)
```

obtenemos su área.

Después:

```python
x, y, ancho, alto = cv2.boundingRect(contorno)
```

obtenemos el rectángulo que contiene el objeto.

Conceptualmente:

```text
Objeto
   ↓
Contorno
   ↓
Área
   ↓
Rectángulo delimitador
   ↓
Identificación del objeto
```

---

# EJEMPLO 4 — Identificación de formas geométricas

## Objetivo

Utilizar los contornos para reconocer formas básicas:

* Triángulo
* Cuadrado
* Rectángulo
* Pentágono
* Círculo

Para ello utilizaremos:

```python
cv2.approxPolyDP()
```

Esta función permite aproximar un contorno mediante un polígono.

---

## Paso 1. Crear archivo

Cree:

```text
ejemplo4_formas.py
```

## Código completo

```python
import cv2

# Cargar imagen
imagen = cv2.imread("../imagenes/figuras.jpg")

# Comprobar imagen
if imagen is None:
    print("Error: no se pudo cargar la imagen.")
    exit()

# Escala de grises
gris = cv2.cvtColor(imagen, cv2.COLOR_BGR2GRAY)

# Umbralización
_, binaria = cv2.threshold(
    gris,
    127,
    255,
    cv2.THRESH_BINARY
)

# Buscar contornos
contornos, _ = cv2.findContours(
    binaria,
    cv2.RETR_EXTERNAL,
    cv2.CHAIN_APPROX_SIMPLE
)

# Crear copia
resultado = imagen.copy()

for contorno in contornos:

    # Eliminar objetos pequeños
    area = cv2.contourArea(contorno)

    if area < 500:
        continue

    # Perímetro
    perimetro = cv2.arcLength(
        contorno,
        True
    )

    # Aproximar contorno
    aproximacion = cv2.approxPolyDP(
        contorno,
        0.04 * perimetro,
        True
    )

    # Número de vértices
    vertices = len(aproximacion)

    # Identificar forma
    if vertices == 3:
        forma = "Triangulo"

    elif vertices == 4:

        x, y, ancho, alto = cv2.boundingRect(
            aproximacion
        )

        relacion = ancho / float(alto)

        if 0.90 <= relacion <= 1.10:
            forma = "Cuadrado"
        else:
            forma = "Rectangulo"

    elif vertices == 5:
        forma = "Pentagono"

    elif vertices > 5:
        forma = "Circulo"

    else:
        forma = "Desconocida"

    # Dibujar contorno
    cv2.drawContours(
        resultado,
        [aproximacion],
        -1,
        (0, 255, 0),
        2
    )

    # Obtener posición
    x, y, ancho, alto = cv2.boundingRect(
        aproximacion
    )

    # Escribir nombre de la forma
    cv2.putText(
        resultado,
        forma,
        (x, y - 10),
        cv2.FONT_HERSHEY_SIMPLEX,
        0.6,
        (0, 0, 255),
        2
    )

# Mostrar resultado
cv2.imshow(
    "Formas identificadas",
    resultado
)

# Guardar resultado
cv2.imwrite(
    "../resultados/ejemplo4_formas.jpg",
    resultado
)

print("Identificación de formas terminada.")
print("Resultado guardado en resultados/ejemplo4_formas.jpg")

# Esperar
cv2.waitKey(0)

# Cerrar
cv2.destroyAllWindows()
```

---

# 10. Ejecutar el cuarto ejemplo

En la terminal:

```powershell
python codigo\ejemplo4_formas.py
```

El programa analizará los contornos y colocará sobre la imagen nombres como:

```text
Triangulo
Cuadrado
Rectangulo
Pentagono
Circulo
```

El resultado se almacenará en:

```text
resultados/ejemplo4_formas.jpg
```

---

# 11. ¿Cómo funciona el reconocimiento de formas?

El programa obtiene primero el contorno:

```python
contornos, _ = cv2.findContours(...)
```

Después obtiene su perímetro:

```python
perimetro = cv2.arcLength(contorno, True)
```

Posteriormente aproxima el contorno:

```python
aproximacion = cv2.approxPolyDP(
    contorno,
    0.04 * perimetro,
    True
)
```

Finalmente cuenta sus vértices:

```python
vertices = len(aproximacion)
```

La lógica básica es:

```text
            CONTORNO
                │
                ▼
       Aproximación poligonal
                │
                ▼
       Número de vértices
                │
       ┌────────┼─────────┐
       ▼        ▼         ▼
      3         4        5 o más
       │        │          │
       ▼        ▼          ▼
  Triángulo  Cuadrado/  Pentágono/
              Rectángulo  Círculo
```

---

# 12. Comparación de los cuatro ejemplos

| Ejemplo | Técnica                  | Función principal                  | Resultado            |
| ------- | ------------------------ | ---------------------------------- | -------------------- |
| 1       | Detección de bordes      | `cv2.Canny()`                      | Bordes               |
| 2       | Detección de contornos   | `cv2.findContours()`               | Contornos            |
| 3       | Análisis de objetos      | `contourArea()` + `boundingRect()` | Objetos contados     |
| 4       | Reconocimiento de formas | `approxPolyDP()`                   | Formas identificadas |

---

# 13. Estructura final del proyecto

Al finalizar la práctica deberá quedar:

```text
p9-act13-0777/
│
├── .env-bordes-0777/
│   ├── Scripts/
│   ├── Lib/
│   └── ...
│
├── imagenes/
│   └── figuras.jpg
│
├── resultados/
│   ├── ejemplo1_canny.jpg
│   ├── ejemplo2_contornos.jpg
│   ├── ejemplo3_objetos.jpg
│   └── ejemplo4_formas.jpg
│
├── codigo/
│   ├── ejemplo1_canny.py
│   ├── ejemplo2_contornos.py
│   ├── ejemplo3_contar_objetos.py
│   └── ejemplo4_formas.py
│
└── requirements.txt
```

---

# 14. Distribución de las 2 horas

|      Tiempo | Actividad                          | Estrategia   |
| ----------: | ---------------------------------- | ------------ |
|      10 min | Introducción a bordes y contornos  | Demostrativa |
|      10 min | Crear carpeta y entorno virtual    | Guiada       |
|      10 min | Instalar y verificar OpenCV/NumPy  | Guiada       |
|      20 min | Ejemplo 1: Canny                   | Supervisada  |
|      20 min | Ejemplo 2: contornos               | Supervisada  |
|      20 min | Ejemplo 3: contar objetos          | Supervisada  |
|      25 min | Ejemplo 4: identificar formas      | Supervisada  |
|       5 min | Comparar resultados y conclusiones | Supervisada  |
| **120 min** | **Total**                          |              |

## Actividad de cierre

El estudiante deberá comparar los cuatro resultados y responder:

1. ¿Qué diferencia existe entre un **borde** y un **contorno**?
2. ¿Para qué sirve `cv2.Canny()`?
3. ¿Para qué sirve `cv2.findContours()`?
4. ¿Qué información proporciona `cv2.contourArea()`?
5. ¿Cómo puede `approxPolyDP()` ayudar a reconocer una figura?
6. ¿Qué características permitirían distinguir un cuadrado de un círculo?

**Producto final:** la carpeta `p9-act13-0777` con los cuatro programas `.py`, la imagen utilizada, los cuatro resultados generados y `requirements.txt`.
