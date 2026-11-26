# **Práctica guiada: Procesamiento de imágenes mediante filtros Sobel en el dominio de la frecuencia**



Nivel: cero a principiante

Duración: 2 horas



**Asignatura:** Soluciona problemas de Visión Artificial\
**Especialidad:** Inteligencia Artificial\
**Submódulo 3:** Soluciona problemas de Visión Artificial\
**Semestre:** Tercer semestre de preparatoria\
**IDE:** Visual Studio Code\
**Lenguaje:** Python\
**Librerías:** OpenCV, NumPy, Matplotlib y Scikit-image\
**Carpeta de trabajo:** `u3-p7-proce-img-img-0777`

## **1. Propósito de la práctica**

Que los estudiantes comprendan cómo se pueden detectar bordes y cambios de intensidad en una imagen utilizando los filtros Sobel X y Sobel Y en el dominio de la frecuencia.

Se trabajará con la imagen del camarógrafo incluida en `skimage.data.camera()`.

Al finalizar, el estudiante podrá:

1. Cargar y visualizar una imagen en escala de grises.
2. Comprender qué es el dominio espacial y el dominio de la frecuencia.
3. Identificar qué es la Transformada Rápida de Fourier (FFT).
4. Aplicar el filtro Sobel X en el dominio de la frecuencia.
5. Aplicar el filtro Sobel Y en el dominio de la frecuencia.
6. Visualizar los espectros de frecuencia antes y después del filtrado.
7. Calcular la magnitud del gradiente para identificar bordes.

## **2. Explicación de los conceptos básicos**

### **2.1 Imagen del camarógrafo**

Utilizaremos una fotografía de prueba que proporciona la librería Scikit-image mediante:

```
from skimage import dataimagen = data.camera()
```

Esta imagen es de 512 × 512 píxeles y está en escala de grises.

