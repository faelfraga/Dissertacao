*###############################################################################
********************************************************************************
*######################     FORMANDO OS INDICADORES     #######################*           


foreach n in 5 9 {

********************************************************************************
*************************       5 e 9º ANO DO EF       *************************

log using "C:\Users\rlfra\Desktop\TIC nervoso\do.files\__IndicadoresDo`n'ºAno.smcl", replace

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble.dta"

*### STATUS SOCIOECONÔMICO - CONTÍNUA
*1) Na sua casa tem televisão em cores?
recode TX_RESP_Q005 (4=0) if ID_PROVA_BRASIL<=2011 // não tem 
recode TX_RESP_Q005 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q005 (2=1) if ID_PROVA_BRASIL>=2013 // sim, uma
recode TX_RESP_Q005 (3=2) if ID_PROVA_BRASIL>=2013 // sim, duas
recode TX_RESP_Q005 (4=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais
recode TX_RESP_Q005 (5=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais

label define tv 0 "Não tem" 1 "Sim, uma" 2 "Sim, duas" 3 "Sim, três ou mais"
label values TX_RESP_Q005 tv


*2) Na sua casa tem aparelho de rádio?
recode TX_RESP_Q006 (4=0) if ID_PROVA_BRASIL<=2011 // não tem 
recode TX_RESP_Q006 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q006 (2=1) if ID_PROVA_BRASIL>=2013 // sim, um
recode TX_RESP_Q006 (3=2) if ID_PROVA_BRASIL>=2013 // sim, dois
recode TX_RESP_Q006 (4=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais
recode TX_RESP_Q006 (5=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais

label define rd 0 "Não tem" 1 "Sim, um" 2 "Sim, dois" 3 "Sim, três ou mais"
label values TX_RESP_Q006 rd


*3) Na sua casa tem videocassete e/ou dvd?
recode TX_RESP_Q007 (2=0) if ID_PROVA_BRASIL<=2011 // não tem
recode TX_RESP_Q007 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q007 (2=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q007 (3=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q007 (4=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q007 (5=1) if ID_PROVA_BRASIL>=2013 // tem 

label define vc 0 "Não tem" 1 "Tem"
label values TX_RESP_Q007 vc


*4) Na sua casa tem geladeira?
recode TX_RESP_Q008 (3=0) if ID_PROVA_BRASIL<=2011 // não tem 
recode TX_RESP_Q008 (1=0) if ID_PROVA_BRASIL>=2013 // não tem 
recode TX_RESP_Q008 (2=1) if ID_PROVA_BRASIL>=2013 // sim, uma 
recode TX_RESP_Q008 (3=2) if ID_PROVA_BRASIL>=2013 // sim, duas ou mais 
recode TX_RESP_Q008 (4=2) if ID_PROVA_BRASIL>=2013 // sim, duas ou mais 
recode TX_RESP_Q008 (5=2) if ID_PROVA_BRASIL>=2013 // sim, duas ou mais 

label define gl 0 "Não tem" 1 "Sim, uma" 2 "Sim, duas ou mais"
label values TX_RESP_Q008 gl


*5) Na sua casa tem freezer (como parte da geladeira duplex?)
* dúvidas! 


*6) Na sua casa tem freezer separado da geladeira?
recode TX_RESP_Q010 (3=.) if ID_PROVA_BRASIL<=2011 // não sei (missing) 
recode TX_RESP_Q010 (2=0) if ID_PROVA_BRASIL<=2011 // não tem 
recode TX_RESP_Q010 (1=0) if ID_PROVA_BRASIL>=2013 // não tem 
recode TX_RESP_Q010 (2=1) if ID_PROVA_BRASIL>=2013 // tem
recode TX_RESP_Q010 (3=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q010 (4=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q010 (5=1) if ID_PROVA_BRASIL>=2013 // tem 

label define fr2 0 "Não tem" 1 "Tem"
label values TX_RESP_Q010 fr2


*7) Na sua casa tem máquina de lavar roupas (o tanquinho não é considerado)?
recode TX_RESP_Q011 (2=0) if ID_PROVA_BRASIL<=2011 // não tem
recode TX_RESP_Q011 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q011 (2=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q011 (3=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q011 (4=1) if ID_PROVA_BRASIL>=2013 // tem 
recode TX_RESP_Q011 (5=1) if ID_PROVA_BRASIL>=2013 // tem 

label define ml 0 "Não tem" 1 "Tem"
label values TX_RESP_Q011 ml


*8) Na sua casa tem carro?
recode TX_RESP_Q012 (4=0) if ID_PROVA_BRASIL<=2011 // não tem 
recode TX_RESP_Q012 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q012 (2=1) if ID_PROVA_BRASIL>=2013 // sim, um
recode TX_RESP_Q012 (3=2) if ID_PROVA_BRASIL>=2013 // sim, dois
recode TX_RESP_Q012 (4=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais
recode TX_RESP_Q012 (5=3) if ID_PROVA_BRASIL>=2013 // sim, três ou mais

label define cr 0 "Não tem" 1 "Sim, um" 2 "Sim, dois" 3 "Sim, três ou mais"
label values TX_RESP_Q012 cr


*x) Na sua casa tem computador?
* dúvidas! 


*9) Na sua casa tem banheiro?
recode TX_RESP_Q014 (5=0) if ID_PROVA_BRASIL<=2011 // não tem
recode TX_RESP_Q014 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q014 (2=1) if ID_PROVA_BRASIL>=2013 // sim, um
recode TX_RESP_Q014 (3=2) if ID_PROVA_BRASIL>=2013 // sim, dois
recode TX_RESP_Q014 (4=3) if ID_PROVA_BRASIL>=2013 // sim, três
recode TX_RESP_Q014 (5=4) if ID_PROVA_BRASIL>=2013 // sim, quatro ou mais

label define wc 0 "Não tem" 1 "Sim, um" 2 "Sim, dois" 3 "Sim, três" 4 "Sim, quatro ou mais"
label values TX_RESP_Q014 wc


*10) Na sua casa tem quantos quartos para dormir?
recode TX_RESP_Q015 (5=0) if ID_PROVA_BRASIL<=2011 // não tem
recode TX_RESP_Q015 (1=0) if ID_PROVA_BRASIL>=2013 // não tem
recode TX_RESP_Q015 (2=1) if ID_PROVA_BRASIL>=2013 // sim, um
recode TX_RESP_Q015 (3=2) if ID_PROVA_BRASIL>=2013 // sim, dois
recode TX_RESP_Q015 (4=3) if ID_PROVA_BRASIL>=2013 // sim, três
recode TX_RESP_Q015 (5=4) if ID_PROVA_BRASIL>=2013 // sim, quatro ou mais

label define qr 0 "Não tem" 1 "Sim, um" 2 "Sim, dois" 3 "Sim, três" 4 "Sim, quatro ou mais"
label values TX_RESP_Q015 qr


*11) Incluíndo você, quantas pessoas vivem atualmente na sua casa? 
recode TX_RESP_Q016 (6=5) if ID_PROVA_BRASIL<=2011|ID_PROVA_BRASIL>=2013 // cinco ou mais
recode TX_RESP_Q016 (4=5) if ID_PROVA_BRASIL<=2011 // cinco ou mais
recode TX_RESP_Q016 (3=4) if ID_PROVA_BRASIL<=2011 // quatro
recode TX_RESP_Q016 (2=3) if ID_PROVA_BRASIL<=2011 // três
recode TX_RESP_Q016 (1=2) if ID_PROVA_BRASIL<=2011|ID_PROVA_BRASIL>=2013 // duas

label define mr 2 "Uma ou duas" 3 "Três" 4 "Quatro" 5 "Cinco ou mais" 
label values TX_RESP_Q016 mr


*12) Em sua casa trabalha algum(a) empregado(a) pelo menos cinco dias por 
// semana?
recode TX_RESP_Q017 (4=0) if ID_PROVA_BRASIL<=2011 // não 
recode TX_RESP_Q017 (1=0) if ID_PROVA_BRASIL<=2011 // não 
recode TX_RESP_Q017 (1=0) if ID_PROVA_BRASIL>=2013 // não
recode TX_RESP_Q017 (2=1) if ID_PROVA_BRASIL<=2011 // sim, um(a)
recode TX_RESP_Q017 (2=1) if ID_PROVA_BRASIL>=2013 // sim, um(a)
recode TX_RESP_Q017 (3=2) if ID_PROVA_BRASIL<=2011 // sim, dois(duas) ou mais
recode TX_RESP_Q017 (3=2) if ID_PROVA_BRASIL>=2013 // sim, dois(duas) ou mais
recode TX_RESP_Q017 (4=2) if ID_PROVA_BRASIL>=2013 // sim, dois(duas) ou mais
recode TX_RESP_Q017 (5=2) if ID_PROVA_BRASIL>=2013 // sim, dois(duas) ou mais

