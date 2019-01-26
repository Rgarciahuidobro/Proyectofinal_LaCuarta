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


    Df<-data.frame()
    for(i in 1:29){
      pagina<-paste('https://www.lacuarta.com/l4-sabado/page/',i,sep = "")
      print(page)
      
      #Leyendo la pagina web 
      WebpageLaCuarta1<-read_html(pagina)
      
      #Extrayendo contenido de todas la pagina
      WebpageLaCuarta<-html_nodes(WebpageLaCuarta1,'.tag-cat')
     
       #Traspasando la informacion a texto
      TextoLaCuarta<-html_text(WebpageLaCuarta)
      
      #Limpiando el texto
      TextoLimpioLC<-gsub("\t","",TextoLaCuarta)
      TextoLimpioLC<-gsub("\n","",TextoLimpioLC)
      
     #Creacion de dataframe
       NuevoDataFrameLC<-data.frame(a=TextoLimpioLC)
      Df<-rbind(Df,NuevoDataFrameLC)
    }

#grafico de barra
 barplot(table(Df))

 write.csv(Df, file = "Df.csv")
 