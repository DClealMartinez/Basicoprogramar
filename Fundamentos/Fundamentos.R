# Fundamentos de R  ----
--------------------------------------------------------------
--------------------------------------------------------------
  
--------------------------------------------------------------
## Directorio y Archivos ----
--------------------------------------------------------------

#Muestra en directorio(carpeta) o wordspace de archivo por defecto

getwd() 

?getwd
#Objetos en el directorio

ls() 

#Lista de todos los archivos en el directorio

list.files() 
dir()

### crear un nuevo directorio y archivo----

dir.create("testdir")

#seleccionar el directorio creado

setwd("testdir")

#crear un archivo

file.create("mytest.R")

#salir del archivo

file.exists("mytest.R")

#información del archivo

file.info("mytest.R")

# Cambiar de nombre al archivo

file.rename("mytest.R", "mytest2.R")

# eliminar un archivo

file.remove('mytest.R')

#Copiar el archivo

file.copy("mytest2.R", "mytest3.R")

#Para crear un directorio y un archivo independiente al que se esta trabajado
## crear un archivo independiente

file.path("mytest3.R")

## crear un directorio independiente

file.path('folder1','folder2')

## cear un directorio con carpetas independiente

dir.create(file.path('testdir2', 'testdir3'), recursive = TRUE)


--------------------------------------------------------------
## Sintaxis Basica ----
--------------------------------------------------------------
--------------------------------------------------------------
  
--------------------------------------------------------------
### Secuencias ----
--------------------------------------------------------------

# secuencia de un número  hasta otro

1:20 #Respuesta esperada:
#[1] 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

pi:10#Respuesta esperada:
#[1] 3.141593 4.141593 5.141593 6.141593 7.141593 8.141593 9.141593

15:1 #Respuesta esperada
#[1] 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1
seq(1, 20)#Respuesta esperada:
#[1] 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20

#secuencia con saltos

seq(0, 10, by=0.5)#Respuesta esperada:
# [1]  0.0  0.5  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5
# [19]  9.0  9.5 10.0

#incrementos en decimales

seq(5, 10,length=30) #Respuesta eperada:
# [1]  5.000000  5.172414  5.344828  5.517241  5.689655  5.862069  6.034483  6.206897  6.379310
# [10]  6.551724  6.724138  6.896552  7.068966  7.241379  7.413793  7.586207  7.758621  7.931034
# [19]  8.103448  8.275862  8.448276  8.620690  8.793103  8.965517  9.137931  9.310345  9.482759
# [28]  9.655172  9.827586 10.000000

# Nombrar secuencia

my_seq <- seq(5, 10, length=30)

# El largo de la secuencia
length(my_seq)

# crear una secuencia con el largo de la secuencia

1: length(my_seq)
seq(along.with = my_seq)# otra forma de hacer lo mismo
seq_along(my_seq) # y otra más

# crear secuencia con repeticiones

rep(0, times = 40) # repetir "0" cuarenta veces
rep(c(0, 1, 2),times = 10) # repetir "0,1,2" 10 veces
rep(c(0, 1, 2), each = 10) # repetir "0,1,2" cada uno 10 veces

--------------------------------------------------------------
### vectores ----
--------------------------------------------------------------
# los vectores equivalen a las listas en Python
#### 1. vector númerico ----

numeros <- c(1, 2, 3, 4, 5)

print(numeros)

Numero<- c(25,26,27,28,30)

num_vect <-c (0.5, 55, -10, 6)

#### 2. Vector de caracteres ----

caracteres <- c("a", "b", "c", "d")
print(caracteres)
mi_vector_nombres<- c("camilo","carolina","lina","Lucas")

# crear cadenas

mi_cadena<- c("Mi", "nombre", "es")

# unir elemento de una cadena

paste(mi_cadena, collapse = " ")

# respeusta esperada: [1] "Mi nombre es"

mi_nombre <- c(mi_cadena, "Carolina")

#usando la frase que usa primero para programar en python
paste("Hello", "world!", sep = " ") #sep = espacio
# repuesta esperada:"Hello world!"

#### 3. Vecor logico ----
logicos <- c(TRUE, FALSE, TRUE, FALSE)
print(logicos)

# un vector logio apatir de uno númerico
tf <- num_vect < 1 # r le dara un valor "TRUE" o "FALSE" a cada valor
print(tf)

#lo mismo sucedera en la siguiente expresion
num_vect >= 6 # mayor o igual a 6

# lo mismo se puede hacer con números y expresiones logicas

(3 > 5) & (4 == 4) #Respuesta esperada: FALSE
(TRUE == TRUE) | (TRUE == FALSE) # Respuesta esperada: TRUE
((111 >= 111) | !(TRUE)) & ((4 + 1) == 5) #Respuesta esperada: TRUE




### Acceder a un elemto de un vector----
# r es estricto con los tipos de datos
# OJO  los indices arrancan en 1

Numero[0]
Numero[1]
Numero[1:3]
--------------------------------------------------------------
## Lista----
--------------------------------------------------------------
# las listas pueden ser utilizadas como diccionarios en python
### crear una lista:Basico ----
mi_lista <- list(numeros = c(1, 2, 3), letras = c("a", "b", "c"))

#en las listas no tiene que ser del mismo tipo
mi_list <- list(TRUE,"CAMILO", 34)



### Lista en lista ----



mi_lista_nombrada <- list("Pais"="Colombia",
                          "Capital"= "Bogotá",
                          "Habitantes"=500000,
                          "Es_latam"=TRUE,
                          "fechas importantes"= list("Independencia"="20 de julio",
                                                    "Batalla Boyacá"="7 de agosto"))

#Tambien puedo nombrar los elemetos en una lista
mi_salida1 <- mi_lista_nombrada["Es_latam"]



### Acceder a los elemtos de una lista ----

#### 1.Acceso por índice ----

# Acceder al primer elemento (un vector de números)
mi_lista[[1]]  # Resultado: c(1, 2, 3)


#### 2. Acceder por nombre ----

# Acceder al elemento con nombre "letras"
mi_lista$letras  # Resultado: c("a", "b", "c")

--------------------------------------------------------------
## Dataframe ----
--------------------------------------------------------------
  
mi_dataframe <- data.frame(
  id = 1:3,
  nombre = c("Ana", "Juan", "Pedro"),
  edad = c(28, 34, 29)
)

## Datos tabulares

mi_tabla <- data.frame(
  nombres = mi_vector_nombres, #usar un vector ya existente
  edades = 30,25,24,40,
  es_estudiante = c(FALSE,TRUE,TRUE,TRUE)
)

### Acceder a los elemtos de  un Dataframe ----

#### 1. por nombre de columna----

# Acceder a la columna "nombre"
mi_dataframe$nombre  # Resultado: c("Ana", "Juan", "Pedro")

#### 2.Por fila y coluna especifica  ----

# Acceder al valor en la primera fila, segunda columna
mi_dataframe[1, 2]  # Resultado: "Ana"

#### 3. Acceder por columa ----

# Acceder a la tercera columna (edad)
mi_dataframe[, 3]  # Resultado: c(28, 34, 29)

#### 4. Acceder por fila ----
# Acceder a la segunda fila completa
mi_dataframe[2, ]  # Resultado: data.frame(id = 2, nombre = "Juan", edad = 34)


