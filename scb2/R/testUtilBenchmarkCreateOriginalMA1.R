#' @export
#'
#' @importFrom microbenchmark microbenchmark
testUtilBenchmarkCreateOriginalMA1 <- function(sizeArray,
                                               psi,
                                               sigma,
                                               mean)
{
  cat("\nTesting \'tests_81_benchmarkCreateOriginalMA1\' \n")

  cat("Test parameters:", "\n")
  cat("sizeArray =", sizeArray, "\n")
  cat("sigma =", sigma, "\n")
  cat("psi =", psi, "\n")
  cat("mean =", mean, "\n")

 sumResArray <- matrix(nrow = 0,ncol = 8)

  for(index in 1:length(sizeArray))
  {
    res <- microbenchmark(createOriginalMA1(size = sizeArray[index],
                                            psi = psi,
                                            sigma = sigma,
                                            mean = mean),times = 1000L)
    sumResArray <-rbind(sumResArray, summary(res,unit = "s"))

  }
  yMax <- max(sumResArray$max)
  yMin <- min(sumResArray$min)
  yMax5 <- yMax *0.05
  yMin5 <- yMin * 0.05
  if(yMax >= 3600)
  {
    hour <- floor(yMax / 3600)
    minute <- floor(yMax %% 3600 / 60)
    second <- floor(yMax %% 3600 %% 60)
    subtitle <- paste0("Max time = ", hour,":",minute,":",second,
                       "  when size = ",sizeArray[which.max(sumResArray$max)])
  }else if(yMax >= 60)
  {
    minute <- floor(yMax %% 3600 / 60)
    second <- floor(yMax %% 3600 %% 60)
    subtitle <- paste0("Max time = ",minute,":",second,
                       "  when size = ",sizeArray[which.max(sumResArray$max)])
  }else
  {
    subtitle <- paste0("Max time = ", round(yMax,digits = 4),
                       " seconds  when size = ",sizeArray[which.max(sumResArray$max)])
  }
  fileName.median <- "BenchmarkCreateMa1OriginalMedian"
  fileName.median <- timestampGenerator(fileName = fileName.median)
  fileName.maxMin <- "BenchmarkCreateMa1OriginalMaxMin"
  fileName.maxMin <- timestampGenerator(fileName = fileName.maxMin)
  saveJpg(fileName.median,path = "./plots/")
  plot(sumResArray$median~sizeArray,ylab = "Time",type = "l",col="blue")
  title(main = "Median time Create Original Ma1 ",sub = subtitle)
  graphics.off()
  saveJpg(fileName.maxMin,path = "./plots/")
  plot(sumResArray$max~sizeArray,type = "l",col = "red",ylab = "Time",ylim=c(yMin-yMin5,yMax+yMax5))
  lines(sumResArray$min~sizeArray,col="green")
  title(main = "Create MA1 Original Maximum and minimum time",sub = subtitle)
  graphics.off()

  cat("End of test benchmarkCreateOriginalMA1","\n")

  cat("=====================\n")
}
