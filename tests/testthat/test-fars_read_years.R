context('fars_read_years')

test_that('fars_read_years should return a tibble', {
  expect_is(fars_read_years(2013)[[1]],'tbl_df')
  })


test_that('fars_read_years should return a warning for non-existant files', {
 expect_warning(fars_read_years(2017))
  })
