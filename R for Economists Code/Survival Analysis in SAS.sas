* Survival Analysis in SAS;
* Copyright 2013 by Ani Katchova;

proc import out= work.data
datafile= "C:\Econometrics\Data\survival_unemployment.csv" 
dbms=csv replace; getnames=yes; datarow=2; 
run;

*Dependent variable: spell denotes time and event denotes event;
*Independent variables: logwage ui age;
*Compare groups by ui;
*event(0), the number in parenthesis is the value (0 or 1) for which the subject is sensored;


proc means data=data;
var spell event logwage ui age;
run;

proc univariate data=data;
var spell;
run;


*Nonparametric models;

*Graphs of survival functions;
proc lifetest data=data plots=(s) notable;
time spell*event(0);
run;

*Graphs of survival and hazard functions;
proc lifetest data=data method=act plots=(s(name=Actsurv), h(name=Acthaz)) notable;
time spell*event(0);
run;

*Survival curves by group and univariate test;
proc lifetest data=data plots=(s) notable;
time spell*event(0);
strata ui;
run;

*Parametric and semiparametric models;

*Exponential regression coefficients (opposite signs from the Stata coefficients);
proc lifereg data=data;
model spell*event(0)=logwage ui age / d=exponential;
run;

*Weibull regression coefficients (opposite signs and different from the Stata coefficients);
proc lifereg data=data;
model spell*event(0)=logwage ui age / d=weibull;
run;

*Log-logistic regression coefficients (opposite signs from the Stata coefficients);
proc lifereg data=data;
model spell*event(0)=logwage ui age / d=llogistic;
run;

*Cox proportional hazard model coefficients (same as the Stata coefficients);
proc phreg data=data;
model spell*event(0)=logwage ui age;
run;
