library(testthat)
library(HouseholderAcoustics)

test_that("Householder H est orthogonale", {
  x <- c(1,2,3)
  v <- internal_householder_vector(x)
  H <- internal_householder_matrix(v)
  expect_equal(t(H) %*% H, diag(length(x)), tolerance = 1e-8)
})

test_that("Décomposition QR fonctionne", {
  A <- matrix(c(3,1,2, 1,4,0, 2,0,5), 3, 3)
  res <- internal_qr_householder(A)
  expect_equal(res$Q %*% res$R, A, tolerance = 1e-8)
  expect_equal(t(res$Q) %*% res$Q, diag(nrow(A)), tolerance = 1e-8)
})
