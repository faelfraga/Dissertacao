*###############################################################################
********************************************************************************
*#############################       KERNEL       #############################*

**OBS.: No 9º ano só mantemos o drop na proficiência com valores 4 e -4



*###############################################################################
********************************************************************************
*############################      BETA PLOT       ############################*
                     
* português 

*BETA_1 - Controle 1 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_1): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==1, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(a1, replace)

twoway (connect coef t if control_plt_1==2, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==2, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(a2, replace)

twoway (connect coef t if control_plt_1==3, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==3, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(a3, replace)


clear



*BETA_2 - Controle 2 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2015|ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_2): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/4 {
local j =`i'+5
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_6-_stat_9

reshape long coef ci_low ci_high, i(control_plt_2) j(t)

forvalues i = 1/4 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_2==1, lcolor(blue)) ///
(connect coef t if control_plt_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_2==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(a4, replace)


clear



*BETA_3 - Controle 3 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_3): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/5 {
local j =`i'+6
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_7-_stat_11

reshape long coef ci_low ci_high, i(control_plt_3) j(t)

forvalues i = 1/5 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_3==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_3==1, lcolor(blue)) ///
(connect coef t if control_plt_3==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_3==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(a5, replace)


clear



*BETA_4 - Controle 4 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_4): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_4) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_4==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_4==1, lcolor(blue)) ///
(connect coef t if control_plt_4==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_4==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 3" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(a6, replace)


clear



*BETA_5 - Controle 1 do PAC 2

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_1): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_1==1, lcolor(blue)) ///
(connect coef t if control_pac_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_1==0, lcolor(red)) ///
, title(Português) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(b1, replace)

clear



*BETA_6 - Controle 2 do PAC 2

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_2): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_2) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_2==1, lcolor(blue)) ///
(connect coef t if control_pac_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_2==0, lcolor(red)) ///
, title(Português) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(b2, replace)


clear



* matemática

*BETA_1 - Controle 1 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_1): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==1, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(c1, replace)

twoway (connect coef t if control_plt_1==2, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==2, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(c2, replace)

twoway (connect coef t if control_plt_1==3, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==3, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(c3, replace)


clear



*BETA_2 - Controle 2 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2015|ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_2): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/4 {
local j =`i'+5
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_6-_stat_9

reshape long coef ci_low ci_high, i(control_plt_2) j(t)

forvalues i = 1/4 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_2==1, lcolor(blue)) ///
(connect coef t if control_plt_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_2==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(c4, replace)


clear



*BETA_3 - Controle 3 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_3): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/5 {
local j =`i'+6
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_7-_stat_11

reshape long coef ci_low ci_high, i(control_plt_3) j(t)

forvalues i = 1/5 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_3==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_3==1, lcolor(blue)) ///
(connect coef t if control_plt_3==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_3==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(c5, replace)


clear



*BETA_4 - Controle 4 do PLT

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_4): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_4) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_4==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_4==1, lcolor(blue)) ///
(connect coef t if control_plt_4==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_4==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 3" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(c6, replace)


clear



*BETA_5 - Controle 1 do PAC 2

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_1): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_1==1, lcolor(blue)) ///
(connect coef t if control_pac_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_1==0, lcolor(red)) ///
, title(Matemática) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(d1, replace)

clear



*BETA_6 - Controle 2 do PAC 2

use "C:\Users\rlfra\Desktop\rapida1.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_2): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_2) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_2==1, lcolor(blue)) ///
(connect coef t if control_pac_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_2==0, lcolor(red)) ///
, title(Matemática) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(d2, replace)


clear



** combinando os gráficos 

graph combine a1 a2 a3 a4 a5 a6 ///
, title(Trajetória Estimada da Proficiência em Português) ///
subtitle(Grupos de Controle do Projeto Piloto) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_lp5_plt.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_lp5_plt.png", as(png) replace

graph combine b1 b2 d1 d2 ///
, title(Trajetória Estimada da Proficiência) ///
subtitle(Grupos de Controle da Etapa do PAC 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_pb5_pac.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_pb5_pac.png", as(png) replace

graph combine c1 c2 c3 c4 c5 c6 ///
, title(Trajetória Estimada da Proficiência em Matemética) ///
subtitle(Grupos de Controle do Projeto Piloto) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_mt5_plt.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_mt5_plt.png", as(png) replace


clear











*###############################################################################
********************************************************************************
*#############################       KERNEL       #############################*


use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2013 & PROFICIENCIA_MT>4| ///
ID_PROVA_BRASIL==2013 & PROFICIENCIA_MT<-4| ///
ID_PROVA_BRASIL==2013 & PROFICIENCIA_LP>4| ///
ID_PROVA_BRASIL==2013 & PROFICIENCIA_LP<-4

*português

twoway (kdensity PROFICIENCIA_LP if control_plt_1==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 1" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt1_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt1_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_LP if control_plt_1==2, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 2" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt2_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt2_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_LP if control_plt_1==3, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 3" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt3_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt3_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_LP if control_plt_4==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_4==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 3" 2 "Controle 4")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 4) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt3_cont4.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt3_cont4.png", as(png) replace

