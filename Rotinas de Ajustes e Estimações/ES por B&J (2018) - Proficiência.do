log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\__B&J(2018)_Proficiência.smcl", replace


*###############################################################################
********************************************************************************
*#############################     ESTIMAÇÕES     #############################*           


*INTRO) Estimação da Proficiência em Língua Portugues a Matemática pelo Método 
// de B&J(2018) para o estudo de eventos 


*###############################################################################
********************************************************************************
*#######################      DESENHO METODOLÓGICO      #######################*


foreach n in 5 9 {
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

 
/* Variáveis categóricas utilizadas nas estimações de proficiência via estudo
de eventos (para as duas etapas do Programa).

VAR: event_plt (Época de Conclusão da Instalação - Projeto Piloto)
1 - Em 2013, antes da PB
2 - Após a PB de 2013 e em 2014
3 - Em 2015, antes da PB
4 - Após a PB de 2015 e em 2016
5 - Em 2017, antes da PB
6 - Após a PB de 2017

VAR: event_pac (Época de Conclusão da Instalação - Etapa do PAC)
4 - Em 2016
5 - Em 2017, antes da PB
6 - Após a PB de 2017

*/


** VARIÁVEL DE ESTIMAÇÃO DO 'ES' PARA O PROJETO PILOTO
gen es_plt_1=. 

*ano de 2007
replace es_plt_1=-10 if ID_PROVA_BRASIL==2007 & event_plt==5
replace es_plt_1=-9 if ID_PROVA_BRASIL==2007 & event_plt==4
replace es_plt_1=-8 if ID_PROVA_BRASIL==2007 & event_plt==3
replace es_plt_1=-7 if ID_PROVA_BRASIL==2007 & event_plt==2
replace es_plt_1=-6 if ID_PROVA_BRASIL==2007 & event_plt==1

*ano de 2009
replace es_plt_1=-8 if ID_PROVA_BRASIL==2009 & event_plt==5
replace es_plt_1=-7 if ID_PROVA_BRASIL==2009 & event_plt==4
replace es_plt_1=-6 if ID_PROVA_BRASIL==2009 & event_plt==3
replace es_plt_1=-5 if ID_PROVA_BRASIL==2009 & event_plt==2
replace es_plt_1=-4 if ID_PROVA_BRASIL==2009 & event_plt==1

*ano de 2011
replace es_plt_1=-6 if ID_PROVA_BRASIL==2011 & event_plt==5
replace es_plt_1=-5 if ID_PROVA_BRASIL==2011 & event_plt==4
replace es_plt_1=-4 if ID_PROVA_BRASIL==2011 & event_plt==3
replace es_plt_1=-3 if ID_PROVA_BRASIL==2011 & event_plt==2
replace es_plt_1=-2 if ID_PROVA_BRASIL==2011 & event_plt==1

*ano de 2013
replace es_plt_1=-4 if ID_PROVA_BRASIL==2013 & event_plt==5
replace es_plt_1=-3 if ID_PROVA_BRASIL==2013 & event_plt==4
replace es_plt_1=-2 if ID_PROVA_BRASIL==2013 & event_plt==3
replace es_plt_1=-1 if ID_PROVA_BRASIL==2013 & event_plt==2
replace es_plt_1=0 if ID_PROVA_BRASIL==2013 & event_plt==1

*ano de 2015
replace es_plt_1=-2 if ID_PROVA_BRASIL==2015 & event_plt==5
replace es_plt_1=-1 if ID_PROVA_BRASIL==2015 & event_plt==4
replace es_plt_1=0 if ID_PROVA_BRASIL==2015 & event_plt==3
replace es_plt_1=1 if ID_PROVA_BRASIL==2015 & event_plt==2
replace es_plt_1=2 if ID_PROVA_BRASIL==2015 & event_plt==1

*ano de 2017
replace es_plt_1=0 if ID_PROVA_BRASIL==2017 & event_plt==5
replace es_plt_1=1 if ID_PROVA_BRASIL==2017 & event_plt==4
replace es_plt_1=2 if ID_PROVA_BRASIL==2017 & event_plt==3
replace es_plt_1=3 if ID_PROVA_BRASIL==2017 & event_plt==2
replace es_plt_1=4 if ID_PROVA_BRASIL==2017 & event_plt==1




*###############################################################################
********************************************************************************
*##########################     ESTIMAÇÕES DO ES     ##########################*           


********************************************************************************
*****************       5º e 9º ANO DO EF - PROJETO PILOTO      ****************


preserve
 
keep if apta_plt==1

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

eventdd `y', hdfe timevar(es_plt_1) ci(rcap) ///
absorb (i.ID_PROVA_BRASIL i.ID_MUNICIPIO) ///
graph_op(title("`y'", size(medsmall) color(black)) ///
subtitle("`n'º Ano do Ensino Fundamental", size(small)) ///
xtitle("Períodos", size(small)) ///
legend(order(1 "IC 95%" 2 "Coef.")) ///
note("Obs.: `e(N)'; R^2: 0`e(r2)'") ///
graphregion(fcolor(white) lcolor(white)) ///
name(grES_`n'ano_`y'_plt1, replace))
}

foreach y of varlist PROFICIENCIA_LP PROFICIENCIA_MT {

eventdd `y', hdfe timevar(es_plt_1) ci(rcap) ///
absorb (i.ID_PROVA_BRASIL i.ID_UF) ///
graph_op(title("`y'", size(medsmall) color(black)) ///
subtitle("`n'º Ano do Ensino Fundamental", size(small)) ///
xtitle("Períodos", size(small)) ///
legend(order(1 "IC 95%" 2 "Coef.")) ///
note("Obs.: `e(N)'; R^2: 0`e(r2)'") ///
graphregion(fcolor(white) lcolor(white)) ///
name(grES_`n'ano_`y'_plt2, replace))
}


restore 


clear
}




*###############################################################################
********************************************************************************
*##############################     GRÁFICOS     ##############################*           


********************************************************************************
********************       5º e 9º ANO DO EF - FE DE UF      *******************


*## GRÁFICOS DE RESULTADO DO 'ES' DE PROFICIÊNCIA DE ALUNOS DE 5º E 9º ANO 
// DOS ALUNOS ENVOLVIDOS NO PROJETO PILOTO 
graph combine grES_5ano_PROFICIENCIA_LP_plt1 grES_5ano_PROFICIENCIA_MT_plt1 ///
grES_9ano_PROFICIENCIA_LP_plt1 grES_9ano_PROFICIENCIA_MT_plt1 ///
, graphregion(fcolor(white) lcolor(white)) ///
note("Fonte: Prova Brasil (2007-2017) e CGU", size(small))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\ES_5&9ANO_PLT_Y_MN.gph", replace


*## GRÁFICOS DE RESULTADO DO 'ES' DE PROFICIÊNCIA DE ALUNOS DE 5º E 9º ANO 
// DOS ALUNOS ENVOLVIDOS NO PROJETO PILOTO 
graph combine grES_5ano_PROFICIENCIA_LP_plt2 grES_5ano_PROFICIENCIA_MT_plt2 ///
grES_9ano_PROFICIENCIA_LP_plt2 grES_9ano_PROFICIENCIA_MT_plt2 ///
, graphregion(fcolor(white) lcolor(white)) ///
note("Fonte: Prova Brasil (2007-2017) e CGU", size(small))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\ES_5&9ANO_PLT_Y_UF.gph", replace


log close


clear
