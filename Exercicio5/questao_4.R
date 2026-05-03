escolheIntervaloAleatorio <- function(probabilidades, n){
    intervalos_escolhidos = c()
    valores_aleatorios = runif(n, min=0, max=1)
    n_intervalos = length(probabilidades)

    for(i in 1:n){
        probabilidade_acumulada = probabilidades[1]

        for(intervalo in 0:(n_intervalos-1)){

            if (valores_aleatorios[i] <= probabilidade_acumulada){
                intervalos_escolhidos = append(intervalos_escolhidos, intervalo)
                break
            }

            probabilidade_acumulada = probabilidade_acumulada + probabilidades[intervalo + 2]
        }
    }
    return(intervalos_escolhidos)
}

probabibilidades = c(0.2, 0.5, 0.3)
n = 5
intervalos_gerados = escolheIntervaloAleatorio(probabibilidades, n)
print(intervalos_gerados)