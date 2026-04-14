set.seed(123)
rodadas = 1000
A = 0
B = 0

sim_nao = c(TRUE, FALSE)
chances = c()
positivo_chances = c(0.95, 1 - 0.95)
negativo_chances = c(0.17, 1 - 0.17)

g_problema_fisico = 0

for(rodada in 1:rodadas){
  problema_fisico = sample(
    sim_nao,
    size = 1,
    prob = c(0.19, 1 - 0.19)
  )
  # cat("Apresenta problema físico? ", problema_fisico, "\n")
  
  if (problema_fisico){
    g_problema_fisico = g_problema_fisico + 1
    chances = positivo_chances
  } else{
    chances = negativo_chances
  }
  
  realmente_apresenta_problema = sample(
    sim_nao,
    size = 1,
    prob = chances
  )
  # cat("Realmente apresenta problema físico? ", realmente_apresenta_problema, "\n")
  
  if (problema_fisico & realmente_apresenta_problema){
    A = A + 1
  }
  if (!problema_fisico & !realmente_apresenta_problema){
    B = B + 1
  }
}

cat("Pessoas idosas avaliadas com problema que realmente apresentam: ", A, "\n")
cat(A, "/", rodadas, "=", A/rodadas*100, "% das pessoas idosas da cidade", "\n")
cat(A, "/", g_problema_fisico, "=", A/g_problema_fisico*100, "% das pessoas que foram inicialmente identificadas com problema físico", "\n")

cat("\n")

cat("Pessoas idosas avaliadas sem problema que realmente não apresentam: ", B, "\n")
cat(B, "/", rodadas, "=", B/rodadas*100, "% das pessoas idosas da cidade", "\n")
cat(B , "/", rodadas-g_problema_fisico, "=", B/(rodadas-g_problema_fisico)*100, "% das pessoas que não foram inicialmente identificadas com problema físico", "\n")