twoway (kdensity PROFICIENCIA_LP if control_pac_1==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_pac_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Etapa do PAC 2 - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_pac1_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_pac1_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_LP if control_pac_2==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_pac_2==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento" 2 "Controle 2")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Etapa do PAC 2 - Grupo de Controle 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_pac1_cont2.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_pac1_cont2.png", as(png) replace

*matemática

twoway (kdensity PROFICIENCIA_MT if control_plt_1==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 1" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt1_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt1_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_MT if control_plt_1==2, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 2" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt2_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt2_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_MT if control_plt_1==3, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_plt_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 3" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt3_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt3_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_MT if control_plt_4==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_4==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 3" 2 "Controle 4")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 4) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt3_cont4.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt3_cont4.png", as(png) replace

twoway (kdensity PROFICIENCIA_MT if control_pac_1==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_pac_1==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento" 2 "Controle 1")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Etapa do PAC 2 - Grupo de Controle 1) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_pac1_cont1.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_pac1_cont1.png", as(png) replace

twoway (kdensity PROFICIENCIA_MT if control_pac_2==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_pac_2==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento" 2 "Controle 2")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Etapa do PAC 2 - Grupo de Controle 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_pac1_cont2.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_pac1_cont2.png", as(png) replace

*demais controles

drop if ID_PROVA_BRASIL==2017

* português

twoway (kdensity PROFICIENCIA_LP if control_plt_3==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_3==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 2" 2 "Controle 3")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 3) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt2_cont3.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt2_cont3.png", as(png) replace

* matemática

twoway (kdensity PROFICIENCIA_MT if control_plt_3==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_MT if control_plt_3==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 2" 2 "Controle 3")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 3) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt2_cont3.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt2_cont3.png", as(png) replace

drop if ID_PROVA_BRASIL==2015

* português

twoway (kdensity PROFICIENCIA_LP if control_plt_2==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_2==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 1" 2 "Controle 2")) ///
by(, title(Distribução Kernel de Proficiência em Português) ///
subtitle(Projeto Piloto - Grupo de Controle 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt1_cont2.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_lp9_plt1_cont2.png", as(png) replace

* matemática

twoway (kdensity PROFICIENCIA_MT if control_plt_2==1, lcolor(blue)) ///
(kdensity PROFICIENCIA_LP if control_plt_2==0, lcolor(red)) ///
, ytitle(Densidade) xtitle(Proficiência) ///
legend(order(1 "Tratamento 1" 2 "Controle 2")) ///
by(, title(Distribução Kernel de Proficiência em Matemática) ///
subtitle(Projeto Piloto - Grupo de Controle 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)) ///
by(ID_PROVA_BRASIL)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt1_cont2.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\kernel_mt9_plt1_cont2.png", as(png) replace


clear



**OBS.: No 9º ano só mantemos o drop na proficiência com valores 4 e -4



*###############################################################################
********************************************************************************
*############################      BETA PLOT       ############################*
                     
* português 

*BETA_1 - Controle 1 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_1): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==1, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(a1, replace)

twoway (connect coef t if control_plt_1==2, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==2, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(a2, replace)

twoway (connect coef t if control_plt_1==3, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==3, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(a3, replace)


clear



*BETA_2 - Controle 2 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2015|ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_2): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/4 {
local j =`i'+5
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_6-_stat_9

reshape long coef ci_low ci_high, i(control_plt_2) j(t)

forvalues i = 1/4 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_2==1, lcolor(blue)) ///
(connect coef t if control_plt_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_2==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(a4, replace)


clear



*BETA_3 - Controle 3 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_3): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/5 {
local j =`i'+6
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_7-_stat_11

reshape long coef ci_low ci_high, i(control_plt_3) j(t)

forvalues i = 1/5 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_3==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_3==1, lcolor(blue)) ///
(connect coef t if control_plt_3==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_3==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(a5, replace)


clear



*BETA_4 - Controle 4 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_4): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_4) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_4==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_4==1, lcolor(blue)) ///
(connect coef t if control_plt_4==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_4==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 3" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(a6, replace)


clear



*BETA_5 - Controle 1 do PAC 2

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_1): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_1==1, lcolor(blue)) ///
(connect coef t if control_pac_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_1==0, lcolor(red)) ///
, title(Português) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(b1, replace)

clear



*BETA_6 - Controle 2 do PAC 2

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_2): regress PROFICIENCIA_LP ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_2) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_2==1, lcolor(blue)) ///
(connect coef t if control_pac_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_2==0, lcolor(red)) ///
, title(Português) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(b2, replace)


clear



* matemática

*BETA_1 - Controle 1 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_1): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==1, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(c1, replace)

