# PACKAGES ###########################
#install.packages("digest")
#install.packages("readtext")
#install.packages("stringi")
#install.packages("stringr")
#install.packages("lettercase")
#install.packages("data.table")
#install.packages("openxlsx")

library(openxlsx)
library(data.table)
library(shiny)
library(digest)
library(readtext)
library(stringi)
library(stringr)
library(lettercase)
library(data.table)

repeat{
  v.user <- readline(prompt="Type your username: ")
if (any(c.user == v.user))  {
  v.salt <- df[df$User == v.user,"Salt"]
  v.s.password <- paste(v.salt,readline(prompt="Type your password: ") , sep = "")
  v.hash <- digest(v.s.password, algo=c("sha256"), serialize=TRUE, file=FALSE,
                   length=Inf, skip="auto", ascii=FALSE, raw=FALSE, seed=0,
                   errormode=c("warn"),
                   serializeVersion=2)
  if (v.hash == df[df$User == v.user, "Hash"]){
  print("Loged in!")
  v.user <- NULL 
  v.salt <- NULL 
  v.s.password <- NULL
  v.hash <- NULL} 
  else{ print("User not found or incorrect password")
  }
} else {
  readline(prompt="Type your password: ")
  print("User not found or incorrect password")
  }
}