[cameraman image read as color and grayscale in matlab and octave - Stack Overflow](https://images.openai.com/static-rsc-4/9j2HJckIM_-IGiv2VK1GvLB-iLbqXMV7nCWgyGU2_9oQri441L5jLLpL-zJ3zXJZFeBf382H-CUcJTFc336LK-T9TMYU75HMlDw-JDXL3eJKPjLxeIB1cEJ6yLsr7bYAShmG-A1NmFVPrgCB7Tg-7zyoWFjyFORy7EDm_Q4GvFk?purpose=inline)

**Imagen&#x20;**`data.camera()`

- Alto: 512 píxeles.
- Ancho: 512 píxeles.
- Canales: 1 (escala de grises).
- Valores de intensidad: 0 a 255.

### **2.2 ¿Qué es el procesamiento en el dominio espacial?**

Es trabajar directamente con los píxeles de una imagen.

Por ejemplo, aplicar un filtro Sobel a los píxeles para detectar bordes.

### **2.3 ¿Qué es el dominio de la frecuencia?**

Es una representación de la imagen que permite observar cómo cambian sus intensidades y qué frecuencias contiene.

- Frecuencias bajas: representan cambios suaves y regiones uniformes.
- Frecuencias altas: representan cambios rápidos, detalles y bordes.

Para transformar una imagen al dominio de la frecuencia utilizamos la Transformada Rápida de Fourier (FFT).

```
transformada = np.fft.fft2(imagen)
```

Para visualizar su espectro:

```
espectro = np.fft.fftshift(transformada)
```

El desplazamiento `fftshift()` coloca las frecuencias bajas en el centro de la representación.

### **2.4 ¿Qué es el filtro Sobel?**

Es un operador que permite detectar cambios de intensidad en una imagen.

Utiliza dos matrices o kernels:

**Sobel X**

Detecta principalmente bordes verticales, porque mide cambios en dirección horizontal.

\\[ G_x = \begin{bmatrix} -1&0&1\\\ -2&0&2\\\ -1&0&1 \end{bmatrix} \\]

**Sobel Y**

Detecta principalmente bordes horizontales, porque mide cambios en dirección vertical.

\\[ G_y = \begin{bmatrix} -1&-2&-1\\\ 0&0&0\\\ 1&2&1 \end{bmatrix} \\]

### **2.5 ¿Qué es la magnitud del gradiente?**

Es el resultado de combinar las respuestas de Sobel X y Sobel Y.

\\[ G=\sqrt{G_x^2+G_y^2} \\]

Permite observar la intensidad general de los bordes, independientemente de su orientación.

[Identificazione di bordi](https://images.openai.com/static-rsc-4/i2I17jq4XwNLsZf6DJHXuhDH0edhbNlfpJUeoWBHxbFO_G9UraQqNZbQVHavHMqSQVE2HuLP8KeFRPe609EDwdbdiIdui2yqQN7zM9PWMD86EgJcBIUehmI_7t-E5S6LfHIbenCyfLXc-nEa8cgILsTUMehQLUW-udzZHtoBEjI?purpose=inline)

[PPT - 2D Fourier Transforms and Image Filters PowerPoint Presentation, free download - ID:4108792](https://images.openai.com/static-rsc-4/k-ozXVhTUxnJxCGk8NvH0_lu0dDsviBrfnYSHI25_kYu-AxLt6jakrutB-rLmUebx7i53Nwx3LCJcKQZGNR57AMG86OGD3gXutJk0b_uiSZPD0U_h6BAQZP0vjSJhu85ZGb_9ouN3yaRBd3Kwj-rd1ghyyuakU2lvG45mi2u9cM?purpose=inline)

[【图像分析】边缘检测中的图像梯度以及各种梯度算子的介绍 - 虔诚的树 - 博客园](https://images.openai.com/static-rsc-4/zkFLMOvfEZZypY7lzhsrhS68l46hIWrCQniBywbqp32ZnxfSPIyZUYbOrhxCxyxvuhzRJ0BM7AhYoq5_Be7T5FVrTD19vZtLT4fpHMjF-Kvsz5zDVMtv3MTnr7dbhIpYP9MrgCZxWyTaMYzBYaJh4ugedeZr33LEVPkdctKzDTw?purpose=inline)

6

## **3. Preparación del entorno de trabajo en VS Code**

Realizaremos cuatro ejemplos:

| Ejemplo | Actividad                                                                |
| ------- | ------------------------------------------------------------------------ |
| 1       | Cargar la imagen del camarógrafo y visualizar su espectro de frecuencia. |
| 2       | Aplicar Sobel X en el dominio de la frecuencia.                          |
| 3       | Aplicar Sobel Y en el dominio de la frecuencia.                          |
| 4       | Calcular la magnitud del gradiente y comparar los resultados.            |

### **Paso 1. Crear la carpeta del proyecto**

1. Abre Visual Studio Code.
2. Selecciona **Terminal → New Terminal**.
3. Comprueba que la terminal utiliza PowerShell.
4. Escribe:

```
mkdir u3-p7-proce-img-img-0777
cd u3-p7-proce-img-img-0777
```

**Explicación:**

- `mkdir`: crea la carpeta del proyecto.
- `cd`: ingresa a la carpeta.

### **Paso 2. Crear el entorno virtual**

```
python -m venv .env-va-0777
```

El entorno virtual permite instalar las librerías de esta práctica sin afectar otras instalaciones de Python.

### **Paso 3. Activar el entorno virtual**

```
.\.env-va-0777\Scripts\Activate.ps1
```

Si PowerShell bloquea la activación, ejecuta:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Después vuelve a ejecutar el comando de activación.

La terminal debe mostrar:

```
(.env-va-0777) PS C:\...\u3-p7-proce-img-img-0777>
```

### **Paso 4. Instalar las librerías**

Ejecuta:

```
python -m pip install --upgrade pip
pip install opencv-python numpy matplotlib scikit-image
```

| Librería        | Función                                                   |
| --------------- | --------------------------------------------------------- |
| `opencv-python` | Leer, procesar y guardar imágenes.                        |
| `numpy`         | Realizar operaciones con matrices y cálculos matemáticos. |
| `matplotlib`    | Mostrar imágenes, espectros y gráficas.                   |
| `scikit-image`  | Proporcionar la imagen de prueba `data.camera()`.         |

### **Paso 5. Crear el archivo de requerimientos**

```
pip freeze > requirements.txt
```

Este archivo guarda las versiones de las librerías instaladas.

Para consultar su contenido:

```
Get-Content requirements.txt
```

Si posteriormente se necesita reconstruir el entorno:

```
pip install -r requirements.txt
```

## **4. Estructura de carpetas y archivos**

En la terminal ejecuta:

```
mkdir codigopy-0777
mkdir resultados-img-0777
```

Crea los siguientes cinco archivos dentro de `codigopy-0777`:

- `funciones-frecuencia-0777.py`
- `ejemplo1-espectro-0777.py`
- `ejemplo2-sobel-x-0777.py`
- `ejemplo3-sobel-y-0777.py`
- `ejemplo4-magnitud-gradiente-0777.py`

La estructura del proyecto será:

```
u3-p7-proce-img-img-0777/
│
├── .env-va-0777/
│
├── codigopy-0777/
│   ├── funciones-frecuencia-0777.py
│   ├── ejemplo1-espectro-0777.py
│   ├── ejemplo2-sobel-x-0777.py
│   ├── ejemplo3-sobel-y-0777.py
│   └── ejemplo4-magnitud-gradiente-0777.py
│
├── resultados-img-0777/
│
└── requirements.txt
```

**Importante:** no es necesario descargar una fotografía. El programa obtiene automáticamente la imagen del camarógrafo mediante `skimage.data.camera()`.

## **5. Preparar las funciones comunes para los cuatro ejemplos**

Antes de ejecutar los ejemplos, crearemos un archivo que contiene las funciones que utilizaremos en todos los programas.

Abre:

`codigopy-0777/funciones-frecuencia-0777.py`

Copia el siguiente código:

```
        centro_y - 1:centro_y + 2,        centro_x - 1:centro_x + 2    ] = kernel    # Mover el centro del kernel al origen    kernel_origen = np.fft.ifftshift(kernel_ampliado)    # Transformada de Fourier de la imagen y del kernel    fft_imagen = np.fft.fft2(imagen_ampliada)    fft_kernel = np.fft.fft2(kernel_origen)    # Multiplicacion en el dominio de la frecuencia    resultado_fft = fft_imagen * fft_kernel    # Regresar al dominio espacial    resultado_complejo = np.fft.ifft2(resultado_fft)    resultado = np.real(resultado_complejo)    # Quitar el pixel de relleno    resultado = resultado[1:-1, 1:-1]    return resultado.astype(np.float32)def normalizar_visualizacion(imagen):    """    Convierte una respuesta de filtro a valores de 0 a 255    para poder visualizarla y guardarla.    """    imagen_abs = np.abs(imagen)    imagen_normalizada = cv2.normalize(        imagen_abs,        None,        0,        255,        cv2.NORM_MINMAX    )    return imagen_normalizada.astype(np.uint8)def guardar_grafica(figura, nombre_archivo):    """    Guarda una figura dentro de resultados-img-0777.    """    import os    carpeta = "resultados-img-0777"    os.makedirs(carpeta, exist_ok=True)    ruta = os.path.join(carpeta, nombre_archivo)    figura.savefig(        ruta,        dpi=150,        bbox_inches="tight"    )    print("Imagen guardada:", ruta)
```

### **Explicación breve de las funciones**

| Función                       | ¿Qué realiza?                                                               |
| ----------------------------- | --------------------------------------------------------------------------- |
| `cargar_imagen()`             | Obtiene la imagen del camarógrafo.                                          |
| `obtener_espectro()`          | Calcula la Transformada de Fourier y permite visualizar las frecuencias.    |
| `aplicar_filtro_frecuencia()` | Aplica Sobel mediante FFT, multiplicación espectral y transformada inversa. |
| `normalizar_visualizacion()`  | Ajusta los valores para mostrar las respuestas del filtro.                  |
| `guardar_grafica()`           | Guarda automáticamente las gráficas generadas.                              |

**Concepto importante:** en el dominio de la frecuencia, la convolución espacial se convierte en una multiplicación. Por eso el programa transforma la imagen y el kernel, los multiplica y después utiliza la transformada inversa para recuperar la respuesta filtrada.

# **6. Ejemplo 1. Cargar la imagen y visualizar su espectro de frecuencia**

Ejemplo guiado 1

**Objetivo:** cargar la imagen del camarógrafo y observar su representación en el dominio espacial y en el dominio de la frecuencia.

### **Paso 1. Crear el archivo**

Abre:

`codigopy-0777/ejemplo1-espectro-0777.py`

### **Paso 2. Escribir el código**

```
# =====================================================# EJEMPLO 1: IMAGEN ORIGINAL Y ESPECTRO DE FRECUENCIA# =====================================================import matplotlib.pyplot as pltfrom funciones_frecuencia_0777 import cargar_imagen
```

Hay un detalle importante: el nombre real del archivo común contiene guiones, por lo que Python no permite importarlo directamente con esa escritura. Para evitar ese problema, cambia el nombre del archivo común a:

`funciones_frecuencia_0777.py`

Y utiliza este código completo:

```
# =====================================================# EJEMPLO 1: IMAGEN ORIGINAL Y ESPECTRO DE FRECUENCIA# =====================================================import matplotlib.pyplot as pltfrom funciones_frecuencia_0777 import (    cargar_imagen,    obtener_espectro,    guardar_grafica)# 1. Cargar la imagenimagen = cargar_imagen()# 2. Calcular el espectroespectro = obtener_espectro(imagen)# 3. Mostrar dimensionesprint("Imagen del camarografo")print("Alto:", imagen.shape[0])print("Ancho:", imagen.shape[1])# 4. Crear la figurafigura, ejes = plt.subplots(1, 2, figsize=(11, 5))# 5. Mostrar imagen originalejes[0].imshow(imagen, cmap="gray")ejes[0].set_title("Imagen original")ejes[0].axis("off")# 6. Mostrar espectroejes[1].imshow(espectro, cmap="gray")ejes[1].set_title("Espectro de frecuencia")ejes[1].axis("off")plt.tight_layout()# 7. Guardar y mostrarguardar_grafica(figura, "01_imagen_y_espectro.png")plt.show()
```

### **Paso 3. Ejecutar**

Desde la terminal, ubicado en la carpeta principal:

```
python .\codigopy-0777\ejemplo1-espectro-0777.py
```

### **Paso 4. Interpretar el resultado**

[Spatial Vs Frequency Domain: A Guide to Image Interpretation | by Chaw Thiri San | Medium](https://images.openai.com/static-rsc-4/ciQkpZWuzO1DMykN6rLSrSyYnu_bMFG00PJsgCO4nTQMBRjebHEpvjbvUjGrezcXZz0QOecPImYV2ZJlUjBKCzJpNoptLBdqqv2G93zVzxvmWlXo8PD-Q3h0uSJkuiR9DBCkfbORTCW8uaOOGht-tlelm1L8waqdYDIl9ME_rsU?purpose=inline)

[medium.com](https://medium.com/%40chawthirisan/spatial-vs-frequency-domain-a-guide-to-image-interpretation-d9c16b129b3f?utm_source=chatgpt.com)

- La primera imagen muestra la fotografía original.
- La segunda imagen muestra su espectro de frecuencias.
- La zona central del espectro representa las frecuencias bajas.
- Las zonas alejadas del centro representan frecuencias más altas.

**Aprendizaje:** una imagen puede representarse mediante sus píxeles o mediante sus componentes de frecuencia.

# **7. Ejemplo 2. Aplicar el filtro Sobel X en el dominio de la frecuencia**

Ejemplo guiado 2

**Objetivo:** detectar principalmente los bordes verticales de la imagen mediante el filtro Sobel X.

### **Paso 1. Comprender el kernel Sobel X**

```
sobel_x = np.array([    [-1, 0, 1],    [-2, 0, 2],    [-1, 0, 1]], dtype=np.float32)
```

Esta matriz identifica cambios de intensidad en dirección horizontal, resaltando principalmente los bordes verticales.

### **Paso 2. Crear el archivo**

`codigopy-0777/ejemplo2-sobel-x-0777.py`

### **Paso 3. Escribir el código completo**

```
# =====================================================# EJEMPLO 2: SOBEL X EN EL DOMINIO DE LA FRECUENCIA# =====================================================import numpy as npimport matplotlib.pyplot as pltfrom funciones_frecuencia_0777 import (    cargar_imagen,    obtener_espectro,    aplicar_filtro_frecuencia,    normalizar_visualizacion,    guardar_grafica)# 1. Cargar imagen originalimagen = cargar_imagen()# 2. Crear kernel Sobel Xsobel_x = np.array([    [-1, 0, 1],    [-2, 0, 2],    [-1, 0, 1]], dtype=np.float32)# 3. Aplicar Sobel X en frecuenciaresultado_x = aplicar_filtro_frecuencia(    imagen,    sobel_x)# 4. Calcular el espectro de la respuestaespectro_x = obtener_espectro(resultado_x)# 5. Normalizar la respuesta para visualizarla
```

### **Paso 4. Ejecutar**

```
python .\codigopy-0777\ejemplo2-sobel-x-0777.py
```

### **Paso 5. Interpretar los resultados**

[GitHub - Sam291998/Frequency-response-for-different-filters · GitHub](https://images.openai.com/static-rsc-4/gvRRRU-WOTxJc0QIB58NTXEb1dkaD7m8Ub8LV3yckOvgESroV2X277k_lMtSeGerk9n2X7rn22RyHQIEXOB6o51NpKx5qIyF7pioXXp168IOW3VHjkg_G0QlbOCmiHUK1ZZ7TSNtloHV_igAVMLoXy-EsSlK_GCDiZ4v-QzF9hk?purpose=inline)

[python - Convolving sobel operator in x direction in frequency domain - Stack Overflow](https://images.openai.com/static-rsc-4/G5m699Quh4s389UwkfdB-5W5tA8mmBErN5m9BUzA5DiEXxGtY7sUPNWd5o5MdDzGbpy9kRed4FV9kORN2AqDeH81AG4D4gn7MD2rnJCmKGLCG1iV9Ou_VB9XSTD7_uo4F2xS7-0SQmXBamQ8WJ3RiTC_CG6k_t5NU4S6Gok6AJQ?purpose=inline)

[SciPy - High Pass Filters](https://images.openai.com/static-rsc-4/ZvF6DQhT0AUAESbGvue4ZPw8Vzr6C6CmaieLQb_uiTD0zrTyXPs_M9cCZHI8qs-aMv1pj1gp_8SvWo8lQKRxoAFDjEj1edPDSm11K0OYgcdFMazzUjrPKfrlmLXcfVWHInRzbd6rXtNy99NVJcEmtxtOTF2JbHKdcsRbEeZ3eHc?purpose=inline)

5

El programa genera tres resultados:

1. Imagen original.
2. Espectro de frecuencia después de aplicar Sobel X.
3. Respuesta del filtro Sobel X, donde se destacan los bordes verticales.

**Aprendizaje:** Sobel X permite identificar cambios de intensidad en dirección horizontal y resaltar bordes verticales.

# **8. Ejemplo 3. Aplicar el filtro Sobel Y en el dominio de la frecuencia**

Ejemplo guiado 3

**Objetivo:** detectar principalmente los bordes horizontales mediante el filtro Sobel Y.

### **Paso 1. Comprender el kernel Sobel Y**

```
sobel_y = np.array([    [-1, -2, -1],    [ 0,  0,  0],    [ 1,  2,  1]], dtype=np.float32)
```

Este filtro identifica cambios de intensidad en dirección vertical y resalta principalmente los bordes horizontales.

### **Paso 2. Crear el archivo**

`codigopy-0777/ejemplo3-sobel-y-0777.py`

### **Paso 3. Escribir el código completo**

```
# =====================================================# EJEMPLO 3: SOBEL Y EN EL DOMINIO DE LA FRECUENCIA# =====================================================import numpy as npimport matplotlib.pyplot as pltfrom funciones_frecuencia_0777 import (    cargar_imagen,    obtener_espectro,    aplicar_filtro_frecuencia,    normalizar_visualizacion,    guardar_grafica)# 1. Cargar imagen originalimagen = cargar_imagen()# 2. Crear kernel Sobel Ysobel_y = np.array([    [-1, -2, -1],    [ 0,  0,  0],    [ 1,  2,  1]], dtype=np.float32)# 3. Aplicar Sobel Y en frecuenciaresultado_y = aplicar_filtro_frecuencia(    imagen,    sobel_y)# 4. Calcular el espectro de la respuestaespectro_y = obtener_espectro(resultado_y)# 5. Normalizar la respuesta para visualizarlaimagen_y = normalizar_visualizacion(resultado_y)# 6. Mostrar resultadosfigura, ejes = plt.subplots(1, 3, figsize=(14, 5))ejes[0].imshow(imagen, cmap="gray")ejes[0].set_title("Imagen original")ejes[0].axis("off")ejes[1].imshow(espectro_y, cmap="gray")ejes[1].set_title("Espectro después de Sobel Y")ejes[1].axis("off")ejes[2].imshow(imagen_y, cmap="gray")ejes[2].set_title("Sobel Y - dominio de frecuencia")ejes[2].axis("off")plt.tight_layout()# 7. Guardar resultadosguardar_grafica(figura, "03_sobel_y.png")plt.show()
```

### **Paso 4. Ejecutar**

```
python .\codigopy-0777\ejemplo3-sobel-y-0777.py
```

### **Paso 5. Interpretar los resultados**

[Cameraman solution — Functional MRI methods](https://images.openai.com/static-rsc-4/Cd5mnEuBKPO1CkyaYuFGNMG8Xuf6c95GfvBdVcfOy0WqU0SzB2C6QESe66p9Us7EV9YlGSHnM376oeUc52GyPBFOYF0TAPWEQ6BRQ6ZbWLDLn71y4K7dFp0xiUYKJ_IyPzNSxqNj5byIm3zAcjTTc_wT2Osvk1wQy5TSGEiI-GM?purpose=inline)

[GitHub - Sam291998/Frequency-response-for-different-filters · GitHub](https://images.openai.com/static-rsc-4/gvRRRU-WOTxJc0QIB58NTXEb1dkaD7m8Ub8LV3yckOvgESroV2X277k_lMtSeGerk9n2X7rn22RyHQIEXOB6o51NpKx5qIyF7pioXXp168IOW3VHjkg_G0QlbOCmiHUK1ZZ7TSNtloHV_igAVMLoXy-EsSlK_GCDiZ4v-QzF9hk?purpose=inline)

[Identificazione di bordi](https://images.openai.com/static-rsc-4/i2I17jq4XwNLsZf6DJHXuhDH0edhbNlfpJUeoWBHxbFO_G9UraQqNZbQVHavHMqSQVE2HuLP8KeFRPe609EDwdbdiIdui2yqQN7zM9PWMD86EgJcBIUehmI_7t-E5S6LfHIbenCyfLXc-nEa8cgILsTUMehQLUW-udzZHtoBEjI?purpose=inline)

El programa genera tres resultados:

1. Imagen original.
2. Espectro de frecuencia después de aplicar Sobel Y.
3. Respuesta de Sobel Y, donde se destacan los bordes horizontales.

**Aprendizaje:** Sobel Y permite identificar cambios de intensidad en dirección vertical y resaltar bordes horizontales.

# **9. Ejemplo 4. Calcular la magnitud del gradiente y comparar los resultados**

Ejemplo guiado 4

**Objetivo:** combinar las respuestas de Sobel X y Sobel Y para obtener una representación general de los bordes de la imagen.

### **Paso 1. Comprender la fórmula**

Se combinan las respuestas de los dos filtros:

\\[ G=\sqrt{G_x^2+G_y^2} \\]

Donde:

- \\(G_x\\): respuesta de Sobel X.
- \\(G_y\\): respuesta de Sobel Y.
- \\(G\\): magnitud del gradiente.

### **Paso 2. Crear el archivo**

`codigopy-0777/ejemplo4-magnitud-gradiente-0777.py`

### **Paso 3. Escribir el código completo**

```
# =====================================================# EJEMPLO 4: MAGNITUD DEL GRADIENTE# SOBEL X + SOBEL Y EN FRECUENCIA# =====================================================import numpy as npimport matplotlib.pyplot as pltfrom funciones_frecuencia_0777 import (    cargar_imagen,    obtener_espectro,    aplicar_filtro_frecuencia,    normalizar_visualizacion,    guardar_grafica)# 1. Cargar imagen originalimagen = cargar_imagen()# 2. Definir kernel Sobel Xsobel_x = np.array([    [-1, 0, 1],    [-2, 0, 2],    [-1, 0, 1]], dtype=np.float32)# 3. Definir kernel Sobel Ysobel_y = np.array([    [-1, -2, -1],    [ 0,  0,  0],    [ 1,  2,  1]], dtype=np.float32)# 4. Aplicar ambos filtros en frecuenciaresultado_x = aplicar_filtro_frecuencia(
```

### **Paso 4. Ejecutar**

```
python .\codigopy-0777\ejemplo4-magnitud-gradiente-0777.py
```

### **Paso 5. Interpretar los seis resultados**

El programa presenta los seis resultados solicitados:

[【图像分析】边缘检测中的图像梯度以及各种梯度算子的介绍 - 虔诚的树 - 博客园](https://images.openai.com/static-rsc-4/zkFLMOvfEZZypY7lzhsrhS68l46hIWrCQniBywbqp32ZnxfSPIyZUYbOrhxCxyxvuhzRJ0BM7AhYoq5_Be7T5FVrTD19vZtLT4fpHMjF-Kvsz5zDVMtv3MTnr7dbhIpYP9MrgCZxWyTaMYzBYaJh4ugedeZr33LEVPkdctKzDTw?purpose=inline)

[cnblogs.com](https://www.cnblogs.com/xxxxxxxxx/p/12093814.html?utm_source=chatgpt.com)

| Resultado                   | ¿Qué muestra?                                           |
| --------------------------- | ------------------------------------------------------- |
| Imagen original             | Fotografía del camarógrafo.                             |
| Espectro después de Sobel X | Distribución de frecuencias de la respuesta Sobel X.    |
| Espectro después de Sobel Y | Distribución de frecuencias de la respuesta Sobel Y.    |
| Sobel X                     | Bordes verticales destacados.                           |
| Sobel Y                     | Bordes horizontales destacados.                         |
| Magnitud del gradiente      | Combinación de los bordes detectados por ambos filtros. |

**Aprendizaje:** al combinar Sobel X y Sobel Y se obtiene una representación más completa de los bordes de la imagen.

## **10. Resultados generados automáticamente**

Después de ejecutar los cuatro programas, la carpeta `resultados-img-0777` contendrá:

```
resultados-img-0777/
│
├── 01_imagen_y_espectro.png
├── 02_sobel_x.png
├── 03_sobel_y.png
└── 04_comparacion_magnitud_gradiente.png
```

Cada archivo contiene las gráficas generadas por su respectivo ejemplo.

## **11. Estructura final del proyecto**

Para que los programas puedan importar correctamente las funciones compartidas, utiliza el nombre de archivo `funciones_frecuencia_0777.py` (con guiones bajos). La estructura definitiva queda así:

```
u3-p7-proce-img-img-0777/
│
├── .env-va-0777/
│
├── codigopy-0777/
│   ├── funciones_frecuencia_0777.py
│   ├── ejemplo1-espectro-0777.py
│   ├── ejemplo2-sobel-x-0777.py
│   ├── ejemplo3-sobel-y-0777.py
│   └── ejemplo4-magnitud-gradiente-0777.py
│
├── resultados-img-0777/
│   ├── 01_imagen_y_espectro.png
│   ├── 02_sobel_x.png
│   ├── 03_sobel_y.png
│   └── 04_comparacion_magnitud_gradiente.png
│
└── requirements.txt
```

**Importante para el ejemplo 1:** utiliza el código completo que aparece en el apartado 6, el que importa desde `funciones_frecuencia_0777`. No necesitas utilizar el pequeño fragmento inicial de importación mostrado antes de la aclaración del nombre.

## **12. Conceptos que el estudiante debe recordar**

| Concepto               | Lo que debe comprender                                                              |
| ---------------------- | ----------------------------------------------------------------------------------- |
| Imagen original        | Es la imagen que se desea procesar.                                                 |
| FFT                    | Transforma una imagen al dominio de la frecuencia.                                  |
| Espectro               | Representa la distribución de frecuencias de una imagen o de su respuesta filtrada. |
| Sobel X                | Detecta cambios horizontales de intensidad y destaca bordes verticales.             |
| Sobel Y                | Detecta cambios verticales de intensidad y destaca bordes horizontales.             |
| Magnitud del gradiente | Combina las respuestas de Sobel X y Sobel Y.                                        |
| FFT inversa            | Regresa el resultado del filtrado al dominio espacial.                              |

**Nota técnica:** la multiplicación de las transformadas realiza una convolución circular. En los programas se agrega un píxel de relleno reflectante alrededor de la imagen para reducir los efectos artificiales en sus bordes. Las respuestas Sobel se normalizan para su visualización; esa normalización no modifica los datos originales de la imagen.

## **13. Actividad de reforzamiento**

Después de ejecutar los cuatro ejemplos, los estudiantes realizarán las siguientes actividades:

1. Cambiar la imagen original por otra imagen en escala de grises.
2. Ejecutar nuevamente el ejemplo 1 y observar su espectro.
3. Aplicar Sobel X y observar qué bordes se resaltan.
4. Aplicar Sobel Y y comparar el resultado.
5. Ejecutar el ejemplo 4 y analizar la magnitud del gradiente.
6. Comparar los resultados obtenidos con la imagen original.

**Preguntas para responder en el cuaderno:**

1. ¿Qué diferencia existe entre el dominio espacial y el dominio de la frecuencia?
2. ¿Para qué sirve la Transformada de Fourier?
3. ¿Qué función realiza `np.fft.fft2()`?
4. ¿Para qué se utiliza `np.fft.fftshift()`?
5. ¿Qué tipo de bordes resalta Sobel X?
6. ¿Qué tipo de bordes resalta Sobel Y?
7. ¿Qué representa el espectro después de aplicar Sobel X?
8. ¿Qué representa el espectro después de aplicar Sobel Y?
9. ¿Qué operación matemática permite calcular la magnitud del gradiente?
10. ¿Por qué es importante detectar bordes en Visión Artificial?

## **14. Distribución del tiempo: 2 horas**

| Etapa      | Actividad                                                     | Tiempo      |
| ---------- | ------------------------------------------------------------- | ----------- |
| Apertura   | Explicación del dominio espacial, frecuencia y filtros Sobel. | 15 min      |
| Desarrollo | Crear carpeta, entorno virtual e instalar librerías.          | 20 min      |
| Desarrollo | Ejemplo 1: cargar imagen y visualizar espectro.               | 15 min      |
| Desarrollo | Ejemplo 2: aplicar Sobel X.                                   | 20 min      |
| Desarrollo | Ejemplo 3: aplicar Sobel Y.                                   | 20 min      |
| Desarrollo | Ejemplo 4: calcular magnitud del gradiente.                   | 20 min      |
| Cierre     | Comparar resultados y responder preguntas.                    | 10 min      |
| **Total**  |                                                               | **120 min** |

## **15. Evidencias de aprendizaje**

| Evidencia               | Características                                 | Instrumento            |
| ----------------------- | ----------------------------------------------- | ---------------------- |
| Estructura del proyecto | Carpeta, entorno virtual y archivos Python.     | Lista de cotejo        |
| Ejemplo 1               | Imagen original y espectro de frecuencia.       | Revisión de resultados |
| Ejemplo 2               | Aplicación de Sobel X y su espectro.            | Observación directa    |
| Ejemplo 3               | Aplicación de Sobel Y y su espectro.            | Observación directa    |
| Ejemplo 4               | Comparación de los seis resultados solicitados. | Lista de cotejo        |
| Preguntas               | Explicación de los conceptos fundamentales.     | Cuestionario           |

### **Lista de cotejo del estudiante**

**Progreso de la práctica**

0 de 9

Creé la carpeta u3-p7-proce-img-img-0777.

Creé y activé el entorno virtual .env-va-0777.

Instalé OpenCV, NumPy, Matplotlib y Scikit-image.

Creé el archivo de requerimientos requirements.txt.

Ejecuté el ejemplo 1 y guardé el espectro.

Ejecuté el ejemplo 2 y guardé Sobel X.

Ejecuté el ejemplo 3 y guardé Sobel Y.

Ejecuté el ejemplo 4 y guardé la magnitud del gradiente.

Comparé los resultados y contesté las preguntas.

Reiniciar lista

## **16. Conclusión de la práctica**

El procesamiento de imágenes en el dominio de la frecuencia permite aplicar filtros mediante operaciones matemáticas con la Transformada de Fourier.

Con los filtros Sobel X y Sobel Y se identifican cambios de intensidad en diferentes direcciones. Al combinar sus resultados mediante la magnitud del gradiente se obtiene una representación general de los bordes.

Estos procedimientos son importantes en Visión Artificial porque permiten analizar características de las imágenes que posteriormente pueden utilizarse en sistemas de reconocimiento, clasificación y detección de objetos.

**Aprendizaje esperado:** el estudiante aplica filtros Sobel X y Sobel Y en el dominio de la frecuencia mediante Python, NumPy y OpenCV, interpreta sus espectros y calcula la magnitud del gradiente para identificar bordes en una imagen.
