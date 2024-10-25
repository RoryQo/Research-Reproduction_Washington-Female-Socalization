## ----setup, include=FALSE------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----library, message=F,warning=F----------------------------------
library(tinytex)
library(dplyr)
library(haven)
library(stargazer)
library(ggplot2)
library(lfe)
library(kableExtra)
library(RColorBrewer)


## ----data loading--------------------------------------------------
df<-read_dta("C:\\Users\\roryq\\Downloads\\basic.dta")


## ----observations--------------------------------------------------
obs<-nrow(df); obs


## ----105 congress--------------------------------------------------
df_105 <- df %>% filter(congress==105)


## ----select variables----------------------------------------------
df_105<- df_105 %>% select(aauw,nowtot,totchi,ngirls,party,female,age)


## ----convert to data frame-----------------------------------------
df_105<-as.data.frame(df_105)
is(df_105)


## ----summary stats, results='asis', message=F----------------------
stargazer(df_105,type="latex")


## ----encoding------------------------------------------------------
df_105$repub <- ifelse(df_105$party==2,1,0)


## ----transformation------------------------------------------------
df_105$age2<-df_105$age^2


## ----results='asis', message=F-------------------------------------

model1<-felm(aauw~ngirls+totchi,data=df_105)

model2<- felm(aauw~ngirls+totchi+female+repub, data=df_105)

model3<- felm(aauw~ngirls+totchi+female+repub+age+age2, data=df_105)


stargazer(model1, model2,model3, se = list(model1$rse, model2$rse, model3$rse),type="latex",
title = "- Impact of Female Children on Legislator Voting on Women's Issues",
dep.var.caption = "",
covariate.labels = c("Number of Daughters", "Total Children","Female","Republican", "Age",
"Age squared","Constant"),
          dep.var.labels = "AAUW")



## ----results='asis', message=F-------------------------------------
df_mB<- df_105 %>% filter(female==1)
df_mC<- df_105 %>% filter(female==0)


model_A<- model1
model_B<- felm(aauw~ngirls+totchi,data=df_mB)
model_C<- felm(aauw~ngirls+totchi,data=df_mC)
model_D<-felm(aauw~ngirls+totchi+female+female*ngirls+female*totchi,data=df_105)

stargazer(model_A, model_B,model_C,model_D, se = list(model_A$rse, model_B$rse, model_C$rse
, model_D$rse),type="latex",
title = "- Impact of Female Children on Legislator Voting on Women's Issues",
dep.var.caption = "",
          dep.var.labels = "AAUW")


## ----fig.width=10, fig.height=10, warning=F------------------------

# Filter the data
df_2 <- df_105 %>% filter(totchi == 2)
colors <-colorRampPalette( brewer.pal(n = 3, name = "Blues"))(15)[c(9,12,15)]

# Create the ggplot
ggplot(df_2, aes(x = ngirls, y = nowtot, fill = factor(ngirls))) +
  geom_bar(position = "dodge", stat = "summary", fun = "mean", color = "black") +
  geom_text(stat = "summary", fun = "mean", aes(label = round(..y.., 1)), 
            position = position_dodge(width = 0.9), vjust = 2, size = 7,col="white") + 
  labs(
    title = "Average NOW Score by Number of Daughters",
    subtitle = "Of Legislators with 2 Total Children",
    x = "Number of Daughters",
    y = "NOW Score"
  ) +
  scale_fill_manual(values = colors) +
  scale_y_continuous(breaks = seq(0, max(df_2$nowtot) + 20, by = 20)) +
  theme_minimal(base_size = 15) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 26),
    plot.subtitle = element_text(hjust = 0.5, face = "italic", size = 24),
    axis.title.x = element_text(face = "italic", size = 23),
    axis.title.y = element_text(face = "italic", size = 23),
    panel.grid.major = element_line(color = "lightgrey"),
    panel.grid.minor = element_blank(),
    legend.position = "none",
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20)
  )



