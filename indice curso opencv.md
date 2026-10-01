# Índice del curso de OpenCV: de Principiante a Avanzado

Curso orientado a estudiantes de **preparatoria**, con enfoque práctico en **Python, NumPy, procesamiento de imágenes, visión artificial, Machine Learning e Inteligencia Artificial**.

## Módulo 1. Introducción a OpenCV — Principiante

1. **¿Qué es OpenCV?**

   * Concepto de visión artificial
   * ¿Qué es OpenCV?
   * Historia y características
   * Aplicaciones reales
   * OpenCV e Inteligencia Artificial

2. **Instalación y configuración**

   * Instalación de OpenCV
   * `opencv-python`
   * Verificación de instalación
   * Configuración en VS Code
   * Configuración en Jupyter Notebook
   * Archivo `requirements.txt`

3. **Primer programa con OpenCV**

   * Importar `cv2`
   * Verificar versión
   * Crear una ventana
   * Mostrar información

4. **OpenCV y NumPy**

   * Imagen como array
   * Dimensiones
   * Filas y columnas
   * Canales
   * Tipos de datos

---

# Módulo 2. Imágenes digitales — Principiante

5. **Conceptos de imágenes**

   * Píxel
   * Resolución
   * Ancho y alto
   * Canales de color
   * RGB y BGR

6. **Leer imágenes**

   * `cv2.imread()`
   * Rutas de archivos
   * Verificar imágenes

7. **Mostrar imágenes**

   * `cv2.imshow()`
   * Ventanas
   * `waitKey()`
   * `destroyAllWindows()`

8. **Guardar imágenes**

   * `cv2.imwrite()`
   * Formatos
   * Crear copias

9. **Propiedades de una imagen**

   * `shape`
   * `size`
   * `dtype`
   * Número de canales

---

# Módulo 3. Manipulación básica de imágenes — Principiante

10. **Acceso a píxeles**

    * Leer píxeles
    * Modificar píxeles
    * Coordenadas

11. **Recortar imágenes**

    * ROI
    * Selección de regiones
    * Recorte mediante NumPy

12. **Redimensionar imágenes**

    * `resize()`
    * Escalamiento
    * Interpolación

13. **Rotar imágenes**

    * `getRotationMatrix2D()`
    * `warpAffine()`

14. **Voltear imágenes**

    * `flip()`
    * Horizontal
    * Vertical

15. **Trasladar imágenes**

    * Matrices de transformación
    * `warpAffine()`

---

# Módulo 4. Color y canales — Principiante/Intermedio

16. **Espacios de color**

    * BGR
    * RGB
    * HSV
    * Grayscale

17. **Conversión de colores**

    * `cvtColor()`
    * BGR → RGB
    * BGR → Grayscale
    * BGR → HSV

18. **Separación de canales**

    * `split()`
    * Canales B, G y R

19. **Unión de canales**

    * `merge()`

20. **Aplicaciones**

    * Detección de colores
    * Segmentación básica
    * Filtrado por color

---

# Módulo 5. Procesamiento básico de imágenes — Intermedio

21. **Imágenes en escala de grises**

    * Conversión
    * Aplicaciones

22. **Umbralización**

    * `threshold()`
    * Umbral binario
    * Umbral inverso

23. **Umbralización adaptativa**

    * `adaptiveThreshold()`
    * Iluminación variable

24. **Umbral de Otsu**

    * Método automático
    * Aplicaciones

25. **Operaciones aritméticas**

    * Suma
    * Resta
    * Multiplicación
    * División

26. **Operaciones bit a bit**

    * `bitwise_and()`
    * `bitwise_or()`
    * `bitwise_not()`
    * `bitwise_xor()`

---

# Módulo 6. Filtros y reducción de ruido — Intermedio

27. **Concepto de filtrado**

    * Ruido
    * Suavizado
    * Kernel

28. **Filtro promedio**

    * `blur()`

29. **Filtro Gaussiano**

    * `GaussianBlur()`

30. **Filtro de mediana**

    * `medianBlur()`

31. **Filtro bilateral**

    * `bilateralFilter()`

32. **Comparación de filtros**

    * Ruido
    * Calidad
    * Aplicaciones

---

# Módulo 7. Detección de bordes y características — Intermedio

33. **Bordes en imágenes**

    * Concepto
    * Gradientes
    * Detección de cambios

34. **Operador Sobel**

    * Eje X
    * Eje Y
    * Magnitud

35. **Operador Laplaciano**

    * `Laplacian()`

36. **Detector Canny**

    * `Canny()`
    * Parámetros
    * Aplicaciones

37. **Comparación de detectores**

    * Sobel
    * Laplacian
    * Canny

