setwd('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data')
load('total_final_score.RData')

  require(data.table) ## 1.9.2
  group <- as.data.table(total_final_data)
  df2<-group[group[, .I[which.max(pred)], by=total_final_data$rep.errorwords..each...5.]$V1]
  df2<-df2[,c(-7)]
  corrected<-df2[,c(1,2)]  
  colnames(corrected)<-c('error','ChosenCandidate') 
  
test_cleaned<-read.table('test_clean.txt',header=FALSE,sep="\t")

library(qdap)
tclean<-t(test_cleaned)
t_cleaned <- mgsub(as.character(corrected$error), corrected$ChosenCandidate, as.character(tclean))

write.table(t_cleaned, 'corrected_text.txt', append = FALSE, sep = " ",
            col.names = FALSE)

for(j in seq_along(corrected$error)){
  t_cleaned <- gsub(as.character(corrected$error[j]), corrected$ChosenCandidate[j], as.character(tclean))
}