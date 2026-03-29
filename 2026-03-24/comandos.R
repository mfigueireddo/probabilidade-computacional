sequency <- 0:5
combination <- c(2, 3, sequency, 10)
combination_2times <- rep(combination, 2)
decimal_sequency <- seq(0, 5, 0.5)
decimal_sequency_5_nums <- seq(0, by=0.5, length=5)

# Vector operation
sequency <- sequency / 2

# Multiple vector operation
peso <- c(55, 60, 70, 85)
altura <- c(1.75, 1.6, 1.8, 1.8)
imc <- peso / (altura^2)

# Vector functions
menor_altura <- min(altura)
maior_altura <- max(altura)
limites_altura <- range(altura)
media <- mean(altura)
soma_alturas <- sum(altura)
quantas_altura <- length(altura)
menores_que_180 <- altura < 1.8
casa_do_170 <- altura >= 1.7 & altura < 1.8
fora_dos_170 <- altura < 1.7 | altura >= 1.8
primeira_altura <- altura[1]

# Diferentes classes
diverso <- c(TRUE, 1, "NBA")
correcao_logica <- as.logical(diverso)
correcao_numerica <- as.numeric(diverso[2])

# Matriz à partir de vetor
matriz <- matrix(sequency, nrow=2, ncol=3, byrow=TRUE)
tamanho_matriz <- length(matriz)
dimensoes_matriz <- dim(matriz)
matriz <- rbind(matriz, c(10, 10, 10))
matriz <- cbind(matriz, c(20, 20, 20))
primeiro_numero <- matriz[1, 1]
primeira_linha <- matriz[1, ]
primeira_e_segunda_linhas <- matriz[c(1,2),]
transposta <-  t(matriz)
# inversa = solve(matriz)
metade <- matriz / 2

aluguel <- c(1500, 2000, 3000)
condominio <- c(300, 500, 700)
iptu <- c(100, 150, 200)
apartamentos <- data.frame(aluguel, condominio, iptu)
primeiro_apartamento <- apartamentos[1,]
alugueis <- apartamentos$aluguel
alugueis_dataframe <- apartamentos["aluguel"]
apartamentos[1, 1] <- 1800
apartamentos <- rbind(apartamentos, c(4000, 900, 250))
apartamentos <- rbind(apartamentos, data.frame("aluguel" = 4000, "condominio" = 900, "iptu" = 250))
apartamentos <- apartamentos[-5, ] # Remove a 5a linha
apartamentos <- apartamentos[apartamentos$aluguel < 3000,  ]
apartamentos$valor_total <- sum(apartamentos$aluguel, apartamentos$condominio, apartamentos$iptu)
apartamentos$valor_total <- NULL
iptu <- apartamentos$iptu
apartamentos <- apartamentos[, -3] # Remove a 3a coluna
# str(apartamentos)
# names(apartamentos)
apartamentos <- cbind(apartamentos, iptu)
maior_preco <- sapply(apartamentos$aluguel, max)

preco <- c(10000, 20000, 30000)
condominio <- c(1000, 1500, 1600)
casas <- data.frame(preco, condominio)

imoveis_inclusivos <- merge(apartamentos, casas, all=TRUE)
imoveis_exclusivos <- merge(apartamentos, casas)