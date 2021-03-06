#'
#'@export

saveNonCoverageFreqArray <- function(nonCoverageProbability,
                                     alphaHatArray,
                                     sampleSize,
                                     bandwidth,
                                     replicationCount,
                                     lag,
                                     superReplicationCount,
                                     fileName ="")
{
  bandwidth <- computeB(sampleSize = sampleSize)
  fileName <- paste(fileName,"NonCoverage",sep = "_")

  fileName <- paste(fileName, "ss", sampleSize, "l", lag, "b",round(bandwidth,1), sep = "_")
  fileName <- paste(fileName, "rC", replicationCount,"sC", superReplicationCount, sep = "_")
  fileName <- timestampGenerator(fileName)

  xLab <- "NonCoverageProbability"

  subTitle <- paste(xLab,"\nsampleSize = ",sampleSize,", lag= ",lag,", bandwidth = ",
                    round(bandwidth,digits = 1 ),
                    ",\n replicationCount= ", replicationCount, ", 'SuperRep = ",
                    superReplicationCount,sep = "")

  path <- doPath()

  saveJpg(fileName = fileName, path = path)

  arrayOfXAplphaHat <- array(nonCoverageProbability,dim = (length(alphaHatArray)))

  plot(x=c(0,1),y=c(0,1),type ="n",
       xlab = "", ylab = "Non coverage Frequency")

  title(main="Non Coverage Freq Array",sub =subTitle)

  abline(a = 0 , b =1)

  points(x=nonCoverageProbability, y=0,col="blue")
  points(x=arrayOfXAplphaHat,y=alphaHatArray,col="red")

  legend("topleft",c("Non Coverage Probability","Non Coverage Frequency"),fill = c("blue","red"))

  dev.off()

}
