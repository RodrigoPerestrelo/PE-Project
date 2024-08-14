# Instalar e carregar os pacotes necessários, se ainda não estiverem instalados
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(ggplot2)

# Ler os dados
data <- read.csv("~/Documents/2ANO-UNI/Semestre_2/PE/Projeto/Exercicio2/master.csv")

# Filtrar os dados referentes ao ano de 2002 e ao grupo etário 55-74 anos
selected_data = subset(data, year == 2002 & age == "55-74 years")

# Criar o gráfico
ggplot(selected_data, aes(x = sex, y = `suicides.100k.pop`, fill = sex)) +
  geom_boxplot() +
  labs(title = "Number of Suicides per 100k Population in 2002 (Age: 55-74 years)",
       x = "Gender",
       y = "Suicides/100k pop") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "top",
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    axis.title.x = element_text(face = "bold", size = 10),
    axis.title.y = element_text(face = "bold", size = 10),
    panel.border = element_rect(colour = "black", fill = NA, size = 1)
  )
