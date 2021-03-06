#Usando la libreria RVEST y ggplot2
library(rvest)
library('ggplot2')

# Inicializando la variable archivo con el nombre de mi pagina 
PaginaLaCuarta<-"https://www.lacuarta.com/canal/deportes/"

#Se lee el HTML de la p�gina
  WebpageLaCuarta<-read_html(PaginaLaCuarta)
  
  #Extraccion contenido
    WebpageLaCuarta<-html_nodes(WebpageLaCuarta,'.tag-cat')
  #Traspaso de la informacion a texto  
    TextoLaCuarta<-html_text(WebpageLaCuarta)
print(TextoLaCuarta) 

# Contando palabras
unlistTextoLaCuarta <- unlist(TextoLaCuarta)
tablaTextoLaCuarta <- table(unlistTextoLaCuarta)

# Transformando a data framtabla
TablaLaCuarta <- as.data.frame(tablaTextoLaCuarta)

#Recorriendo la lista con funcion for
for(elementosdelalista in unlistTextoLaCuarta){
  print(elementosdelalista)
}

# Gr�fico Barra
barplot(table(unlistTextoLaCuarta))


write.csv(TablaLaCuarta,file="TablaLaCuarta.csv")







  