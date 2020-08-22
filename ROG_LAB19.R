# Hecho con gusto por Rodrigo Ortega García
#V7
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# faceting (romper un gráfica en varias dentro de una cuadrícula)



#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)

# cargando datos a entorno
data("gapminder")

# filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


# colocando grafica base
p <- ggplot(data = gapminder2007,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent)) + 
  geom_point()

# crear objeto p
p

# facet_wrap (recomendado con una variable)
p + facet_wrap(~ continent)

# manipulando número de filas
p + facet_wrap(~ continent, nrow = 1)

# manipulando número de columnas
p + facet_wrap(~ continent, ncol = 2)



# facet con dos variables
# creando data para 2002 y 2007
gapminder02_07 <- gapminder[gapminder$year %in% c("2002","2207"), ]

# creando grafica base "g2"
g2 <- ggplot(data = gapminder02_07,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent)) + 
  geom_point()


#esperanza de vida por continente y año (forma 1)
g2 + facet_grid(continent ~ year)

#esperanza de vida por continente y año (forma 2)
g2 + facet_grid(year ~ continent)
