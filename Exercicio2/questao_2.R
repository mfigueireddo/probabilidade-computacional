# NÃO TERMINEI DE FAZER.
# FALTA D, E, F

set.seed(123)

rodadas <- 10000

entradas_externas <- 25
saidas_externas <- 20
consultas_externas <- 15
arquivos_logicos_internos <- 12
arquivos_interface_externa <- 8

soma_caracteristicas <- 0

AplicaPeso <- function(resultado, pesos){
  if (resultado == "Simples"){
    # cat("Peso aplicado: ", pesos[1], "\n")
    return(pesos[1])
  }
  if (resultado == "Média"){
    # cat("Peso aplicado: ", pesos[2], "\n")
    return(pesos[2])
  }
  if (resultado == "Complexa"){
    # cat("Peso aplicado: ", pesos[3], "\n")
    return(pesos[3])
  }
}

for (rodada in 1:rodadas){
  
  # Entrada Externa
  # cat(entradas_externas, " rodadas para entrada externa\n")
  for(rodada_sorteio in 1:entradas_externas){
    EE <- sample(
      c("Simples", "Média", "Complexa"),
      size = 1,
      prob = c(0.3, 0.5, 0.2)
    )
    # cat("Dificuldade das entradas externas: ", EE, "\n")
    soma_caracteristicas <- soma_caracteristicas + AplicaPeso(EE, c(3, 4, 6))
  }
  
  # Saída Externa
  # cat(saidas_externas, " rodadas para saídas externas\n")
  for(rodada_sorteio in 1:saidas_externas){
    SE <- sample(
      c("Simples", "Média", "Complexa"),
      size = 1,
      prob = c(0.25, 0.6, 0.15)
    )
    # cat("Dificuldade das saídas externas: ", SE, "\n")
    soma_caracteristicas <- soma_caracteristicas + AplicaPeso(SE, c(4, 5, 7))
  }
  
  # Consulta Externa
  # cat(consultas_externas, " rodadas para consultas externas\n")
  for(rodada_sorteio in 1:consultas_externas){
    CE <- sample(
      c("Simples", "Média", "Complexa"),
      size = 1,
      prob = c(0.4, 0.4, 0.2)
    )
    # cat("Dificuldade das consultas externas: ", CE, "\n")
    soma_caracteristicas <- soma_caracteristicas + AplicaPeso(CE, c(3, 4, 6))
  }
  
  # Arquivo Lógico Interno
  # cat(arquivos_logicos_internos, " rodadas para arquivos lógicos internos\n")
  for(rodada_sorteio in 1:arquivos_logicos_internos){
    ALI <- sample(
      c("Simples", "Média", "Complexa"),
      size = 1,
      prob = c(0.2, 0.5, 0.3)
    )
    # cat("Dificuldade dos arquivos lógicos internos: ", ALI, "\n")
    soma_caracteristicas <- soma_caracteristicas + AplicaPeso(ALI, c(7, 10, 15))
  }
  
  # Arquivo de Interface Externa
  # cat(arquivos_interface_externa, " rodadas para arquivos de interface externa\n")
  for(rodada_sorteio in 1:arquivos_interface_externa){
    AIE <- sample(
      c("Simples", "Média", "Complexa"),
      size = 1,
      prob = c(0.35, 0.45, 0.2)
    )
    # cat("Dificuldade do arquivos de interface externa: ", AIE, "\n")
    soma_caracteristicas <- soma_caracteristicas + AplicaPeso(AIE, c(5, 7, 10))
  }
  
}

fa <- sample(
  c(1.05, 1.15, 1.25),
  size = 1,
  prob = c(0.2, 0.6, 0.2)
)
cat("Fator de Ajuste (FA) sorteado: ", fa, "\n")

pf <- soma_caracteristicas * fa

horas_por_pf <- sample(
  c(4, 5, 6),
  size = 1,
  prob = c(0.2, 0.6, 0.2)
)
cat("Produtividade (horas/PF) sorteada: ", horas_por_pf, "\n")

custo_por_hora <- sample(
  c(80, 100, 120),
  size = 1,
  prob = c(0.2, 0.6, 0.2)
)
cat("Custo da hora (R$) sorteado: ", custo_por_hora, "\n")

# A

cat("\n")

pfa <- pf/rodadas
cat("A) Valor médio esperado de Pontos de Função Ajustados (PFA): ", pfa, "\n")

# B

semanas <- (pfa*horas_por_pf)/40
cat("B) Tempo médio em semanas (de 40h) para o desenvolvimento: ", semanas, "\n")

# C

custo <- (pfa*horas_por_pf)*custo_por_hora
cat("C) Custo médio do sistema (R$): ", custo, "\n")

cat("\n")