# OBSERVAÇÃO
# NÃO ENTENDI COMO O PROFESSOR QUERIA QUE SORTEASSE OS VALORES COM LM NA C E NA D
# ENTÃO, FIZ O ALGORITMO MAS MANTIVE O SORTEIO ANTERIOR

set.seed(123)

rodadas <- 10000
# rodadas <- 1

LCG <- function(x0, a, c, M){
  generated_numbers <- c()
  current_x <- x0
  
  for (round in 1:M){
    result <- (a * current_x + c) %% M
    current_x <- result
    generated_numbers <- append(generated_numbers, result)
  }
  
  return(generated_numbers)
}

# Espera um número entre 0 e 1
caraOuCoroa <- function(number){
  if (number >= 0.5){
    return("Cara")
  }
  
  return("Coroa")
}

# x0 <- runif(1, min=0, max=100)
# a  <- runif(1, min=0, max=100)
# c  <- runif(1, min=0, max=100)
# M  <- runif(1, min=0, max=100)
# lcg <- LCG(x0, a, c, M)
# cat("LCG gave me the sequency: ", lcg)

g_caras <- 0
g_coroas <- 0
g_dados <- c(rep(0, 8))

g_questaoB <- 0

for(rodada in 1:rodadas){
  # Cara e coroa
  x0 <- runif(1, min=0, max=100)
  a  <- runif(1, min=0, max=100)
  c  <- runif(1, min=0, max=100)
  lcg <- LCG(x0, a, c, 1)
  resultado_cc <- caraOuCoroa(lcg)
  # cat("Resultado: ", resultado_cc, "\n")
  
  if (resultado_cc == "Cara"){
    g_caras <- g_caras + 1
  }
  else if (resultado_cc == "Coroa"){
    g_coroas <- g_coroas + 1
  }
  
  # Dados
  resultado_d <- runif(1, min=0, 8)
  resultado_d <- round(resultado_d)
  # cat("Lado obtido: ", resultado_d, "\n")
  g_dados[resultado_d] <- g_dados[resultado_d] + 1
  
  if (resultado_cc == "Coroa" & resultado_d == 5){
    g_questaoB <- g_questaoB + 1
  }
}

# A
cat("=== === LETRA A === ===\n")
cat(g_caras,  " caras obtidas\n")
cat(g_coroas, " coroas obtidas\n")
cat("=== === === === === ===\n\n")

# B
cat("=== === LETRA B === ===\n")
cat("Quantidade de vezes que Coroa e 5 foram obtidos: ", g_questaoB, "/", rodadas, "\n")
cat("=== === === === === ===\n\n")

# C

LM <- function(n){
  soma <- 0
  maior_num <- 2^n - 1
  
  for (n_atual in 1:n){
    sorteio <- round(runif(1, min=0, max=1))
    soma <- soma + (sorteio * (2^n_atual))
  }
  
  # cat("> Soma obtida: ", soma, "\n")
  # cat("> Número de iterações: 5\n")
  # cat("> Maior número possível: ", maior_num, "\n")
  return (soma/maior_num)
}

# cat("=== === LETRA C === ===\n")
# lm_5 = LM(5)
# cat("> Número sorteado: ", lm_5, "\n")
# cat("=== === === === === ===\n")
g_caras <- 0
g_coroas <- 0
g_dados <- c(rep(0, 8))

g_questaoC <- 0

for(rodada in 1:rodadas){
  # Cara e coroa
  x0 <- runif(1, min=0, max=100)
  a  <- runif(1, min=0, max=100)
  c  <- runif(1, min=0, max=100)
  lcg <- LCG(x0, a, c, 1)
  resultado_cc <- caraOuCoroa(lcg)
  # cat("Resultado: ", resultado_cc, "\n")
  
  if (resultado_cc == "Cara"){
    g_caras <- g_caras + 1
  }
  else if (resultado_cc == "Coroa"){
    g_coroas <- g_coroas + 1
  }
  
  # Dados
  resultado_d <- sample(
    c("1", "2", "3", "4", "5", "6", "7", "8"),
    size = 1,
    prob = c( rep(1/7, 2), 0, rep(1/7, 5) )
  )
  # cat("Lado obtido: ", resultado_d, "\n")
  g_dados[resultado_d] <- g_dados[resultado_d] + 1
  
  if (resultado_cc == "Coroa" & resultado_d == "8"){
    g_questaoC <- g_questaoC + 1
  }
}

cat("=== === LETRA C === ===\n")
cat("> Coroa e 8: ", g_questaoC, "/", rodadas, "\n")
cat("=== === === === === ===\n\n")

g_caras <- 0
g_coroas <- 0
g_dados <- c(rep(0, 8))

g_questaoD <- 0

for(rodada in 1:rodadas){
  # Cara e coroa
  x0 <- runif(1, min=0, max=100)
  a  <- runif(1, min=0, max=100)
  c  <- runif(1, min=0, max=100)
  lcg <- LCG(x0, a, c, 1)
  resultado_cc <- caraOuCoroa(lcg)
  # cat("Resultado: ", resultado_cc, "\n")
  
  if (resultado_cc == "Cara"){
    g_caras <- g_caras + 1
  }
  else if (resultado_cc == "Coroa"){
    g_coroas <- g_coroas + 1
  }
  
  # Dados
  resultado_d <- runif(1, min=0, 8)
  resultado_d <- round(resultado_d)
  # cat("Lado obtido: ", resultado_d, "\n")
  g_dados[resultado_d] <- g_dados[resultado_d] + 1
  
  if (
    (resultado_cc == "Cara" & resultado_d == "1") |
    (resultado_cc == "Cara" & resultado_d == "4") |
    (resultado_cc == "Coroa" & resultado_d == "7")
  ){
    g_questaoD <- g_questaoD + 1
  }
}

cat("=== === LETRA D === ===\n")
cat("> Cara e 1 | Cara e 4 | Coroa e 7 : ", g_questaoD, "/", rodadas, "\n")
cat("=== === === === === ===\n")