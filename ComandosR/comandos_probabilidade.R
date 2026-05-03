set.seed(123)

random_number <- runif(1)
random_numbers <- runif(5, min=0, max=10)

moedas <- c("Cara", "Coroa")
sorteada <- sample(moedas, size=1, prob=c(1/2, 1/2))
print(sorteada)

sprintf("%d", 10 %/% 3)
sprintf("%d", 10 %% 3)