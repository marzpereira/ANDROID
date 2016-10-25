corr <- function(directory, threshold = 0) {
  filelist <- list.files(directory, full.names = TRUE)
  index <- 1
  corr_vec <- vector(mode = "numeric", length = 0)
  
  while (index <= length(filelist))
  {
    completecasees <- complete(directory, index)
    if (completecasees$nob > threshold)
    {
      data <- read.csv(filelist[index])
      corr_vec <- c(corr_vec, cor(data$sulfate, data$nitrate, use = "complete.obs"))
    }
    index <- index + 1
  }
  corr_vec
}