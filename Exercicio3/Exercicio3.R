# Instalar e carregar os pacotes necessários, se ainda não estiverem instalados
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
if (!requireNamespace("readxl", quietly = TRUE)) install.packages("readxl")
library(ggplot2)
library(readxl)
# Ler os dados
data <- read_xlsx("~/Documents/2ANO-UNI/Semestre_2/PE/Projeto/Exercicio3/electricity.xlsx")
# Filtrar os dados para os países de interesse e dados de energia renovável a partir de 2015
countries <- c("Italy", "Latvia", "IEA Total")
selected_data <- subset(data, PRODUCT == "Renewables" & YEAR >= 2015 & COUNTRY %in% countries)
# Converter para formato dos dados desejado
selected_data$share_percentage <- as.numeric(selected_data$share) * 100
selected_data$DATE <- as.Date(paste(selected_data$YEAR, selected_data$MONTH, "01", sep = "-"))
# Criar o gráfico
ggplot(selected_data, aes(x = DATE, y = share_percentage, color = COUNTRY)) +
  geom_line() +
  geom_point() +
  labs(x = "Date", y = "Renewables (%)", title = "Monthly Evolution of Renewable Energy Proportion") +
  scale_y_continuous(limits = c(0, 100), breaks = seq(0, 100, by = 10)) +
  scale_x_date(date_labels = "%Y %b", date_breaks = "6 months") +
  theme(
    plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
    axis.title.x = element_text(face = "bold", size = 10),
    axis.title.y = element_text(face = "bold", size = 10),
    panel.border = element_rect(colour = "black", fill = NA, size = 1)
  )