---

# Módulo 8. Contornos y formas — Intermedio

38. **¿Qué es un contorno?**

    * Concepto
    * Aplicaciones

39. **Encontrar contornos**

    * `findContours()`

40. **Dibujar contornos**

    * `drawContours()`

41. **Área y perímetro**

    * `contourArea()`
    * `arcLength()`

42. **Aproximación de contornos**

    * `approxPolyDP()`

43. **Detección de formas**

    * Triángulos
    * Cuadrados
    * Rectángulos
    * Círculos

44. **Aplicaciones**

    * Conteo de objetos
    * Clasificación de formas
    * Medición de objetos

---

# Módulo 9. Transformaciones geométricas — Intermedio

45. **Transformaciones afines**

    * Concepto
    * Matrices

46. **Traslación**

    * Desplazamiento de imágenes

47. **Rotación**

    * Ángulo
    * Centro
    * Escala

48. **Transformación de perspectiva**

    * `getPerspectiveTransform()`
    * `warpPerspective()`

49. **Corrección de perspectiva**

    * Documentos
    * Fotografías
    * Escaneado digital

---

# Módulo 10. Morfología matemática

50. **Conceptos básicos**

    * Erosión
    * Dilatación
    * Kernel

51. **Erosión**

    * `erode()`

52. **Dilatación**

    * `dilate()`

53. **Apertura**

    * `MORPH_OPEN`

54. **Cierre**

    * `MORPH_CLOSE`

55. **Gradiente morfológico**

    * `MORPH_GRADIENT`

56. **Aplicaciones**

    * Eliminación de ruido
    * Segmentación
    * Separación de objetos

---

# Módulo 11. Detección de objetos — Intermedio/Avanzado

57. **Conceptos de detección**

    * Objeto
    * Características
    * Región de interés

58. **Detección por color**

    * HSV
    * Máscaras
    * Rangos de color

59. **Detección mediante contornos**

    * Objetos
    * Áreas
    * Formas

60. **Detección de círculos**

    * `HoughCircles()`

61. **Detección de líneas**

    * Transformada de Hough
    * `HoughLines()`
    * `HoughLinesP()`

62. **Detección de objetos con Haar Cascade**

    * Concepto
    * Clasificadores
    * `CascadeClassifier`

---

# Módulo 12. Cámara y video

63. **Captura desde webcam**

    * `VideoCapture()`
    * Cámara predeterminada

64. **Leer video**

    * Archivos de video
    * Frames
    * FPS

65. **Procesar video**

    * Procesamiento frame por frame
    * Filtros
    * Detección

66. **Guardar video**

    * `VideoWriter()`
    * Codecs
    * Resolución
    * FPS

67. **Aplicaciones**

    * Cámara de seguridad
    * Contador de objetos
    * Detector de movimiento

---

# Módulo 13. Seguimiento de objetos

68. **Conceptos de tracking**

    * Detección vs seguimiento
    * Objetivo
    * Trayectoria

69. **Seguimiento básico**

    * Región de interés
    * Movimiento

70. **Trackers de OpenCV**

    * Concepto
    * Configuración
    * Seguimiento

71. **Seguimiento por color**

    * HSV
    * Máscaras
    * Centroide

72. **Seguimiento de múltiples objetos**

    * Identificación
    * Coordenadas
    * Trayectorias

---

# Módulo 14. Detección de movimiento

73. **Concepto de movimiento**

    * Frames consecutivos
    * Diferencias

74. **Background subtraction**

    * Fondo
    * Primer plano
    * `BackgroundSubtractor`

75. **Detección de objetos en movimiento**

    * Máscaras
    * Contornos
    * Áreas

76. **Proyecto**

    * Sistema básico de detección de movimiento

---

# Módulo 15. Reconocimiento facial

77. **Conceptos de reconocimiento facial**

    * Detección vs reconocimiento
    * Rostros
    * Características

78. **Detección de rostros**

    * Haar Cascade
    * Regiones faciales

79. **Detección de ojos**

    * Clasificadores
    * Regiones de interés

80. **Detección facial en video**

    * Webcam
    * Frames
    * Rectángulos

81. **Aplicaciones**

    * Control de acceso
    * Conteo
    * Sistemas de asistencia

---

# Módulo 16. OpenCV + NumPy + Matplotlib

82. **OpenCV y NumPy**

    * Arrays
    * Píxeles
    * Matrices

83. **OpenCV y Matplotlib**

    * Visualización
    * Comparación de imágenes
    * Histogramas

84. **OpenCV + Pandas**

    * Registro de resultados
    * Datos de detección
    * Exportación CSV

85. **Proyecto integrado**

    * Procesar imágenes
    * Analizar resultados
    * Generar gráficas

