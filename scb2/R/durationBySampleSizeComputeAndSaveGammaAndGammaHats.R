durationBySampleSizeComputeAndSaveGammaAndGammaHats <-
  function(fromSampleSize = 1000,
           toSampleSize = 10000,
           stepSampleSize = 1000,
           tParCount = 11,
           gammaHatCount = 1)
  {
    sampleSizeArray = seq(fromSampleSize, toSampleSize, stepSampleSize)

    time <- array(data = NA, dim = length(sampleSizeArray))
    numberOfPoints <- length(sampleSizeArray)

    globalStart <- Sys.time()
    timeIndex <- 1
    for (sample in sampleSizeArray)
    {
      Start <- Sys.time()

      computeAndSaveGammaAndGammaHats(sampleSize = sample, gammaHatCount = gammaHatCount)

      End <- Sys.time()
      duration <- End - Start
      time[timeIndex] <- duration
      timeIndex <- timeIndex + 1
      cat(sample, " ")
      cat(duration, "\n")
    }
    sumDuration <- Sys.time() - globalStart

    svg(filename = "output/durationBySampleSizeComputeAndSaveGammaAndGammaHats.svg")
    plot(x = sampleSizeArray, y = time, type = "l", col = "red", xlab = "",
         ylab = "sec", main = "Duration vs sampleSize for ComputeAndSaveGammaAndGammaHats")
    par(mar = c(7, 4, 2, 2))
    subTitle <- paste0(" Sample size",
                       "\n fromSampleSize = ", fromSampleSize,
                       ", toSampleSize = ", toSampleSize,
                       ", numberOfPoints = ", numberOfPoints,
                       "\n stepSampleSize = ", stepSampleSize,
                       ", tParCount = ", tParCount,
                       ", sumDuration = ", sumDuration)
    title(sub = subTitle, line = 6)
    dev.off()

    write.csv(x = list(sampleSizeArray = sampleSizeArray,
                       time = time),
              file = "output/durationBySampleSizeComputeAndSaveGammaAndGammaHats.csv", row.names = F)
  }
