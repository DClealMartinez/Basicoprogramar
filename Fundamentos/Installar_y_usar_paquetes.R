# instalar y usar paquetes ----
--------------------------------------------------------------
--------------------------------------------------------------

--------------------------------------------------------------
## instalear ----
--------------------------------------------------------------
#Los paquetes basicos utilizados en r  

install.packages("tidyverse")
install.packages("readxl")
install.packages("dplyr")
installed.packages("ggplot2")

--------------------------------------------------------------
## librerias----
--------------------------------------------------------------
# Normalmente se usa sección llamada librerias
# En esta sección se importan los paquetes basicos que se usar

library("tidyverse")
library("dplyr")
library("readxl")


--------------------------------------------------------------
## Cargar y Manipular Datos ----- 
#usando read.csv(), read.table(), dplyr, tidyverse 
--------------------------------------------------------------
# Cargar un archivo CSV
  
datos <- read.csv("directorio/carpeta/archivo.csv") #Ruta

# o en caso en la que este en la misma carpeta 

datos <- read.csv("archivo.csv")

# Cargar un archivo de texto delimitado, con encabezado

datos <- read.table("directorio/carpeta/archivo.csv", 
                    header = TRUE, sep = "\t")



# Cargar un archivo CSV con read_csv() del paquete readrxl

datos <- read_csv("directorio/carpeta/archivo.csv")

## Manipular datos de data frame----

--------------------------------------------------------------
## bases de datos precargada en r----
data <- as_tibble(mtcars)
data2 <- as_tibble(storms)
iris <- as_tibble(iris)
view(storms)
--------------------------------------------------------------
## traer bases de datos de github----
#install.packages("devtools")
#devtools::install_github("carpeta/libreria")
#library(libreria)
--------------------------------------------------------------
## Manipulación de datos----

# visualuzación
pollution <- as_tibble(CO2)
data #visualizar tabla
head(data) # ver primeros datos
tail(data) # ver ultimos datos
view(data) # ver la tabla o doble en la tabla en "Envioroment"

# Nombres de las columnas

colnames(data)
# Número de las columnas(en Python pd. shape[])

nrow(data)

#seleccionar columnas
# en Python: pd.loc [["colum 1", "column2]]

--------------------------------------------------------------

# tidyverse y dplyr----

## colección de librerias de ciencia de datos
## dplyr:: para llamar a la función de ese paquete
## Manipulacion de dataframe
# con opciones parecidad a la que haciamos en python

--------------------------------------------------------------
## verbos del paquete dplyr:----
?select
?filter
?arrange
?rename
?mutate
?summarise
?summarize
#?_%>% (pipe)

--------------------------------------------------------------
### select()----
--------------------------------------------------------------


#### select datos
  
# primero el nombre del "data frame", 
#seguido de los datos que se desean seleccionar
  
select(data2, status, pressure)

data2 %>% select(status, pressure)

# con "- " se pueden excluir columnas

select(data2, -name)
head(select(data2, -name)) # si se desea mostrar los primeros datos
data2 %>% select(-name)


data |>
  select(-mpg)

# se puede usar notacióm para seleccionar el rango

select(data2, lat:wind)

data2 %>% select(lat:wind)

# y de forma conjunta

select(data2, -(name:wind))

data2 %>% select(-(name:wind))

# con el paquete dplyr 

## seleccionar las columnas que emplizar con una letra

select(data2, starts_with("w"))

iris %>% select(starts_with("Sepal"))

# más de un argumento

iris %>% select(starts_with(c("Petal", "Sepal")))

##  selleccionar las columnas que terminan con una letra

select(data2, ends_with("e"))

iris %>% select(ends_with("Width"))

# más de un argumento
iris %>% select(ends_with(c("Width", "Length")))

## seleccionar tosdas las columnas

select(data2, everything())

iris %>% select(everything())

## selecionar las columnas que contienen un string

select(data2, contains("essure"))

iris %>% select(contains("al"))


## selecionar las variables que considen con expresiones regulares

iris %>% select(matches("[pt]al"))

?matches

## seleccionar variables por posición


billboard %>% select(num_range("wk", 10:15))


# Seleccionar solo las columnas 'nombre' y 'edad'

datos_seleccionados <- datos %>% select(nombre, edad)
--------------------------------------------------------------
###filter() ----
--------------------------------------------------------------
# Filtrar base de datos en una condición
## en Python: df[df["cyl"]== 6]

filter(data, cyl == 6)

data |>
  filter(cyl == 6)

filter(data2, wind >= 50)

data2 %>% filter(wind >= 50)

# se pueden incluit varias condiciones en un mismo filtro
# en el casos siguiente se especifican las tormentas con un nombre especifico

filter(data2, wind >= 50, name %in% c ("Alberto", "Alex", "Allison"))

# condiciones de comparación
## < menor
## > Mayor
## == igual que
## <= Menor o igual que
## >= Mayor o igual que
## != Diferente
## %in% perteneciente a un conjunto
## is.na  cualquiera verdadera
## !is.na cualquiera falsa

