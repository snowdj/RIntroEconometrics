* Limited Dependent Variable Models in SAS(Tobit, Truncated Regression, Heckman Models);
* Copyright 2013 by Ani Katchova;

proc import out= work.data
datafile= "C:\Econometrics\Data\limdep_ambexp.csv" 
dbms=csv replace; getnames=yes; datarow=2; 
run;

proc means data=data;
var ambexp age female totchr;
run;

proc means data=data;
var ambexp age female totchr;
where ambexp>0;
run;

proc univariate data=data;
var ambexp;
run;

proc univariate data=data;
var ambexp;
where ambexp>0;
run;

data data;
set data;
if ambexp>0 then dy=1; else dy=0;
run;

*OLS;
proc reg data=data; 
model ambexp = age female totchr; 
run;

*Tobit model;
proc qlim data = data;
model ambexp = age female totchr;
endogenous ambexp ~ censored (lb=0);
output out=mfx marginal;
run;

*Tobit model marginal effects;
proc means data=mfx n mean std;
var Meff_age Meff_female Meff_totchr;
run;

*Probit model;
proc logistic data=data descending; 
model dy = age female totchr / link=probit; 
run;

*Truncated regression;
proc qlim data = data;
where ambexp>0;
model ambexp = age female totchr;
endogenous ambexp ~ truncated (lb=0);
run;

*Heckman model;
proc qlim data = data;
model dy = age female totchr /discrete (dist=normal);
model ambexp = age female totchr /select(dy=1);
run;

/*
*Tobit model;
proc lifereg data=data; 
model ambexp*dy(0)= age female totchr /dist=normal;
*model (dy, ambexp) = age female totchr /dist=normal;
run;
*/

