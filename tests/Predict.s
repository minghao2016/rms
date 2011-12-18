require(rms)
x1 <- runif(50)
x2 <- sample(c('a','b'), 50, TRUE)
y <- x1 + (x2=='b') + runif(50)
dd <- datadist(x1, x2)
options(datadist='dd')
f <- ols(y ~ x1 + x2)
p <- Predict(f, x1, x2, np=10)
p[p$x2=='b' & p$x1 > .5,c('yhat','lower','upper')] <- NA
# or p[with(p, x2=='b' & x1 > .5), 3:5] <- NA
plot(p)
