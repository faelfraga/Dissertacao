*###############################################################################
********************************************************************************
*###################     BASE RAPIDA_5 OU BASE RAPIDA_9     ###################*           

*INTRO)


*###############################################################################
********************************************************************************
*#######################      DESENHO METODOLÓGICO      #######################*


*1) ESTIMAÇÃO SEM COVARIADAS

foreach n in 5 9 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_1.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

csdid `y', time(ID_PROVA_BRASIL) gvar(event_plt)
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr1_`y'_`n', replace)


* ESTIMAÇÃO "NOT YET" 

csdid `y', time(ID_PROVA_BRASIL) gvar(event_plt) notyet
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr2_`y'_`n', replace)
}

clear

log close
}




*2) ESTIMAÇÃO COM COVARIADAS (INDIVIDUAIS)

foreach n in 5 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_2.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 i.TX_RESP_Q045 ///
, time(ID_PROVA_BRASIL) gvar(event_plt)
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr3_`y'_`n', replace)


* ESTIMAÇÃO "NOT YET" 

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 i.TX_RESP_Q045 ///
, time(ID_PROVA_BRASIL) gvar(event_plt) notyet
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr4_`y'_`n', replace)
}

clear

log close
}


foreach n in 9 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_2.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
, time(ID_PROVA_BRASIL) gvar(event_plt)
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr3_`y'_`n', replace)


* ESTIMAÇÃO "NOT YET" 

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
, time(ID_PROVA_BRASIL) gvar(event_plt) notyet
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr4_`y'_`n', replace)
}

clear

log close
}




*3) ESTIMAÇÃO COM COVARIADAS (INDIVIDUAIS + FE DE MUNICIPIO)

foreach n in 5 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_3.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

xi: csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 ///
i.TX_RESP_Q045, time(ID_PROVA_BRASIL) gvar(event_plt) i.ID_MUNICIPIO
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr5_`y'_`n', replace)


* ESTIMAÇÃO "NOT YET" 

xi: csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 ///
i.TX_RESP_Q045, time(ID_PROVA_BRASIL) gvar(event_plt) notyet i.ID_MUNICIPIO
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr6_`y'_`n', replace)
}

clear

log close
}


foreach n in 9 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_3.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

xi: csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 ///
i.TX_RESP_Q048, time(ID_PROVA_BRASIL) gvar(event_plt) i.ID_MUNICIPIO
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr5_`y'_`n', replace)


* ESTIMAÇÃO "NOT YET" 

xi: csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 ///
i.TX_RESP_Q048, time(ID_PROVA_BRASIL) gvar(event_plt) notyet i.ID_MUNICIPIO
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr6_`y'_`n', replace)
}

clear

log close
}




*4) ESTIMAÇÃO COM COVARIADAS (ESCOLARES, DIREÇÃO E DOCÊNCIA)

foreach n in 5 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_4.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 i.TX_RESP_Q045 ///
i.TX_ESC_Q057 i.TX_ESC_Q059 i.TX_ESC_Q061 i.TX_DIR_Q010 i.TX_PRO_Q014 ///
i.TX_DIR_Q010 TX_DIR_Q016 i.TX_PRO_Q011 i.TX_PRO_Q014 i.TX_PRO_Q050 ///
, time(ID_PROVA_BRASIL) gvar(event_plt)
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr7_`y'_`n', replace)


csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q042 i.TX_RESP_Q045 ///
i.TX_ESC_Q057 i.TX_ESC_Q059 i.TX_ESC_Q061 i.TX_DIR_Q010 i.TX_PRO_Q014 ///
i.TX_DIR_Q010 TX_DIR_Q016 i.TX_PRO_Q011 i.TX_PRO_Q014 i.TX_PRO_Q050 ///
, time(ID_PROVA_BRASIL) gvar(event_plt) notyet
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr8_`y'_`n', replace)
}

clear

log close
}


foreach n in 9 {

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\result_`n'Ano_C&S(2018)_4.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

keep if apta_plt==1

recode event_plt (4=0)
recode event_plt (1=2013)
recode event_plt (2=2015)
recode event_plt (3=2017)

tab event_plt

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
i.TX_ESC_Q057 i.TX_ESC_Q059 i.TX_ESC_Q061 i.TX_DIR_Q010 i.TX_PRO_Q014 ///
i.TX_DIR_Q010 TX_DIR_Q016 i.TX_PRO_Q011 i.TX_PRO_Q014 i.TX_PRO_Q050 ///
, time(ID_PROVA_BRASIL) gvar(event_plt)
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr7_`y'_`n', replace)


csdid `y' SEC i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
i.TX_ESC_Q057 i.TX_ESC_Q059 i.TX_ESC_Q061 i.TX_DIR_Q010 i.TX_PRO_Q014 ///
i.TX_DIR_Q010 TX_DIR_Q016 i.TX_PRO_Q011 i.TX_PRO_Q014 i.TX_PRO_Q050 ///
, time(ID_PROVA_BRASIL) gvar(event_plt) notyet
*outreg2 using "ATT_Est", excel bdec(3) ctitle(CS) replace

estat all
estat attgt
estat simple
estat event, estore(cs_est) 

*event_plot cs_est, default_look graph_opt(xtitle("Períodos desde o Tratamento")
// ytitle("Efeito Médio Causal") xlabel(-14(1)5) ///

*title("Callaway and Sant'Anna (2020)")) stub_lag(ano+#) together

csdid_plot, title(`y'_`n') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr8_`y'_`n', replace)
}

clear

log close
}




======
*###############################################################################
********************************************************************************
*#######################      DESENHO METODOLÓGICO      #######################*

ssc install bcuse
bcuse wagepan
did_multiplegt lwage nr year union, placebo(1) breps(50) cluster(nr)
did_multiplegt lwage nr year union, robust_dynamic dynamic(1) placebo(1) breps(50) cluster(nr)
