

log using "C:\Users\rlfra\Desktop\Dissertação - Dez, 2021\RESULTADOS\ttest_mun.smcl", replace

**************************************************************************************
****** TABELA DE COVARIADAS - Cidades Digitais AGREGADAS


** Never Treated

use "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_Cidig2.dta"


gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3


preserve 

keep if first_treat3==0|first_treat3==2013

estpost ttest idhm10_educ idhm10_rend indic_acesso, by(first_treat3)

esttab, wide nonumber mtitle("dif.")

restore


preserve 

keep if first_treat3==0|first_treat3==2015

estpost ttest idhm10_educ idhm10_rend indic_acesso, by(first_treat3)

esttab, wide nonumber mtitle("dif.")

restore


preserve 

keep if first_treat3==0|first_treat3==2017

estpost ttest idhm10_educ idhm10_rend indic_acesso, by(first_treat3)

esttab, wide nonumber mtitle("dif.")

restore
