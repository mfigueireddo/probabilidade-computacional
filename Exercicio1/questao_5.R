set.seed(123)
rodadas = 1000
exibe_jogo = FALSE
exibe_jogo_ao_final = FALSE
vitorias_pacman = 0

sorteiaMovimento <- function(){
  movimento = sample(
    c("Esquerda", "Direita", "Cima", "Baixo"),
    size = 1,
    prob = c(rep(1/4, 4))
  )
  return(movimento)
}

confereLimites <- function(posicao, movimento){
  if (movimento == "Esquerda" & posicao[2] - 1 < 1){
    return(FALSE)
  }
  if (movimento == "Direita" & posicao[2] + 1 > 11){
    return (FALSE)
  }
  if (movimento == "Cima" & posicao[1] - 1 < 1){
    return (FALSE)
  }
  if (movimento == "Baixo" & posicao[1] + 1 > 11){
    return (FALSE)
  }
  
  return(TRUE)
}

simulaMovimento <- function(posicao, nova_posicao, movimento){
  if (confereLimites(posicao, movimento) == FALSE){
    return(FALSE)
  }
  
  nova_posicao <<- posicao
  
  if (movimento == "Esquerda"){
    nova_posicao[2] <<- posicao[2] - 1
  }
  if (movimento == "Direita"){
    nova_posicao[2] <<- posicao[2] + 1
  }
  if (movimento == "Cima"){
    nova_posicao[1] <<- posicao[1] - 1
  }
  if (movimento == "Baixo"){
    nova_posicao[1] <<- posicao[1] + 1
  }
  
  return(TRUE)
}

getOcupantePosicao <- function(mapa, posicao_desejada){
  return(mapa[posicao_desejada[1], posicao_desejada[2]])
}

andaNoMapa <- function(mapa, posicao_antiga, posicao_nova, simbolo){
  mapa[posicao_antiga[1], posicao_antiga[2]] <<- " "
  mapa[posicao_nova[1], posicao_nova[2]] <<- simbolo
}

for(rodada in 1:rodadas){
  mapa = matrix(
    " ",
    nrow = 11,
    ncol = 11
  )
    
  # === === PACMAN === ===
  
  pacman = c(1, 1)
  mapa[pacman[1], pacman[2]] = "C"
  
  # === === FANTASMAS === ===
  
  fantasmas = matrix(
    c(1, 11, 11, 1, 11, 11),
    nrow = 3,
    ncol = 2,
    byrow = TRUE
  )
  for (indice in 1:nrow(fantasmas)){
    mapa[fantasmas[indice, 1], fantasmas[indice, 2]] = "F"
  }
    
    # === === PASTILHAS === ===
    
  pastilhas = matrix(
    c(rep(c(0, 0), 2)),
    nrow = 2,
    ncol = 2,
    byrow = TRUE
  )
  
  for (indice in 1:2){
    while(TRUE){
      x = sample(
        c(seq(1, 11)),
        size = 1,
        prob = c(rep(1/11, 11))
      )
      y = sample(
        c(seq(1, 11)),
        size = 1,
        prob = c(rep(1/11, 11))
      )
      
      if (x != pacman[1] & y != pacman[2]){
        break
      }
    }
    
    pastilhas[indice, 1] = x
    pastilhas[indice, 2] = y
    mapa[x, y] = "P"
  }
    
  # === === JOGO === ===
  
  pacman_vivo = TRUE
  pastilhas_comidas = 0
  posicao_antiga = c(0, 0)
  nova_posicao = c(0, 0)

  while(TRUE){
    if (exibe_jogo){
      print(mapa)
    }
    
    # === === MOVIMENTA PACMAN === ===
    
    while (TRUE){
      movimento = sorteiaMovimento()
      status = simulaMovimento(pacman, nova_posicao, movimento)
      ocupante = getOcupantePosicao(mapa, nova_posicao)
      if (status == TRUE){
        break
      }
    }
    
    if (ocupante == "P"){
      pastilhas_comidas = pastilhas_comidas + 1
      if (pastilhas_comidas == 2){
        break
      }
    }
    else if (ocupante == "F"){
      pacman_vivo = FALSE
      break
    }
    
    andaNoMapa(mapa, pacman, nova_posicao, "C")
    pacman = nova_posicao
    
    if (exibe_jogo){
      print(mapa)
    }
    
    # === === MOVIMENTA FANTASMAS === ===
    
    for (i_fantasma in 1:3){
      while (TRUE){
        movimento = sorteiaMovimento()
        status = simulaMovimento(fantasmas[i_fantasma, ], nova_posicao, movimento)
        ocupante = getOcupantePosicao(mapa, nova_posicao)
        if (status == TRUE & ocupante != "P" & ocupante != "F"){
          break
        }
      }
      if (ocupante == "P"){
        print("FANTASMA VAI COMER A PASTILHA PORRA")
      }
      
      if (ocupante == "C"){
        pacman_vivo = FALSE
        break
      }
      
      andaNoMapa(mapa, fantasmas[i_fantasma, ], nova_posicao, "F")
      fantasmas[i_fantasma, ] = nova_posicao
      
      if (exibe_jogo){
        print(mapa)
      }
    }
  }
  
  if (pastilhas_comidas == 2){
    vitorias_pacman = vitorias_pacman + 1
  }
  if (exibe_jogo | exibe_jogo_ao_final){
    print("=== === MAPA LOGO ANTES DE ACABAR === === ===")
    print(mapa)
  }

}

cat("Pacman venceu", vitorias_pacman, "de", rodadas, "rodadas, o que significa", vitorias_pacman/rodadas*100, "% de vitórias")