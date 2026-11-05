testthat::test_that("calculate the change and percentage change", {
  df <- data.frame(AVAL=c(45,80), BASE=c(60,50))
  out <- calc_pchg(df)
  testthat::expect_equal(out$CHG,c(-15,30))
  testthat::expect_equal(out$PCHG,c(-25,60))
})