##?base::Logic
# & boolean and
# \ boolean or
# xor or inclusivo
# ! not
# any cualquiera verdadera
# all todas verdaderas

# ejemplo:
# con dos condiciones

filter(data2, wind>= 50 & pressure<1010)

# Filtrar filas donde la columna 'edad' es mayor de 30

mi_dataframe <- data.frame(
  id = 1:5,
  nombre = c("Ana", "Juan", "Pedro", "Lucía", "María"),
  edad = c(28, 34, 29, 45, 31)
)

resultado <- mi_dataframe %>% filter(edad > 30)

# Ver el resultado
print(resultado)


--------------------------------------------------------------
### arrange()----
--------------------------------------------------------------
# se utiliza para ordenar datos 
# por defecto lo ordena de forma ascendente

head(arrange (data2, wind)) # primeros datos
tail(arrange (data2, wind)) # ultimos datos

# si se quiero ordenar de forma descendiente

arrange (data2, desc(year))


# Ordenar datos por la columna 'edad' de manera descendente

datos_ordenados <- datos %>% arrange(desc(edad))

#se pueden ordenar filas segun la varible

arrange(data2, wind, year)
--------------------------------------------------------------
### rename()-----
--------------------------------------------------------------
# para renombrar variables
## cambiar el nombre a una variable
rename(data, "ejemplo"= mpg, "peso"= wt, "cilindros"= cyl)

data |>
  rename(data, "ejemplo"= mpg, "peso"= wt, "cilindros"= cyl)

# para el nombre se la variables a español
Huracanes <- data2 %>% rename(nombre = name, año = year, mes = month, 
                              dia = day, hora = hour, latitud = lat, 
                              longitud = long, typo = status, catergoria = category,
                              vientos = wind, presion = pressure, 
                              fuerza_tormeta = tropicalstorm_force_diameter,
                              fuerza_huracan = hurricane_force_diameter)

--------------------------------------------------------------
### mutate()-----
--------------------------------------------------------------
  
# crear variables temporales

mutate (Huracanes, radio=presion/vientos, inverso=radio^-1)

# se pueden utilizar funciones de otros paquetes
mutate (Huracanes, frec.acumuda= cumsum(vientos))

# Crear una nueva columna que es el doble de la columna 'edad'

data <- data %>% mutate(doble_mpg = mpg * 2)

# crear nueva variable



## df ["cilindros_nuevos"]= df["cyl]*2 en python

mutate(data,"ejemplo"= cyl * 2)

--------------------------------------------------------------

### summarise()----
--------------------------------------------------------------

#funciona de forma analogica a mutate pero creando nuevos "dataframe"

view(pollution)

# para obterner el resumen de la media y la varinza

summarise(pollution, mediana = median(conc), varianza = var(conc))

pollution %>% summarise(mediana = median(conc), varianza = var(conc))

#            Base
## min()      minimo
## max()      Maximo
## mean()     media
## median()   mediana, promedio
## sum()      suma
## var()      Varianza
## sd()       Desviación estandar

#            dlpyr
## first()      Primer valor en el vector
## last()       Ultimo valor en el vector
## n()          número de valores en el vector
## nth()        Extraer el valor que ocupa en la posición n del vector
## n_distinct() El # de valor distinto en el vector

--------------------------------------------------------------
### grup_by()----
--------------------------------------------------------------
# agrupa en conjunto de filas en un conjunto de filas resumen

# Agrupar la base de de datos pollution por variable "Type" y "uptake"

group_by(pollution, Type, uptake)

# Agrupar y resumen de datos 

# la Función es bastante util utilizando en conjunto con *summarise*

pollution %>%  group_by(Type) %>% summarise(media = mean(uptake), 
                                            sum = sum(uptake), n = n())


# Agrupar por una columna y calcular el promedio de otra columna

resumen <- iris %>%
  group_by(Species) %>%
  summarise(promedio_largo_petalos = mean(Petal.Length, na.rm = TRUE))

view(resumen)

# Ver datos basicos
summarise(data,
          "mean_disp"= mean(disp),
          "max_disp"= max(disp),
          "min_disp"= min(disp),
          "var_disp"= var(disp))
--------------------------------------------------------------
### pipes ----
--------------------------------------------------------------
  
# El operador pipeline %>% es util para conectar operaciones en dplyr

data %>% head()

# En el tidyverse 
 head(data)
data |>
  head()

# se pueden organizar datos para que se vean mejor

select(data, mpg, disp)

data |>
  select(mpg, disp)
 

# utilzar multiples funciones

data |>
  group_by(cyl) |>
  summarise("mean_wt"= mean(wt)) |>
  tail(1)


--------------------------------------------------------------
## Grafico: ggplot2----
--------------------------------------------------------------
  
install.packages("ggplot2")
library(ggplot2)
ggplot(data, aes(x = mpg, y = wt)) +
  geom_point()

