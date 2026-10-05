Claro. A continuación se presentan **2 ejemplos totalmente funcionales**, diseñados para estudiantes de **tercer semestre de preparatoria**, mediante una práctica **guiada y supervisada** en **Visual Studio Code**, utilizando Python y OpenCV.

## Práctica: Filtros, suavizado y eliminación de ruido

**Duración:** 2 horas
**Modalidad:** Práctica guiada y supervisada
**Carpeta de trabajo:** `p7-act12-0777`
**Entorno virtual:** `.env-filtro-0777`
**Biblioteca principal:** OpenCV (`opencv-python`)
**Nivel:** Básico–Intermedio

### Propósito

Aplicar filtros de procesamiento de imágenes para:

1. **Suavizar una imagen** y reducir pequeñas variaciones o ruido.
2. **Eliminar ruido** conservando, en lo posible, los bordes de los objetos.

---

# 1. Crear la carpeta de trabajo

Abra **Visual Studio Code**.

Seleccione:

**Terminal → New Terminal**

En la terminal escriba:

```powershell
mkdir p7-act12-0777
```

Entrar a la carpeta:

```powershell
cd p7-act12-0777
```

Verifique la ubicación:

```powershell
pwd
```

Debe mostrar una ruta similar a:

```text
C:\Users\SuUsuario\p7-act12-0777
```

---

# 2. Crear el entorno virtual

En la terminal de VS Code ejecute:

```powershell
python -m venv .env-filtro-0777
```

Se creará:

```text
p7-act12-0777
└── .env-filtro-0777
```

---

# 3. Activar el entorno virtual

En Windows PowerShell:

```powershell
.env-filtro-0777\Scripts\Activate.ps1
```

Si se activó correctamente, aparecerá al inicio de la terminal:

```text
(.env-filtro-0777)
```

Por ejemplo:

```text
(.env-filtro-0777) PS C:\Users\SuUsuario\p7-act12-0777>
```

### Si PowerShell bloquea la activación

Ejecute:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Después vuelva a ejecutar:

```powershell
.env-filtro-0777\Scripts\Activate.ps1
```

---

# 4. Seleccionar el intérprete de Python en VS Code

Presione:

```text
Ctrl + Shift + P
```

Escriba:

```text
Python: Select Interpreter
```

Seleccione el intérprete:

```text
.env-filtro-0777\Scripts\python.exe
```

Esto es importante para que VS Code utilice el Python del entorno virtual.

---

# 5. Actualizar pip

Con el entorno activado:

```powershell
python -m pip install --upgrade pip
```

---

# 6. Instalar OpenCV

Instale la biblioteca:

```powershell
pip install opencv-python
```

También instalaremos NumPy, que será útil para trabajar con matrices de imágenes:

```powershell
pip install numpy
```

---

# 7. Verificar las bibliotecas

Ejecute:

```powershell
python -c "import cv2; print('OpenCV:', cv2.__version__)"
```

Después:

```powershell
python -c "import numpy; print('NumPy:', numpy.__version__)"
```

Debe obtener versiones instaladas, por ejemplo:

```text
OpenCV: 4.x.x
NumPy: 2.x.x
```

---

# 8. Crear el archivo requirements.txt

En la terminal:

```powershell
pip freeze > requirements.txt
```

La estructura inicial será:

```text
p7-act12-0777/
│
├── .env-filtro-0777/
│
└── requirements.txt
```

---

# 9. Preparar las carpetas del proyecto

Vamos a organizar la práctica:

```powershell
mkdir imagenes
mkdir resultados
mkdir codigo
```

La estructura será:

```text
p7-act12-0777/
│
├── .env-filtro-0777/
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

# EJEMPLO 1. Suavizado con filtro Gaussiano

## Objetivo

Aplicar un **filtro Gaussiano** para suavizar una imagen y disminuir pequeñas variaciones o ruido.

El filtro Gaussiano calcula nuevos valores para los píxeles considerando los píxeles vecinos.

La función que utilizaremos es:

```python
cv2.GaussianBlur()
```

---

## Paso 1. Agregar una imagen

Coloque una fotografía dentro de:

```text
p7-act12-0777/imagenes/
```

Por ejemplo:

```text
paisaje.jpg
```

La estructura será:

```text
p7-act12-0777/
│
├── imagenes/
│   └── paisaje.jpg
│
├── resultados/
├── codigo/
├── .env-filtro-0777/
└── requirements.txt
```

**Importante:** el nombre utilizado en el programa debe coincidir exactamente con el nombre de la imagen.

---

## Paso 2. Crear el programa

En VS Code abra:

```text
codigo
```

Cree:

```text
ejemplo1_gaussiano.py
```

Código completo:

```python
import cv2

# Cargar la imagen
imagen = cv2.imread("../imagenes/paisaje.jpg")

# Verificar que la imagen se haya cargado
if imagen is None:
    print("No se pudo cargar la imagen.")
    exit()

# Aplicar filtro Gaussiano
imagen_suavizada = cv2.GaussianBlur(
    imagen,
    (7, 7),
    0
)

# Mostrar imágenes
cv2.imshow("Imagen original", imagen)
cv2.imshow("Imagen suavizada - Filtro Gaussiano", imagen_suavizada)

# Guardar resultado
cv2.imwrite(
    "../resultados/paisaje_gaussiano.jpg",
    imagen_suavizada
)

print("Filtro Gaussiano aplicado correctamente.")
print("Resultado guardado en:")
print("../resultados/paisaje_gaussiano.jpg")

# Esperar una tecla
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

## Paso 3. Ejecutar el programa

Desde la terminal:

```powershell
python codigo\ejemplo1_gaussiano.py
```

Se abrirán dos ventanas:

