

***********************MUNICÏPIO AGREGADO*************
use "/Users/flaviaferes/Dropbox/bases rafael/BASE_5EF.dta"


drop if ID_PROVA_BRASIL==.

gen obs=1


bysort ID_PROVA_BRASIL ID_MUNICIPIO: egen naluno=sum(obs)


gen first_treat3=.

recode first_treat3 .=0 if (event_plt==4| (apta_plt>=2 & apta_plt !=.))
recode first_treat3 .=2013 if event_plt==1
recode first_treat3 .=2015 if event_plt==2 
recode first_treat3 .=2017 if event_plt==3

gen first_treat2=.

recode first_treat2 .=0 if (event_plt==4| apta_plt==2 |apta_plt==5)
recode first_treat2 .=2013 if event_plt==1
recode first_treat2 .=2015 if event_plt==2 
recode first_treat2 .=2017 if event_plt==3

gen first_treat4=.

recode first_treat4 .=0 if (event_plt==4| apta_plt>=2)
recode first_treat4 .=2013 if event_plt==1
recode first_treat4 .=2015 if event_plt==2 
recode first_treat4 .=2017 if event_plt==3



collapse (mean) PROFICIENCIA_MT_SAEB PROFICIENCIA_MT PROFICIENCIA_LP_SAEB PROFICIENCIA_LP idhm10_rend idhm10_long idhm10_educ idhm10 gini10 dom_perm10 dom_pc10 dom_int_perc dom_int10 indic_acesso first_treat first_treat2 first_treat3 first_treat4 event_plt apta_plt, by(ID_PROVA_BRASIL ID_MUNICIPIO)
save "/Users/flaviaferes/Dropbox/bases rafael/banco agregado5F.dta"


log using "C:\Users\rlfra\Desktop\Dissertação - Dez, 2021\RESULTADOS\EvtMun_5.smcl", replace

foreach n in 3 2 4 {

tab first_treat`n'

foreach y of varlist PROFICIENCIA_LP_SAEB PROFICIENCIA_MT_SAEB {
 
csdid `y' idhm10_educ indic_acesso idhm10_rend, time(ID_PROVA_BRASIL) ///
i(ID_MUNICIPIO) gvar(first_treat`n')

estat all

foreach x in  2013 2015 2017 {   
csdid_plot, g(`x') title(`y') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(gr_`n'_`y'_`x', replace)
}

estat event

csdid_plot, title(`y') xtitle(Períodos em Relação ao Tratameto) ///
ytitle(Efeito Médio sobre Tratados) name(grEVENT_`y'_`n', replace)
}
}

log close
