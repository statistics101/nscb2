#'
#'@export

saveDoubleAplhaHatArray <- function(nonCoverageProbabilities,
                                    alphaHats,
                                    sampleSize,
                                    replicationCount,
                                    lag,
                                    superReplicationCount,
                                    fileName = "")
{

  bandwidth = computeB(sampleSize = sampleSize)
  fileName <- paste(fileName,"Alphas&AlphaHats",sep = "_")

  fileName <- paste(fileName, "ss", sampleSize, "l", lag, "b",round(bandwidth,1), sep = "_")
  fileName <- paste(fileName, "rC", replicationCount,"sC", superReplicationCount, sep = "_")
  fileName <- timestampGenerator(fileName)
  xLab <- "NonCoverageProbabilities"

  subTitle <- paste(xLab,"\n sampleSize = ", sampleSize,
                    ", lag= ",lag,
                    ", bandwidth = ",
                    round(bandwidth,digits = 1 ),
                    ",\n replicationCount= ", replicationCount,
                    ", SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  arrayOfXAplphaHats <- matrix(0, nrow =length(alphaHats[,1]),
                               ncol = length(alphaHats[1,]))

  for(i in 1:length(nonCoverageProbabilities))
  {
   arrayOfXAplphaHats[,i] <- array(nonCoverageProbabilities[i], dim = length(alphaHats[,1]))
  }

  plot(x=c(0,1),y=c(0,1),type ="n",
       xlab = "", ylab = "Non coverage Frequency")

  title(main="Alphas and AlphaHats", sub = subTitle)

  abline(a = 0 ,b =1)

  saveData <- rbind(nonCoverageProbabilities,alphaHats,sampleSize, bandwidth,
                         replicationCount,
                         lag,
                         superReplicationCount)
  saveCVS(fileName,path,dataToSave = saveData)
  for(i in 1:length(nonCoverageProbabilities))
  {
    points(x=nonCoverageProbabilities[i], y=0,col="blue")
    points(x=arrayOfXAplphaHats[,i],y=jitter(alphaHats[,i]),col="red")
  }
  graphics.off()
  }