twoway (connect coef t if control_plt_1==2, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==2, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(c2, replace)

twoway (connect coef t if control_plt_1==3, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_1==3, lcolor(blue)) ///
(connect coef t if control_plt_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_1==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(c3, replace)


clear



*BETA_2 - Controle 2 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2015|ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_2): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/4 {
local j =`i'+5
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_6-_stat_9

reshape long coef ci_low ci_high, i(control_plt_2) j(t)

forvalues i = 1/4 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_2==1, lcolor(blue)) ///
(connect coef t if control_plt_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_2==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 1" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2011 2013, lpattern(vshortdash)) name(c4, replace)


clear



*BETA_3 - Controle 3 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

drop if ID_PROVA_BRASIL==2017

statsby _b _se , clear by(control_plt_3): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/5 {
local j =`i'+6
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_7-_stat_11

reshape long coef ci_low ci_high, i(control_plt_3) j(t)

forvalues i = 1/5 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_3==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_3==1, lcolor(blue)) ///
(connect coef t if control_plt_3==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_3==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 2" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2013 2015, lpattern(vshortdash)) name(c5, replace)


clear



*BETA_4 - Controle 4 do PLT

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_plt_4): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_plt_4) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_plt_4==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_plt_4==1, lcolor(blue)) ///
(connect coef t if control_plt_4==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_plt_4==0, lcolor(red)) ///
, ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento 3" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(c6, replace)


clear



*BETA_5 - Controle 1 do PAC 2

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_1): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_1) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_1==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_1==1, lcolor(blue)) ///
(connect coef t if control_pac_1==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_1==0, lcolor(red)) ///
, title(Matemática) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 1" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(d1, replace)

clear



*BETA_6 - Controle 2 do PAC 2

use "C:\Users\rlfra\Desktop\rapida2.dta"

keep if apta_pac!=.|apta_plt!=.|event_plt!=.|event_pac!=.

statsby _b _se , clear by(control_pac_2): regress PROFICIENCIA_MT ib2007.ID_PROVA_BRASIL

forvalues i = 1/6 {
local j =`i'+7
gen ci_low`i' = _stat_`i' - 1.96*_stat_`j'
gen ci_high`i' = _stat_`i' + 1.96*_stat_`j'
rename _stat_`i' coef`i'
}

drop _stat_8-_stat_13

reshape long coef ci_low ci_high, i(control_pac_2) j(t)

forvalues i = 1/6 {
local j = `i'*2+2005
recode t (`i'=`j')
}

twoway (connect coef t if control_pac_2==1, mcolor(blue) lcolor(blue)) ///
(rcap ci_low ci_high t if control_pac_2==1, lcolor(blue)) ///
(connect coef t if control_pac_2==0, mcolor(red) lcolor(red)) ///
(rcap ci_low ci_high t if control_pac_2==0, lcolor(red)) ///
, title(Matemática) ytitle(Proficiência) xtitle(Edição) ///
legend(order(1 "Tratamento" 2 "IC 95%" 3 "Controle 2" 4 "IC 95%") cols(2)) ///
graphregion(fcolor(white) lcolor(white)) ///
xline(2015 2017, lpattern(vshortdash)) name(d2, replace)


clear



** combinando os gráficos 

graph combine a1 a2 a3 a4 a5 a6 ///
, title(Trajetória Estimada da Proficiência em Português) ///
subtitle(Grupos de Controle do Projeto Piloto) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_lp9_plt.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_lp9_plt.png", as(png) replace

graph combine b1 b2 d1 d2 ///
, title(Trajetória Estimada da Proficiência) ///
subtitle(Grupos de Controle da Etapa do PAC 2) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_pb9_pac.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_pb9_pac.png", as(png) replace

graph combine c1 c2 c3 c4 c5 c6 ///
, title(Trajetória Estimada da Proficiência em Matemética) ///
subtitle(Grupos de Controle do Projeto Piloto) ///
graphregion(fcolor(white) lcolor(white)) ///
note(Fonte: Elaboração Própria)
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_mt9_plt.gph", replace
graph export "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\beta_mt9_plt.png", as(png) replace


clear