---

# Módulo 17. Visión artificial avanzada

86. **Histogramas de imágenes**

    * `calcHist()`
    * Histogramas de color
    * Ecualización

87. **Ecualización**

    * `equalizeHist()`
    * Contraste

88. **Segmentación**

    * Segmentación por color
    * Segmentación por regiones
    * Máscaras

89. **Watershed**

    * Segmentación avanzada
    * Separación de objetos

90. **Características de imágenes**

    * Puntos clave
    * Descriptores
    * Correspondencia

---

# Módulo 18. OpenCV + Machine Learning

91. **Preparación de imágenes**

    * Normalización
    * Redimensionamiento
    * Extracción de características

92. **Características para Machine Learning**

    * Píxeles
    * Histogramas
    * Descriptores

93. **Clasificación de imágenes**

    * Dataset
    * Entrenamiento
    * Predicción

94. **OpenCV + Scikit-learn**

    * Preparación de datos
    * Modelo
    * Predicción

95. **Evaluación**

    * Exactitud
    * Matriz de confusión
    * Resultados

---

# Módulo 19. OpenCV + Deep Learning — Avanzado

96. **Introducción al Deep Learning**

    * Redes neuronales
    * CNN
    * Visión artificial

97. **Módulo DNN de OpenCV**

    * `cv2.dnn`
    * Cargar modelos

98. **Clasificación mediante redes neuronales**

    * Imágenes
    * Predicciones

99. **Detección de objetos**

    * Bounding boxes
    * Confianza
    * Clases

100. **Procesamiento de modelos**

     * Entrada
     * Inferencia
     * Salida

101. **Aplicaciones**

     * Detección de objetos
     * Clasificación
     * Análisis de imágenes

---

# Módulo 20. Optimización y proyectos avanzados

102. **Optimización de procesamiento**

     * Reducción de resolución
     * Procesamiento eficiente
     * FPS

103. **Procesamiento en tiempo real**

     * Webcam
     * Video
     * Detección

104. **Organización de proyectos**

     * Carpetas
     * Código
     * Imágenes
     * Videos
     * Resultados

105. **Manejo de errores**

     * Archivos inexistentes
     * Cámaras
     * Formatos incompatibles

106. **Buenas prácticas**

     * Código modular
     * Documentación
     * Reutilización

---

# Módulo 21. Proyectos integradores

107. **Proyecto 1 — Procesamiento de imágenes**

* Lectura
* Redimensionamiento
* Recorte
* Filtros
* Guardado

108. **Proyecto 2 — Detector de formas**

* Contornos
* Área
* Perímetro
* Clasificación de formas

109. **Proyecto 3 — Detector de colores**

* HSV
* Máscaras
* Contornos
* Seguimiento

110. **Proyecto 4 — Detector de movimiento**

* Webcam
* Fondo
* Movimiento
* Registro de eventos

111. **Proyecto 5 — Contador de objetos**

* Detección
* Contornos
* Conteo
* Resultados

112. **Proyecto 6 — Detector facial**

* Webcam
* Rostros
* Regiones
* Conteo

113. **Proyecto 7 — Clasificador de imágenes**

* Dataset
* Preprocesamiento
* Machine Learning
* Predicción

114. **Proyecto 8 — Detector de objetos con IA**

* Modelo
* Inferencia
* Bounding boxes
* Confianza

115. **Proyecto final — Sistema de visión artificial**

* Captura de imágenes/video
* Preprocesamiento
* Segmentación
* Detección
* Seguimiento
* Clasificación
* Visualización
* Registro de resultados
* Presentación del proyecto

---

## Ruta de aprendizaje

| Nivel                      | Módulos | Competencia                                                            |
| -------------------------- | ------- | ---------------------------------------------------------------------- |
| 🟢 **Principiante**        | 1–4     | Leer, mostrar y manipular imágenes                                     |
| 🟡 **Intermedio**          | 5–10    | Procesar imágenes, detectar bordes, formas y objetos                   |
| 🟠 **Intermedio-Avanzado** | 11–16   | Trabajar con video, cámaras, tracking y visión artificial              |
| 🔴 **Avanzado**            | 17–20   | Aplicar Machine Learning, Deep Learning y procesamiento en tiempo real |
| 🔵 **Integrador**          | 21      | Desarrollar sistemas completos de visión artificial                    |

**Resultado esperado:** al finalizar, el estudiante podrá utilizar **OpenCV con Python y NumPy** para desarrollar aplicaciones de **procesamiento de imágenes, análisis de video, detección y seguimiento de objetos, reconocimiento facial y visión artificial basada en Machine Learning y Deep Learning**.