label define ed 0 "Não" 1 "Sim, um(a)" 2 "Sim, dois(duas) ou mais"
label values TX_RESP_Q017 ed


foreach x in 2007 2009 2011 2013 2015 2017 {
pca TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q010 ///
TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q017 ///
if ID_PROVA_BRASIL==`x'
predict sec_`x'
}

gen SEC=.

foreach x in 2007 2009 2011 2013 2015 2017 {
replace SEC=sec_`x' if ID_PROVA_BRASIL==`x'
drop sec_`x'
}



*### APOIO PARENTAL - DUMMY
foreach x in 2007 2009 2011 2013 2015 2017 {
mca TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 ///
if ID_PROVA_BRASIL==`x'
predict apoio_alu`x'
}

gen APOIO=.

foreach x in 2007 2009 2011 2013 2015 2017 {
replace APOIO=apoio_alu`x' if ID_PROVA_BRASIL==`x'
drop apoio_alu`x'
}



*### PROBLEMAS DE FUNCIONAMENTO SEGUNDO O DIRETOR - CATEGÓRICA
foreach x of varlist TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 ///
TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (3=1) 
}

foreach x in 2007 2009 2011 2013 2015 2017 {
mca TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 ///
TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 if ID_PROVA_BRASIL==`x'
predict funcio_dir`x'
}

gen PROBLEMAS=.

foreach x in 2007 2009 2011 2013 2015 2017 {
replace PROBLEMAS=funcio_dir`x' if ID_PROVA_BRASIL==`x'
drop funcio_dir`x'
}



*### AJUSTANDO OD INDICADORES
foreach x of var PROBLEMAS APOIO {
egen `x'_MIN = min(`x')
gen `x'_1 = `x'-`x'_MIN
egen `x'_MAX = max(`x'_1)
gen `x'_2 = 1-(`x'_1/`x'_MAX)

drop `x' `x'_MIN `x'_1 `x'_MAX 
rename `x'_2 `x'
}

foreach x of var SEC {
egen `x'_MIN = min(`x')
gen `x'_1 = `x'-`x'_MIN
egen `x'_MAX = max(`x'_1)
gen `x'_2 = (`x'_1/`x'_MAX)

drop `x' `x'_MIN `x'_1 `x'_MAX 
rename `x'_2 `x'
}



log close


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`n'EF_cidig&pble2.dta", replace

clear
}


