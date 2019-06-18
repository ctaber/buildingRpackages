context('fars_read')


test_that('Expect error when file doesnt exist',{
  expect_error(fars_read(file.path('data', 'this_file_does_not_exist.csv'),"file 'this_file_does_not_exist.csv' does not exist"))
  })

test_that('Expect class of read-in file to be "tbl_df"', {
  expect_is(fars_read(system.file('extdata', 'accident_2013.csv.bz2', package='buildingRpackages')),'tbl_df')
  })
