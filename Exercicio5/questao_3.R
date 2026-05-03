calculaDistancia <- function(x0, y0, x1, y1){
    return( sqrt( (x1-x0)^2 + (y1-y0)^2 ) )
}

set.seed(123)

n_pontos = 1000

dentro_area = 0

for(ponto in 1:n_pontos){
    x = runif(1, min=0, max=1)
    y = runif(1, min=0, max=1)
    distancia = calculaDistancia(0, 0, x, y)
    if (distancia > 1 & x > 0.5){
        dentro_area = dentro_area + 1
    }
}

probabilidade_dentro = dentro_area / n_pontos
area_total = 1
# probabilidade_dentro = area_cinza / area_total, então...
area_cinza = probabilidade_dentro * area_total

altura = 6
preco = 250
gasto = (area_cinza * altura) * preco

cat("Foram gastos", gasto, "reais")