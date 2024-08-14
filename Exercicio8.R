library(pracma)

seed <- 1592
distances <- c(31.8,31.7,35.2,37.1,31.7,36.1,36.3,33.2,34.3,37.5,30.4,34.6,32.4,31.7,30.2,34.3,35.6,34.9,38.9)
n <- 12
gamma <- 0.96

set.seed(seed)

observations <- sample(distances, n)
observations

sample_var <- var(observations)
sample_var

a <- qchisq((1-gamma)/2, n-1)
b <- qchisq((1+gamma)/2, n-1)
a
b

ic_lower_bound <- ((n-1)*sample_var)/b
ic_upper_bound <- ((n-1)*sample_var)/a

ic <- c(ic_lower_bound, ic_upper_bound)
ic

equations <- function(x) {
  c <- x[1]
  d <- x[2]
  
  eq1 <- pchisq(d, n-1) - pchisq(c, n-1) - gamma
  eq2 <- dchisq(d, n+3) - dchisq(c, n+3)
  return(c(eq1, eq2))
}

c_d <- fsolve(f=equations, x0=c(a,b))$x
c <- c_d[1]
d <- c_d[2]

ic_new_lower_bound <- (n-1)*sample_var/d
ic_new_upper_bound <- (n-1)*sample_var/c

ic_new <- c(ic_new_lower_bound, ic_new_upper_bound)
ic_new
amplitude_ic <- ic[2] - ic[1]
amplitude_ic_new <- ic_new[2] - ic_new[1]
c(amplitude_ic, amplitude_ic_new)

amplitude_diff <- abs(amplitude_ic - amplitude_ic_new)
amplitude_diff
round(amplitude_diff, 3)