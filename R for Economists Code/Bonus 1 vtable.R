library(devtools)
install_github('NickCH-K/vtable')
library(vtable)

data("LifeCycleSavings")
vtable(LifeCycleSavings)

LifeCycleSavings$country <- row.names(LifeCycleSavings)
vtable(LifeCycleSavings)

LifeCycleSavings$country <- as.factor(row.names(LifeCycleSavings))
vtable(LifeCycleSavings)
vtable(LifeCycleSavings,factor.limit=0)
vtable(LifeCycleSavings,factor.limit=3)

labels <- c("A","B","C","D","E","F")
vtable(LifeCycleSavings,labels=labels,factor.limit=3)

lab2 <- data.frame(v1=names(LifeCycleSavings),v2=c("A","B","C","D","E","F"))
vtable(LifeCycleSavings,labels=lab2,factor.limit=3)
lab2 <- data.frame(v1=c("sr","ddpi"),v2=c("A","B"))
vtable(LifeCycleSavings,labels=lab2,factor.limit=3)

lab3 <- data.frame(sr="A",ddpi="B")
vtable(LifeCycleSavings,labels=lab3,factor.limit=3)

library(sjlabelled)
data(efc)
vtable(efc)

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.")

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.",
       out="browser")

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.",
       out="browser",file='lifecycledocumentation')

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.",
       out="browser",summ=c("mean(x)"))

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.",
       out="browser",summ=c("mean(x)","mean(log(x^2))"))

vtable(LifeCycleSavings,labels=lab3,factor.limit=3,
       data.title="Life Cycle Savings Data",
       desc="This is data on life-cycle savings over a decade.",
       out="browser",summ=c("mean(x)","mean(log(x^2))","countNA(x)","propNA(x)"))

vtable(efc,summ=c("propNA(x)"))

