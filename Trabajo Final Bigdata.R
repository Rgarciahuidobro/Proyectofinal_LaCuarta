#Usando la libreria RVEST y ggplot2
library(rvest)
library('ggplot2')

# Inicializando la variable archivo con el nombre de mi pagina 
PaginaLaCuarta<-"https://www.lacuarta.com/canal/deportes/"

#Se lee el HTML de la página
  WebpageLaCuarta<-read_html(PaginaLaCuarta)
  
  #Extraccion contenido
    WebpageLaCuarta<-html_nodes(WebpageLaCuarta,'.tag-cat')
  #Traspaso de la informacion a texto  
    TextoLaCuarta<-html_text(WebpageLaCuarta)
print(texto) 

# Contando palabras
unlistTextoLaCuarta <- unlist(TextoLaCuarta)
tablaTextoLaCuarta <- table(unlistTextoLaCuarta)

# Transformando a data framtabla
contaLaCuarta <- as.data.frame(tablaTextoLaCuarta)

#Recorriendo la lista con funcion for
for(elementosdelalista in unlistTextoLaCuarta){
  print(elementosdelalista)
}

# Gráfico Barra
barplot(table(unlistTextoLaCuarta))





#para graficar
library('ggplot2')
