a = c(1, 5, 20, 100)
b = c(2, 30, -10)

produto_cartesiano = c()

for(i in 1:length(a)){
    for (j in 1:length(b)){
        produto_cartesiano = append(produto_cartesiano, list(c(a[i], b[j])))
    }
}

cat("Produto Cartesiano:", "\n")
for(par_ordenado in produto_cartesiano){
    cat("(", par_ordenado[[1]], ",", par_ordenado[[2]], ")", "\n")
}

# --- --- --- --- --- --- --- --- ---

fatorial <- function(n){
    pfatorial = 1
    i = 1
    while(i <= n){
        pfatorial = pfatorial * i
        i = i + 1
    }
    return(pfatorial)
}

resultado = fatorial(5)
cat("Fatorial:", resultado, "\n")

arranjo <- function(n, p){
    return( fatorial(n) / fatorial(n - p) )
}

resultado = arranjo(8, 5)
cat("Arranjo:", resultado, "\n")

combinacao <- function(n, p){
    return( fatorial(n) / fatorial(p) * fatorial(n - p) )
}

resultado = combinacao(2, 6)
cat("Combinação:", resultado, "\n")

combinacao_complementar <- function(n, p){
    return( combinacao(n, n-p) )
}

resultado = combinacao_complementar(2, 6)
cat("Combinação Complementar:", resultado, "\n")

combinacao_completa <- function(n, p){
    return( combinacao(n+p-1, p) )
}

resultado = combinacao_completa(2, 6)
cat("Combinação Completa:", resultado, "\n")