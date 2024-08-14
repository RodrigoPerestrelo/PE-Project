import numpy as np

# Definir os parâmetros
n = 650
seed = 2336
p = np.arange(1, 10) / 45

alarm_sig = 2
shutdown_sig = 1

# Definir a semente do gerador de números aleatórios
np.random.seed(seed)

no_shutdown_count = 0
no_shutdown_alarm_count = 0

# Realizar as simulações
for i in range(n):
    signals = np.random.choice(np.arange(1, 10), 7, replace=True, p=p)
    alarm = alarm_sig in signals
    shutdown = shutdown_sig in signals
    if alarm and not shutdown:
        no_shutdown_alarm_count += 1
    if not shutdown:
        no_shutdown_count += 1

# Calcular a proporção
proportion = no_shutdown_alarm_count / no_shutdown_count
proportion_rounded = round(proportion, 2)

print(proportion_rounded)
