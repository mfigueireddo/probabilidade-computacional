set.seed(123)

rodadas <- 10000

global_pf_ajustados <- 0
global_tempo_total <- 0
global_custo_total <- 0

global_custo_menos_1.5m <- 0
global_tempo_menos_40m <- 0

for (index in 1:rodadas){
  distribuicao_dados <- sample(c(2, 3, 4), size=1, prob=c(0.2, 0.6, 0.2))
  requisito_desempenho <- sample(c(3, 4, 5), size=1, prob=c(0.1, 0.7, 0.2))
  reusabilidade <- sample(c(1, 2, 3), size=1, prob=c(0.1, 0.7, 0.2))
  complexidade_processamento <- sample(c(2, 3, 4, 5), size=1, prob=c(0.1, 0.6, 0.2, 0.1))
  outras_10 <- sample(c(1, 2, 3), size=1, prob=c(0.2, 0.6, 0.2))
  soma <- distribuicao_dados + requisito_desempenho + reusabilidade + complexidade_processamento + outras_10

  fator_ajuste <- 0.65 + 0.01 * soma

  pf_nao_ajustados <- 3500
  pf_ajustados <- pf_nao_ajustados * fator_ajuste
  global_pf_ajustados <- global_pf_ajustados + pf_ajustados
  
  produtividade_por_pf <- sample(c(4, 5, 6), size=1, prob=c(0.2, 0.7, 0.1))
  tempo_total <- pf_ajustados*produtividade_por_pf
  global_tempo_total <- global_tempo_total + tempo_total
  
  if (tempo_total/40 < 450){
    global_tempo_menos_40m <- global_tempo_menos_40m + 1
  }
  
  custo_por_hora <- sample(c(80, 100, 120), size=1, prob=c(0.2, 0.6, 0.2))
  custo_total <- tempo_total*custo_por_hora
  global_custo_total <- global_custo_total + custo_total
  
  if (custo_total < 1500000){
    global_custo_menos_1.5m <- global_custo_menos_1.5m + 1
  }
}

# a
print("> Pontos de Função (média):")
print(global_pf_ajustados/rodadas)

# b
print("> Semanas para desenvolvimento (média):")
print((global_tempo_total/40)/rodadas)

# c
print("> Custo total (médio):")
print(global_custo_total/rodadas)

# d
print("> Probabilidade do custo ser menor que R$1.500.000,00:")
print(global_custo_menos_1.5m/rodadas)

# e 
print("> Probabilidade do tempo ser menor que 450 semanas:")
print(global_tempo_menos_40m/rodadas)