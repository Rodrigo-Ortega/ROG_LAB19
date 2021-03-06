# Hecho con gusto por Rodrigo Ortega Garc�a
#V7
# LABORATORIO - Gr�ficos en R con ggplot2 para Ciencia de Datos
# faceting (romper un gr�fica en varias dentro de una cuadr�cula)



#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)

# cargando datos a entorno
data("gapminder")

# filtrando por a�o 2007
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

# manipulando n�mero de filas
p + facet_wrap(~ continent, nrow = 1)

# manipulando n�mero de columnas
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


#esperanza de vida por continente y a�o (forma 1)
g2 + facet_grid(continent ~ year)

#esperanza de vida por continente y a�o (forma 2)
g2 + facet_grid(year ~ continent)
