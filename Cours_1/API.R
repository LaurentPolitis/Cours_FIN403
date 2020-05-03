json = httr::GET("http://api.open-notify.org/iss-now.json",format="txt")
list_json <- as.data.frame(httr::content(json))
list_json$timestamp = as.POSIXct(list_json$timestamp,origin="1970-01-01")
write.csv(x = list_json,file = "position.csv",row.names = F)
print( lubridate::now())


for (i in 1:100){
  print(i)
  json = httr::GET("http://api.open-notify.org/iss-now.json",format="txt")
  position = readr::read_csv("position.csv")
  print( lubridate::now())
  list_json <- httr::content(json)
  position_new  <- as.data.frame(list_json)
  position_new$timestamp = as.POSIXct(position_new$timestamp,origin="1970-01-01")
  print(head(position))
  
  position <- rbind(position,position_new)
  print(head(position))
  write.csv(position,"position.csv",row.names = F)
  Sys.sleep(10)
}