```text
Imagen original
Imagen suavizada - Filtro Gaussiano
```

El resultado se guardará en:

```text
resultados/paisaje_gaussiano.jpg
```

---

## ¿Qué está haciendo el filtro?

La instrucción:

```python
cv2.GaussianBlur(imagen, (7, 7), 0)
```

utiliza una ventana de:

```text
7 × 7 píxeles
```

para calcular el nuevo valor de los píxeles.

Conceptualmente:

```text
Imagen original
       ↓
   Vecindad de píxeles
       ↓
Filtro Gaussiano
       ↓
Imagen suavizada
```

### Actividad del estudiante

El estudiante debe modificar:

```python
(7, 7)
```

por:

```python
(3, 3)
```

y posteriormente:

```python
(11, 11)
```

Comparar los tres resultados.

**Pregunta:** ¿Qué ocurre con la imagen cuando aumenta el tamaño del filtro?

---

# EJEMPLO 2. Eliminación de ruido con filtro Mediano

## Objetivo

Aplicar un **filtro de mediana** para reducir ruido, especialmente pequeños puntos aislados presentes en una imagen.

Utilizaremos:

```python
cv2.medianBlur()
```

Este filtro es especialmente útil para el denominado **ruido impulsivo**, conocido comúnmente como ruido de tipo **sal y pimienta**.

---

# Paso 1. Crear el programa

Dentro de:

```text
codigo/
```

cree:

```text
ejemplo2_mediana.py
```

Código completo:

```python
import cv2

# Cargar la imagen
imagen = cv2.imread("../imagenes/paisaje.jpg")

# Verificar que la imagen se haya cargado
if imagen is None:
    print("No se pudo cargar la imagen.")
    exit()

# Aplicar filtro de mediana
imagen_filtrada = cv2.medianBlur(
    imagen,
    5
)

# Mostrar imágenes
cv2.imshow("Imagen original", imagen)
cv2.imshow("Imagen con filtro de mediana", imagen_filtrada)

# Guardar resultado
cv2.imwrite(
    "../resultados/paisaje_mediana.jpg",
    imagen_filtrada
)

print("Filtro de mediana aplicado correctamente.")
print("Resultado guardado en:")
print("../resultados/paisaje_mediana.jpg")

# Esperar una tecla
cv2.waitKey(0)

# Cerrar ventanas
cv2.destroyAllWindows()
```

---

# Paso 2. Ejecutar

En la terminal:

```powershell
python codigo\ejemplo2_mediana.py
```

Se mostrarán:

```text
Imagen original
Imagen con filtro de mediana
```

Y se generará:

```text
resultados/paisaje_mediana.jpg
```

---

# Paso 3. Experimentar con diferentes valores

Modifique:

```python
imagen_filtrada = cv2.medianBlur(imagen, 5)
```

por:

```python
imagen_filtrada = cv2.medianBlur(imagen, 3)
```

Después pruebe:

```python
imagen_filtrada = cv2.medianBlur(imagen, 7)
```

Compare:

```text
3 × 3
5 × 5
7 × 7
```

**Importante:** el tamaño del kernel debe ser un número impar.

Ejemplos válidos:

```text
3
5
7
9
11
```

---

# 10. Comparación de los dos filtros

| Característica         | Filtro Gaussiano       | Filtro de Mediana          |
| ---------------------- | ---------------------- | -------------------------- |
| Función OpenCV         | `GaussianBlur()`       | `medianBlur()`             |
| Propósito              | Suavizar               | Reducir ruido              |
| Operación              | Promedio ponderado     | Mediana                    |
| Reduce detalles        | Sí                     | Sí, dependiendo del kernel |
| Conservación de bordes | Moderada               | Generalmente buena         |
| Uso común              | Suavizado              | Ruido impulsivo            |
| Kernel utilizado       | `(3,3)`, `(7,7)`, etc. | `3`, `5`, `7`, etc.        |

---

# 11. Estructura final del proyecto

Al terminar las actividades:

```text
p7-act12-0777/
│
├── .env-filtro-0777/
│   ├── Scripts/
│   ├── Lib/
│   └── ...
│
├── imagenes/
│   └── paisaje.jpg
│
├── resultados/
│   ├── paisaje_gaussiano.jpg
│   └── paisaje_mediana.jpg
│
├── codigo/
│   ├── ejemplo1_gaussiano.py
│   └── ejemplo2_mediana.py
│
└── requirements.txt
```

---

# 12. Secuencia didáctica de las 2 horas

|      Tiempo | Actividad                                                | Modalidad    |
| ----------: | -------------------------------------------------------- | ------------ |
|      15 min | Explicación de qué son los filtros y el ruido digital    | Demostrativa |
|      15 min | Crear carpeta, entorno virtual e instalar OpenCV y NumPy | Guiada       |
|      25 min | Ejemplo 1: filtro Gaussiano                              | Guiada       |
|      20 min | Experimentar con kernels 3×3, 7×7 y 11×11                | Supervisada  |
|      25 min | Ejemplo 2: filtro de mediana                             | Guiada       |
|      15 min | Experimentar con kernels 3, 5 y 7                        | Supervisada  |
|       5 min | Comparación de resultados y conclusiones                 | Supervisada  |
| **120 min** | **Total**                                                |              |

## Producto de la práctica

El estudiante deberá entregar:

1. Carpeta `p7-act12-0777`.
2. Entorno virtual `.env-filtro-0777`.
3. `requirements.txt`.
4. `ejemplo1_gaussiano.py`.
5. `ejemplo2_mediana.py`.
6. Imagen original.
7. Resultado del filtro Gaussiano.
8. Resultado del filtro de mediana.
9. Una breve conclusión indicando **qué filtro produjo mayor suavizado y cuál conservó mejor los detalles de la imagen**.
