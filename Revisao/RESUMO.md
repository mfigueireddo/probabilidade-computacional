### Pontos de Função

**Fator de Ajuste (FA)**
```
FA = 0.65 + 0.01 * Soma das características
```
Pode ser sorteado também

**Pontos de Função (PF)**
```
PFajustado = PFnão-ajustado * FA
```
PFnão-ajustado são apenas os Pontos de Função não ajustados (sem peso)

---

### R

**Função básica de sorteio**
```
sample(
    combinação com os valores a serem sorteados,
    quantos valores devem ser sorteados (size),
    probabilidade de cada valor ser sorteado (prob)
)
```
Caso a probabilidade não seja informada, ela será proporcional para todos os valores

**Loops**
```
for(index in 1:n)
```
Sendo n NECESSARIAMENTE um número

**Matriz**
```
data.frame(
    nome da linha = combinação de valores,
    nome da linha = combinação de valores,
    nome da linha = combinação de valores
)

data.frame(
    nome da linha = numeric(),
    nome da linha = numeric()
)

linha da matriz = matriz[linha, ]

matriz aumentada = rbind(matriz, data.frame(x=..., y=...))
```

**Repetição**
```
rep(
    número/combinação a ser repetido(a), 
    número de repetições (times),
    número de repetições de cada elemento (each),
    comprimento da combinação gerada (length.out)
)
```

**Sortear um número entre um intervalo de valores**
```
runif(
    quantidade de vezes,
    valor mínimo (min),
    valor máximo (max)
)
```

**Arrendondamento e módulo** 
```
round()
abs()
```

**LCG**
[Aqui](gerador_lcg.R)