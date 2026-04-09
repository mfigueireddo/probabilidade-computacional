set.seed(123)
rodadas = 1000

matriz = data.frame(
  ir_ao_1 = c(0.6, 0.2, 0.1),
  ir_ao_2 = c(0.3, 0.5, 0.3),
  ir_ao_3 = c(0.1, 0.3, 0.6)
)

estado_atual = 2

contador = c(rep(0,3))

for (rodada in 1:rodadas){
  contador[estado_atual] = contador[estado_atual] + 1
    
  chances = matriz[estado_atual, ]

  proximo_estado = sample(
    c(1, 2, 3),
    size = 1,
    prob = chances
  )

  estado_atual = proximo_estado
}

cat("Estado 1: ", contador[1], " de ", rodadas, " rodadas, = ", contador[1]/rodadas*100, "% ", "\n")
cat("Estado 2: ", contador[2], " de ", rodadas, " rodadas, = ", contador[2]/rodadas*100, "% ", "\n")
cat("Estado 3: ", contador[3], " de ", rodadas, " rodadas, = ", contador[3]/rodadas*100, "% ", "\n")

# Estado 1:  279  de  1000  rodadas, =  27.9 %  
# Estado 2:  389  de  1000  rodadas, =  38.9 %  
# Estado 3:  332  de  1000  rodadas, =  33.2 %  