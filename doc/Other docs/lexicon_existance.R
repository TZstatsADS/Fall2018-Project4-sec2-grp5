library(quanteda)
library(readtext)
library(spacyr)
library(Rcpp)
library(magrittr)
setwd('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data')
load('candidate_errors.RData')

matchfun<-function(c){
  if(c%in%tk4){
    return(1)
  }else{
    return(0)
  }
}


#lexicon for group 1:
f<-readtext('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data/ground_truth/group1/*.txt',cache=FALSE)
mycorpus<-corpus(f)
summary(mycorpus,5)
txt<-texts(mycorpus, groups = rep(1, ndoc(mycorpus)))
txt<-gsub("\'", " ", txt)
mastercorpus<-corpus(txt)
tk<-tokens(mastercorpus,remove_numbers = TRUE,remove_punct = TRUE,remove_separators = TRUE,remove_symbols = TRUE,remove_hyphens=TRUE)
tk2<-tokens_remove(tk,stopwords("english"))
tk3<-sapply(tk2, tolower)
summary(tk3)
length(tk3)
tk4<-unique(tk3)

exist1<-data.frame(matrix(nrow=nrow(candidate_errors),ncol=ncol(candidate_errors)))

for(i in 1:nrow(candidate_errors)){
exist1[i,]<-as.data.frame(lapply(candidate_errors[i,],matchfun))
}

#lexicon for group 2:
f<-readtext('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data/ground_truth/group2/*.txt',cache=FALSE)
mycorpus<-corpus(f)
summary(mycorpus,5)
txt<-texts(mycorpus, groups = rep(1, ndoc(mycorpus)))
txt<-gsub("\'", " ", txt)
mastercorpus<-corpus(txt)
tk<-tokens(mastercorpus,remove_numbers = TRUE,remove_punct = TRUE,remove_separators = TRUE,remove_symbols = TRUE,remove_hyphens=TRUE)
tk2<-tokens_remove(tk,stopwords("english"))
tk3<-sapply(tk2, tolower)
summary(tk3)
length(tk3)
tk4<-unique(tk3)

exist2<-data.frame(matrix(nrow=nrow(candidate_errors),ncol=ncol(candidate_errors)))

for(i in 1:nrow(candidate_errors)){
  exist2[i,]<-as.data.frame(lapply(candidate_errors[i,],matchfun))
}

#lexicon for group 3:
f<-readtext('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data/ground_truth/group3/*.txt',cache=FALSE)
mycorpus<-corpus(f)
summary(mycorpus,5)
txt<-texts(mycorpus, groups = rep(1, ndoc(mycorpus)))
txt<-gsub("\'", " ", txt)
mastercorpus<-corpus(txt)
tk<-tokens(mastercorpus,remove_numbers = TRUE,remove_punct = TRUE,remove_separators = TRUE,remove_symbols = TRUE,remove_hyphens=TRUE)
tk2<-tokens_remove(tk,stopwords("english"))
tk3<-sapply(tk2, tolower)
summary(tk3)
length(tk3)
tk4<-unique(tk3)

exist3<-data.frame(matrix(nrow=nrow(candidate_errors),ncol=ncol(candidate_errors)))

for(i in 1:nrow(candidate_errors)){
  exist3[i,]<-as.data.frame(lapply(candidate_errors[i,],matchfun))
}

#lexicon for group 4:
f<-readtext('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data/ground_truth/group4/*.txt',cache=FALSE)
mycorpus<-corpus(f)
summary(mycorpus,5)
txt<-texts(mycorpus, groups = rep(1, ndoc(mycorpus)))
txt<-gsub("\'", " ", txt)
mastercorpus<-corpus(txt)
tk<-tokens(mastercorpus,remove_numbers = TRUE,remove_punct = TRUE,remove_separators = TRUE,remove_symbols = TRUE,remove_hyphens=TRUE)
tk2<-tokens_remove(tk,stopwords("english"))
tk3<-sapply(tk2, tolower)
summary(tk3)
length(tk3)
tk4<-unique(tk3)

exist4<-data.frame(matrix(nrow=nrow(candidate_errors),ncol=ncol(candidate_errors)))

for(i in 1:nrow(candidate_errors)){
  exist4[i,]<-as.data.frame(lapply(candidate_errors[i,],matchfun))
}

#lexicon for group 5:
f<-readtext('C:/Users/Deepika/Documents/ADS/Project 4/Fall2018-Project4-sec2--sec2proj4_grp5/data/ground_truth/group5/*.txt',cache=FALSE)
mycorpus<-corpus(f)
summary(mycorpus,5)
txt<-texts(mycorpus, groups = rep(1, ndoc(mycorpus)))
txt<-gsub("\'", " ", txt)
mastercorpus<-corpus(txt)
tk<-tokens(mastercorpus,remove_numbers = TRUE,remove_punct = TRUE,remove_separators = TRUE,remove_symbols = TRUE,remove_hyphens=TRUE)
tk2<-tokens_remove(tk,stopwords("english"))
tk3<-sapply(tk2, tolower)
summary(tk3)
length(tk3)
tk4<-unique(tk3)

exist5<-data.frame(matrix(nrow=nrow(candidate_errors),ncol=ncol(candidate_errors)))

for(i in 1:nrow(candidate_errors)){
  exist5[i,]<-as.data.frame(lapply(candidate_errors[i,],matchfun))
}

#storing it in a list and in an RData file
all_grps$group1
save(all_grps, file = "lexicon_existance.RData")
