context('make_filename')

test_that('Function can handle numeric or character year input', {
  expect_equal(make_filename(2013), 'accident_2013.csv.bz2')
  expect_equal(make_filename('2013'), 'accident_2013.csv.bz2')
  })


