*###############################################################################
********************************************************************************
*#######################      DESENHO METODOLÓGICO      #######################*


*EXERCÍCIO 2) Trajetória de tratados e não tratados durante todo o período por 
// Prova e Grupo de Tratamento

foreach n in 5 9 {

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"


preserve

*a) dummy
gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3

*b) gráfico da trajetória por grupo
collapse (mean) PROFICIENCIA_LP_SAEB (mean) PROFICIENCIA_MT_SAEB ///
, by(first_treat3 ID_PROVA_BRASIL)

foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {
twoway (line `y' ID_PROVA_BRASIL if first_treat3==2013, lcolor(blue)) ///
|| (line `y' ID_PROVA_BRASIL if first_treat3==0, lcolor(red)) ///
, ytitle("Média", size(small)) xtitle("Edição da Prova Brasil", size(small)) ///
xline(2011, lpattern(vshortdash)) xlabel(2007(2)2017, labsize(small)) ///
title("Grupo de Tratados 1 (ou Grupo de 2013)", size(medsmall) color(black)) ///
legend(order(1 "Tratados" 2 "Controle") cols(1) size(small)) ///
graphregion(fcolor(white) lcolor(white)) ///
name("ex1_`y'_`n'Ano", replace)
}

foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {
twoway (line `y' ID_PROVA_BRASIL if first_treat3==2015, lcolor(blue)) ///
|| (line `y' ID_PROVA_BRASIL if first_treat3==0, lcolor(red)) ///
, ytitle("Média", size(small)) xtitle("Edição da Prova Brasil", size(small)) ///
xline(2013, lpattern(vshortdash)) xlabel(2007(2)2017, labsize(small)) ///
title("Grupo de Tratados 2 (ou Grupo de 2015)", size(medsmall) color(black)) ///
legend(order(1 "Tratados" 2 "Controle") cols(1) size(small)) ///
graphregion(fcolor(white) lcolor(white)) ///
name("ex2_`y'_`n'Ano", replace)
}


foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {
twoway (line `y' ID_PROVA_BRASIL if first_treat3==2017, lcolor(blue)) /// 
|| (line `y' ID_PROVA_BRASIL if first_treat3==0, lcolor(red)) ///
, ytitle("Média", size(small)) xtitle("Edição da Prova Brasil", size(small)) ///
xline(2015, lpattern(vshortdash)) xlabel(2007(2)2017, labsize(small)) ///
title("Grupo de Tratados 2 (ou Grupo de 2017)", size(medsmall) color(black)) ///
legend(order(1 "Tratados" 2 "Controle") cols(1) size(small)) ///
graphregion(fcolor(white) lcolor(white)) ///
name("ex3_`y'_`n'Ano", replace)
}

restore

clear
}
