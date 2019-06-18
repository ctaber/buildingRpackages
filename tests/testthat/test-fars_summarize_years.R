context('fars_summarize_years')


test_that('fars_summarize_years returns a tibble when given existing file years', {
  expect_is(fars_summarize_years(c(2013,2014,2015)), 'tbl_df')
  })

test_that('fars_summarize_years returns a warning when given invalid year', {
  expect_warning(fars_summarize_years(c(2013,2014,2015,2017)))
  })


