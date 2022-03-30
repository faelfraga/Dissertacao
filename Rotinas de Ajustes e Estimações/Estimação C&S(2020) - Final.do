*###############################################################################
********************************************************************************
*########################     BASE_nEF_cidig&pble2     ########################*           


*OBS 1) Sempre troque o "log" e o "use" de acordo com o ano regredido
*OBS 2) Existem dois Desenhos Metodológicos: (A) um contendo o Grupo de 2013
// e (B) outro sem o Grupo de 2013 (de acordo com o texto)


use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_9EF_cidig&pble2.dta"


*###############################################################################
********************************************************************************
*######################      DESENHO METODOLÓGICO A      ######################*

preserve

drop if ID_PROVA_BRASIL==.
drop if apta_plt==.


*** ONDE O GRUPO DE CONTROLE É COMPOSTO POR TODAS AS APTAS NÃO SELECIONADAS + 
// AQUELAS QUE FORAM SELECIONADAS E AINDA NÃO FORAM CONTEMPLADAS
gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3

*** ONDE O GRUPO DE CONTROLE É COMPOSTO PELAS APTAS QUE FICARAM FORA POR FALTA 
// DE VAGAS E/OU QUE DESISITRAM + AQUELAS QUE FORAM SELECIONADAS E AINDA NÃO 
// FORAM CONTEMPLADAS
gen first_treat2=.

recode first_treat2 .=0 if (event_plt==4| apta_plt==2 |apta_plt==5)
recode first_treat2 .=2013 if event_plt==1
recode first_treat2 .=2015 if event_plt==2 
recode first_treat2 .=2017 if event_plt==3

*** ONDE O GRUPO DE CONTROLE É COMPOSTO POR AQUELAS QUE FORAM SELECIONADAS E 
// AINDA NÃO FORAM CONTEMPLADAS
gen first_treat1=.

recode first_treat1 .=0 if event_plt==4
recode first_treat1 .=2013 if event_plt==1
recode first_treat1 .=2015 if event_plt==2 
recode first_treat1 .=2017 if event_plt==3


foreach n in 2 {

tab first_treat`n'

foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {

csdid `y' i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
i.TX_RESP_Q049 i.TX_ESC_Q041 SEC APOIO PROBLEMAS idhm10_educ pble ///
, time(ID_PROVA_BRASIL) gvar(first_treat`n') cluster(ID_MUNICIPIO) 

estat all

foreach x in 2013 2015 2017 {
csdid_plot, g(`x') title(`n'_`y'_`x') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr`n'_`y'_`x'a, replace)
}

estat event, estore(cs_est) 

csdid_plot, title(`y') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(grEVENT_`y'_`n'a, replace)
}
}

restore



*###############################################################################
********************************************************************************
*######################      DESENHO METODOLÓGICO B      ######################*


drop if ID_PROVA_BRASIL==.
drop if apta_plt==.


*** ONDE O GRUPO DE CONTROLE É COMPOSTO POR TODAS AS APTAS NÃO SELECIONADAS + 
// AQUELAS QUE FORAM SELECIONADAS E AINDA NÃO FORAM CONTEMPLADAS
gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3

*** ONDE O GRUPO DE CONTROLE É COMPOSTO PELAS APTAS QUE FICARAM FORA POR FALTA 
// DE VAGAS E/OU QUE DESISITRAM + AQUELAS QUE FORAM SELECIONADAS E AINDA NÃO 
// FORAM CONTEMPLADAS
gen first_treat2=.

recode first_treat2 .=0 if (event_plt==4| apta_plt==2 |apta_plt==5)
recode first_treat2 .=2015 if event_plt==2 
recode first_treat2 .=2017 if event_plt==3

*** ONDE O GRUPO DE CONTROLE É COMPOSTO POR AQUELAS QUE FORAM SELECIONADAS E 
// AINDA NÃO FORAM CONTEMPLADAS
gen first_treat1=.

recode first_treat1 .=0 if event_plt==4
recode first_treat1 .=2015 if event_plt==2 
recode first_treat1 .=2017 if event_plt==3

keep ID_MUNICIPIO ID_PROVA_BRASIL first_treat2 PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB TX_RESP_Q002 TX_RESP_Q013 TX_RESP_Q045 TX_RESP_Q048 TX_RESP_Q049 TX_ESC_Q041 SEC APOIO PROBLEMAS idhm10_educ pble

foreach n in 2 {

tab first_treat`n'

foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {

csdid `y' i.TX_RESP_Q002 i.TX_RESP_Q013 i.TX_RESP_Q045 i.TX_RESP_Q048 ///
i.TX_RESP_Q049 i.TX_ESC_Q041 SEC APOIO PROBLEMAS idhm10_educ pble ///
, time(ID_PROVA_BRASIL) gvar(first_treat`n') cluster(ID_MUNICIPIO) 

estat all

foreach x in 2015 2017 {
csdid_plot, g(`x') title(`n'_`y'_`x') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(_gr`n'_`y'_`x'a, replace)
}

estat event, estore(cs_est) 

csdid_plot, title(`y') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(_grEVENT_`y'_`n'a, replace)
}
}

clear



