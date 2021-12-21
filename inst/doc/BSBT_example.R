## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE---------------------------------------------------
library(BSBT)
library(sf)

## ---- fig.width= 7, fig.height=7----------------------------------------------
data("dar.adj.matrix")
data("dar.shapefiles")
plot(dar.shapefiles$geometry, lwd = 0.5)

## -----------------------------------------------------------------------------
k <- constrained_adjacency_covariance_function(dar.adj.matrix, type = "matrix", hyperparameters = c(1, 1), linear.combination = rep(1, 452), linear.constraint = 0)

## -----------------------------------------------------------------------------
true.deprivation <- BSBT::mvnorm_sd(k$mean, k$decomp)

## -----------------------------------------------------------------------------
comparisons <- BSBT::simulate_comparisons(n.contests = 20000, true.quality = true.deprivation, sigma.obs = 0)

