    ConvertAutoMpgRecords <- function(rawRecords) {
      noQuotes <- gsub('\"', '', rawRecords)
      n <- length(noQuotes)
      outFrame <- NULL
      for (i in 1:n) {
        x <- noQuotes[i]
        twoParts <- unlist(strsplit(x,split="\t"))
        partOne <- unlist(strsplit(twoParts[1],split="[ ]+"))
        numbers <- as.numeric(partOne)
        upFrame <- data.frame(mpg = numbers[1],
                              cylinders = numbers[2], 
                              displacement = numbers[3],
                              horsepower = numbers[4],
                              weight = numbers[5],
                              acceleration = numbers[6],
                              modelYear = numbers[7],
                              origin = numbers[8],
                              carName = twoParts[2])
        outFrame <- rbind.data.frame(outFrame, upFrame)
      }
      return(outFrame)
    }
    save(ConvertAutoMpgRecords, file="ConvertAutoMpgRecords")
