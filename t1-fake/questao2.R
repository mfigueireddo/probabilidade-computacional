set.seed(123)

rodadas <- 1000

g_area <- 0

g_ruim <- 0
g_media <- 0
g_boa <- 0
g_excelente <- 0

for(rodada in 1:rodadas){
  quantidade_pontos <- 3
  
  pontos <- data.frame(x=numeric(), y=numeric())
  
  for (dummy in 1:quantidade_pontos){
    x <- runif(1)
    y <- runif(1)
    # cat("x: ", x, " | ", "y: ", y, "\n")
    pontos <- rbind(pontos, data.frame(x=x, y=y))
  }
  
  # print("Dataframe de pontos")
  # print(pontos)
  
  area <- 1/2 * abs( 
    pontos[1, 1] * (pontos[2, 2] - pontos[3, 2]) + 
    pontos[2, 1] * (pontos[1, 2] - pontos[3, 2]) +
    pontos[3, 1] * (pontos[1, 2] - pontos[2, 2])
  )
  # cat("> Área: ", area, "\n")
  g_area <- g_area + area
  
  if (area < 0.05){
    g_ruim <- g_ruim + 1
  }
  else if (area >= 0.05 & area < 0.1){
    g_media <- g_media + 1
  }
  else if (area >= 0.1 & area < 0.2){
    g_boa <- g_boa + 1
  }
  else if (area >= 0.2){
    g_excelente <- g_excelente + 1
  }
}

cat("> Área coberta (em média): ", g_area/rodadas, "\n\n")

cat("> Cobertura ruim (em média): ", g_ruim/rodadas, "\n")
cat("> Cobertura média (em média): ", g_media/rodadas, "\n")
cat("> Cobertura boa (em média): ", g_boa/rodadas, "\n")
cat("> Cobertura excelente (em média): ", g_excelente/rodadas, "\n")
# cat("> Soma das coberturas: ", (g_ruim + g_media + g_boa + g_excelente)/rodadas )