test_that(desc = "Testing  \'computeBetaColumnScaledNoise\'",
          code = {
            testUtilComputeBetaColumnScaledNoise(
              sample = c(10,  -7.85,  8.92, 11.65, -10.7, 11, -3.23, 4.5, 6.21),
              psi = 1,
              sigma = 2,
              lag = 8,
              tPar = 0.5
            )
          })
