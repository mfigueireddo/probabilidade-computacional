set.seed(123)

getReducaoVida <- function(id){
  if (id == "Leve"){
    return(0.01)
  }
  if (id == "Moderado"){
    return(0.03)
  }
  if (id == "Severo"){
    return(0.06)
  }
}

getCusto <- function(id){
  if (id == "Leve"){
    return(300)
  }
  if (id == "Moderado"){
    return(400)
  }
  if (id == "Severo"){
    return(800)
  }
}

printEstado <- function(vida, custo){
  # cat("\n", "=== === ===", "\n")
  # cat("Vida atual:", vida, "\n")
  # cat("Custo atual: R$", custo, "\n")
  # cat("=== === ===", "\n\n")
}

rodadas = 1000
horas = 24

mortes_global = 0
custo_global = 0
falha_inesperada_global = 0

for(rodada in 1:rodadas){

  vida = 1
  custo = 0
  mortes = 0
  
  for(hora in 1:horas){
    
    # cat("\n", "=== RODADA", hora, "===", "\n")
    
    printEstado(vida, custo)
    
    # Falha inesperada
    chance_falha_inesperada = 0.0005 + 0.004 * (1 - vida)
    falha_inesperada = sample(
      c(TRUE, FALSE),
      size = 1,
      prob = c(chance_falha_inesperada, 1 - chance_falha_inesperada)
    )
    # cat("Falha inesperada:", falha_inesperada, "\n")
    if (falha_inesperada){
      mortes = mortes + 1
      custo = custo + 2000
      falha_inesperada_global = falha_inesperada_global + 1
      printEstado(vida,custo)
      
      vida = 1
      next
    }
    
    # Falha "esperada"
    falha_total = sample(
      c("Leve", "Moderado", "Severo"),
      size = 1,
      prob = c(0.7, 0.2, 0.1),
    )
    reducao_vida = getReducaoVida(falha_total)
    custo_falha = getCusto(falha_total)
    # cat("Falha", falha_total, "gerou perda de", reducao_vida, "da vida útil e um custo de R$", custo_falha, "\n")
    vida = vida - reducao_vida
    custo = custo + custo_falha
    
    if (vida <= 0){
      mortes = mortes + 1
      printEstado(vida, custo)
      
      vida = 1
      next
    }
    
    printEstado(vida, custo)
  }
  
  mortes_global = mortes_global + mortes
  custo_global = custo_global + custo
  
}

cat("\n", "=== RESUMO ===", "\n")
cat(mortes_global/rodadas, "substituições por rodada (em média)\n")
cat(custo_global/rodadas, "custo por rodada (em média)\n")
cat(falha_inesperada_global/rodadas, "falha inesperadas por rodada (em média)\n")