complete <- function(directory, id = 1:332) {
  filelist <- list.files(directory, full.names = TRUE)
  data <- data.frame()
  
  for (i in id) {
    nob <- sum(complete.cases(read.csv(filelist[i])))
    data <- rbind(data, data.frame(i, nob))
  }
  colnames(data) <- c("id", "nob")
  data
}