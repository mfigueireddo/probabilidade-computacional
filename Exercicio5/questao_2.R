set.seed(123)

rodadas = 1000
# rodadas = 1 

com_e_com = 0
com_e_sem = 0
sem_e_com = 0
sem_e_sem = 0

for(rodada in 1:rodadas){

    # O produto é proibido?
    proibido = sample(
        c(TRUE, FALSE),
        size = 1,
        prob = c(1 - 0.92, 0.92)
    )
    # cat("Produto proibido?", proibido, "\n")

    if(proibido){
        realmente_proibido = sample(
            c(TRUE, FALSE),
            size = 1,
            prob = c(0.95, 1 - 0.95)
        )
        # cat("Realmente proibido?", realmente_proibido, "\n")
        if(realmente_proibido){
            com_e_com = com_e_com + 1
        }
        else{
            com_e_sem = com_e_sem + 1
        }
    }
    else{
        proibido_escondido = sample(
            c(TRUE, FALSE),
            size = 1,
            prob = c(0.15, 1 - 0.15)
        )
        # cat("No final das contas, realmente era permitido?", proibido_escondido, "\n")
        if(proibido_escondido){
            sem_e_com = sem_e_com + 1
        }
        else{
            sem_e_sem = sem_e_sem + 1
        }
    }
}

probabilidade_A = sem_e_sem / ( com_e_sem + sem_e_sem )
probabilidade_B = com_e_com / ( com_e_com + sem_e_com )

cat("Probabilidade de uma mala avaliada como não apresentando produto proibido realmente não apresentar produto proibido:", probabilidade_A, "\n")
cat("Probabilidade de uma mala avaliada como apresente produto proibido realmente apresentar produto proibido:", probabilidade_B, "\n")