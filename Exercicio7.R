library(stats4)

a <- 4.5
x <- c(8.54,4.76,5.15,4.96,6.25,7.22,12.9,6.04,8.86,4.88,6.54,4.53,4.7,5.38,5.96,5.17,5.09,5.11)
start_value <- 3.4
p <- 0.25

distrib <- function(theta) theta * (x**(-theta-1)) * (a**theta)

nLL <- function(theta) {
  if(theta > 0)
    -sum(log(distrib(theta)))
  else NA
}
fit <- mle(nLL, start = list(theta = 3.4))
theta <- coef(fit)[1]

quantil_est =  (4**(1/theta)) * a
quantil_real = (4**(1/start_value)) * a

abs(quantil_est - quantil_real)