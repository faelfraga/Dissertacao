

log using "C:\Users\rlfra\Desktop\Dissertação - Dez, 2021\RESULTADOS\ttest_ind.smcl", replace

**************************************************************************************
****** TABELA DE COVARIADAS - 5º ANO

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_5EF_cidig&pble2.dta"


gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3


** never treated

preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2013

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q042 TX_RESP_Q045 TX_RESP_Q046 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore


preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2015

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q042 TX_RESP_Q045 TX_RESP_Q046 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore


preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2017

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q042 TX_RESP_Q045 TX_RESP_Q046 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore

clear




**************************************************************************************
****** TABELA DE COVARIADAS - 9º ANO

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_9EF_cidig&pble2.dta"


gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3


** never treated

preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2013

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q045 TX_RESP_Q048 TX_RESP_Q049 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore


preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2015

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q045 TX_RESP_Q048 TX_RESP_Q049 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore


preserve 

foreach t in 2007 2009 2011 2013 2015 2017 {

keep if first_treat3==0|first_treat3==2017

estpost ttest PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 SEC ///
TX_RESP_Q013 APOIO TX_RESP_Q045 TX_RESP_Q048 TX_RESP_Q049 TX_ESC_Q041 ///
PROBLEMAS pble if ID_PROVA_BRASIL==`t', by(first_treat3)

esttab, wide nonumber mtitle("dif.")
}

restore

clear


log close
