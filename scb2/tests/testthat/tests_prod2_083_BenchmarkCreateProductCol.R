test_that(desc = "Testing BenchmarkCreateCMatrix",
          code = {
            testUtilBenchmarkCreateCMatrix(sizeArray = seq(10,20,5),
                                               psi = 0.5,
                                               sigma = 1,
                                               mean = 0)
          })
