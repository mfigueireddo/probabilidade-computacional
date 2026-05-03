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

---

### Teoria dos Conjuntos

**Leis de Morgan**
```
complemento ( A união B ) = complemento(A) intersecção complemento(B)
complemento ( A intersecção B ) = complemento(A) união complemento(B)
```

**Princípio da Adição**: se 2 conjuntos não tem nenhum elemento em comum
```
len( A união B ) = len(A) + len(B)
```

**Princípio da Multiplicação**
```
decisão 1 = n maneiras
decisão 2 = m maneiras
decisão 1 **E** decisão 2 = n * m
```

**Princípio de Inclusão-Exclusão**
```
len ( a união b ) = len(a) + len(b) - len( a intersecção b )
len ( a união b união c ) = len(a) + len(b) + len(c) - len( a intersecção b ) - len( a intersecção c ) - len ( b intersecção c) + len ( a intersecção b intersecção c )
```

**Teoria das Probabilidades**
```
chance de algo acontecer = número de casos favoráveis / número de casos possíveis
0 < chance de algo acontecer < 1
```

**Permutação Simples**
Contar quantas ordens diferentes existem usando todos os elementos
```
P = n!
```
Exemplo: quantas ordens diferentes podemos organizar as letras A, B, C?
Resposta: n! -> 3 * 2 * 1 = 6 = 3!

**Permutação com Repetição**
Contar quantas ordens diferentes existem usando todos os elementos MAS com a repetição de elementos
```
P = n! / quantidade de repetições de cada elemento!
```
Se tiverem múltiplos elementos repetidos: / r1! r2! ...
Exemplo: quantas ordens diferentes podemos organizar a palavra ANA?
Resposta: 3! / 2! -> 3 letras, sendo que A se repete 2x

**Permutação Circular**
Contar quantas ordens diferentes existem usando todos os elementos PORÉM em um círculo, ou seja, a posição não importa - basta girar o círculo
```
P = n! / n = (n - 1)!
```
Exemplo: quantas ordens diferentes podemos organizar 4 pessoas numa roda?
Resposta: 3!
roda(1): uma pessoa vai estar aqui 
roda(2): qq outra pessoa (3) 
roda(3): qq outra pessoa (2) 
roda(4): qq outra pessoa (1)
sabemos que roda(1) será uma pessoa "fixa" porque se girarmos a roda a pessoa que está em (2) pode ser a que está em (1)
Logo, 3 * 2 * 1 = 6 = 3!

**Permutação Caótica**
Ninguém fica na posição orignal
```
P = n! * (1 - 1/1! + 1/2! - 1/3! + ...)
```
Exemplo: 3 pessoas estão sentadas em seus lugares. De quantas formas podemos rearrumar para que ninguém sente no seu?
Resposta: 2 -> 3! * (1 - 1/1! + 1/2! + 1/3!) = 3! * (1 - 1 + 1/2 + 1/6) = 3! * (2/6) = 2

**Aranjo**
Escolher p elementos entre n, sendo que a ordem importa
```
A = n! / (n - p)!
```
n = elementos totais
p = elementos a serem distribuídos
Exemplo: escolher 3 de 5 pessoas para o pódio
Resposta: 5! / (5 - 3)! = 5! / 2! = 60

**Combinação Simples**
Escolher p elementos entre n, sendo que a NÃO ordem importa
```
C = n! / p! * (n - p)!
```
n = elementos totais
p = elementos a serem distribuídos
Exemplo: escolher 3 de 5 pessoas para um grupo
Resposta: 5! / 3! * (5 - 3)! = 5! / 3! * 2! = 10

**Combinação Complementar**
Combinação Simples mas, ao invés de escolher quantos ficam de dentro (p), você escolhe quantos ficam de fora (n - p)
```
C = n! / (n - p)! * (n - (n - p))!
```
n = elementos totais
p = elementos a serem distribuídos
Exemplo: escolher 3 de 5 pessoas para um grupo. Na real, pensar em 2 de 5 para excluir.
Resposta: 5! / (5-3)! * (5 * (5 - 3))! = 5! / 2! * (5 * 2)! = 5! / 2! * 10! = ...

**Combinação Completa (com repetição)**
Pode repetir elementos, mas ordem não importa
```
C = (n + p - 1)! / p! * ((n + p - 1) - p)!
```
n = elementos totais
p = elementos a serem distribuídos
Exemplo: escolher 2 bolas de sorvete tendo 3 sabores disponíveis
Resposta: (3 + 2 - 1)! / 2! * ((3 + 2 - 1) - 2)! = 4! / 2! * 2! = 24 / 4 = 6

**Conjunto Potência**
P(A) = todos os possíveis subconjuntos de A
```
A = {x, y}
P(A) = { vazio, {x}, {y}, {x, y} }
```
número de subconjuntos = 2^n
n = número de elementos do conjunto