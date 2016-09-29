# 1. Combine the two above ideas to study the average terminal wealth for different values of $p$.

w0 <- 100 # Initial wealth
p <- 0.5 # Probability of a win
T <- 10000  # Terminal time

# Create empty objects to fill
w <- rep(0, T+1)
x <- rep(0, T)

# Fill initial wealth
w[1] = w0

for(t in 1:T){
  # A random draw
  u <- runif(1)
  if(u <= 1 - p){
    x[t] <- 0
    w[t+1] <- w[t] - 1
  } else {
    x[t] <- 1
    w[t+1] <- w[t] + 1
  }
}


time = 0:T
plot(time, w, type='l')


2. # Re-write the above code to loop over different values of $p$ and plot all of the lines on a single graph.


## core idea is to take out something from the loop
# Define a step size
step <- 0.5
p <- seq(0, 1.0, step)
p <- p[-1]
p <- p[-length(p)]
w0 <- 100 # Initial wealth
T <- 10  # Terminal time
N <- length(p)

# Create empty objects to fill
w <- rep(0, N*(T+1))
x <- rep(0, N*T)
w <- matrix(w, nrow=T+1, ncol=N)
x <- matrix(x, nrow=T, ncol=N)

# Fill initial wealth
for(n in 1:N){
  w[1, n] <- w0
}

for(n in 1:N){
  for(t in 1:T){
    # A random draw
    u <- runif(1)
    if(u <= 1 - p[n]){
      x[t, n] <- 0
      w[t+1, n] <- w[t, n] - 1
    } else {
      x[t, n] <- 1
      w[t+1, n] <- w[t, n] + 1
    }
  }
}
time = 0:T
matplot(time, w, type='l')

############################################# Problem Set 3

## Reproduce code from class
rand_sample <- function(n, F_inv=function(x) x){
  unif_sample <- runif(n)
  return(F_inv(unif_sample))
}
# what is this weired function in a function?
  # now you just qnormr(x)

mc_mean <- function(n, F_inv=function(x) x){
  sample <- rand_sample(n, F_inv=function(x) F_inv(x))
  return(sum(sample)/n)
}

plot_results <- function(n_vec, F_inv=function(x) x){
  results <- rep(0, length(n_vec))
  i <- 1
  for(n in n_vec){
    results[i] <- mc_mean(n, F_inv=function(x) F_inv(x))
    i <- i + 1
  }
  plot(n_vec, results, type="l")
}
