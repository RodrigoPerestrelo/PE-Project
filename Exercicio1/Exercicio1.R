if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2") # Instalar e carregar os pacotes necessários, se ainda não estiverem instalados
library(ggplot2)

# Ler os dados
data <- read.csv("~/Documents/2ANO-UNI/Semestre_2/PE/Projeto/Exercicio1/Paises_PIB_ICH.csv")

# Filtrar os dados para os países da Ásia e África
continents <- c("Asia", "Africa")
selected_data = subset(data, Continent %in% continents)

# Definir os países a serem destacados
highlight_countries <- c("United Arab Emirates", "Nepal", "Comoros", "Namibia")
highlight_data = subset(selected_data, Country %in% highlight_countries)

# Criar o gráfico
ggplot(selected_data) +
  geom_segment(data = highlight_data, 
               aes(x = GDP, y = HCI - 0.02, xend = GDP, yend = HCI),
               arrow = arrow(length = unit(0.3, "cm")), color = "black") + 
  geom_point(size = 3, alpha=0.7, aes(x = GDP, y = HCI, color = Continent)) + 
  geom_text(data = highlight_data, aes(x = GDP, y = HCI, label = Country), vjust = -1) +
  labs(title = "Human Capital Index/GDP per Capita",
       x = "GDP per Capita (log scale)",
       y = "Human Capital Index",
       color = "Continent") +
  scale_x_log10() +
  scale_color_manual(values = c("Asia" = "orange", "Africa" = "purple")) +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    axis.title.x = element_text(face = "bold", size = 10),
    axis.title.y = element_text(face = "bold", size = 10),
    panel.border = element_rect(colour = "black", fill = NA, size = 1)
  )