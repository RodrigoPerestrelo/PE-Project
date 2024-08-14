set.seed(4588)

# Parâmetros
m <- 5000
n <- 100
lambda0 <- 2.40
lambda1 <- 2.65
k <- 2.623

# Função para calcular médias das amostras
calcular_medias <- function(lambda, n) {
  return(rpois(n, lambda))
}

# Frequências relativas de erros
freq_falso_positivo <- 0
freq_falso_negativo <- 0

# Gerar amostras e calcular médias
for (i in 1:m) {
  # Amostras sob H0 e H1
  amostra_H0 <- calcular_medias(lambda0, n)
  amostra_H1 <- calcular_medias(lambda1, n)
  
  # Médias das amostras
  media_H0 <- mean(amostra_H0)
  media_H1 <- mean(amostra_H1)
  
  # Teste de hipóteses
  if (media_H0 > k) {
    freq_falso_positivo <- freq_falso_positivo + 1
  }
  if (media_H1 <= k) {
    freq_falso_negativo <- freq_falso_negativo + 1
  }
}

# Frequências relativas
freq_relativa_falso_positivo <- freq_falso_positivo / m
freq_relativa_falso_negativo <- freq_falso_negativo / m

# Quociente entre a probabilidade de erro de 2ª espécie e a probabilidade de erro de 1ª espécie
quociente <- freq_relativa_falso_negativo / freq_relativa_falso_positivo

quociente
