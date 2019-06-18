context('fars_map_state')

test_that('Expect error when state.num input is not numeric',{
  expect_warning(expect_error(fars_map_state('RI',2014)))
  expect_error(fars_map_state('52',2014))
  })

