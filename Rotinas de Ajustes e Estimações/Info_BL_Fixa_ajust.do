**************#####################################################*************
**************###############                       ###############*************
**************###############    DADOS DA ANATEL    ###############*************
**************###############                       ###############*************
**************#####################################################*************

*INTRO) Os dados utilizados na montagem deste banco foram buscados na página de 
// dados abertos da Anatel (Agência Nacional de Telecomunicações). Dispostos em
// periodicidade trimestral, o recorte realizado de imediato separa apenas as 
// informações recolhidas no final de cada ano (no 4 trimestre e/ou 12 mês). As
// informações vão de 2007 até 2018 e se referem a quantidade de acesso de cada 
// município por tipo, velocidade, meio e fornecedor de conexão. Após os ajustes 
// necessários, os dados foram transpostados e passaram a ter como referência o 
// ano e o município identificado (Dados crus -> BL_Fixa_tot -> BL_Fixa_ajust).


********************************************************************************
*********************   DADOS DA ANATEL DE 2007 A 2010    **********************

import delimited "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\Acessos_Banda_Larga_Fixa_2007-2010.csv", delimiter(";")

keep ïano mãªs portedaprestadora cãdigoibgemunicãpio meiodeacesso acessos

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2007-2010", replace

clear


*##############################################################################*

********************************************************************************
*********************   DADOS DA ANATEL DE 2011 A 2012    **********************

import delimited "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\Acessos_Banda_Larga_Fixa_2011-2012.csv", delimiter(";")

keep ïano mãªs portedaprestadora cãdigoibgemunicãpio meiodeacesso acessos

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2011-2012", replace

clear


*##############################################################################*

********************************************************************************
*********************   DADOS DA ANATEL DE 2013 A 2014    **********************

import delimited "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\Acessos_Banda_Larga_Fixa_2013-2014.csv", delimiter(";")

keep ïano mãªs portedaprestadora cãdigoibgemunicãpio meiodeacesso acessos

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2013-2014", replace

clear


*##############################################################################*

********************************************************************************
*********************   DADOS DA ANATEL DE 2015 A 2016    **********************

import delimited "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\Acessos_Banda_Larga_Fixa_2015-2016.csv", delimiter(";")

keep ïano mãªs portedaprestadora cãdigoibgemunicãpio meiodeacesso acessos

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2015-2016", replace

clear


*##############################################################################*

********************************************************************************
*********************   DADOS DA ANATEL DE 2017 A 2018    **********************

import delimited "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\Acessos_Banda_Larga_Fixa_2017-2018.csv", delimiter(";")

keep ïano mãªs portedaprestadora cãdigoibgemunicãpio meiodeacesso acessos

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2017-2018", replace

clear


*##############################################################################*

********************************************************************************
********************    COMBINANDO TODAS AS INFORMAÇÕES    *********************

use "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2007-2010"

append using "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2011-2012"
append using "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2013-2014"
append using "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2015-2016"
append using "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_fixa_2017-2018"

save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_Fixa_tot", replace

*Gerando, renomeando e rotulando variáveis categógricas para cada variável que 
// foi apresentada com variadas opções em texto 
gen tam_operad=0
recode tam_operad (0=1) if portedaprestadora=="Pequeno Porte"
recode tam_operad (0=2) if portedaprestadora=="Grande Porte"
label define tam 1 "Pequeno Porte" 2 "Grande Porte"
label values tam_operad tam

/*
gen veloc_conex=0
recode veloc_conex (0=1) if faixadevelocidade=="0Kbps a 64Kbps"|faixadevelocidade=="64Kbps a 512Kbps"|faixadevelocidade=="0Kbps a 512Kbps"
recode veloc_conex (0=2) if faixadevelocidade=="512kbps a 2Mbps" 
recode veloc_conex (0=3) if faixadevelocidade=="2Mbps a 12Mbps"|faixadevelocidade=="12Mbps a 34Mbps"|faixadevelocidade=="2Mbps a 34Mbps"
recode veloc_conex (0=4) if faixadevelocidade=="> 34Mbps"
label define vel 1 "0Kbps a 512Kbps" 2 "512kbps a 2Mbps" 3 "2Mbps a 34Mbps" 4 "> 34Mbps" 
label values veloc_conex vel
*/

gen meio_acesso=0
recode meio_acesso (0=1) if meiodeacesso=="Cabo Coaxial"
recode meio_acesso (0=2) if meiodeacesso=="Cabos MetÃ¡licos"
recode meio_acesso (0=3) if meiodeacesso=="Fibra Ãptica"
recode meio_acesso (0=4) if meiodeacesso=="HÃ­brido"
recode meio_acesso (0=5) if meiodeacesso=="LTE"
recode meio_acesso (0=6) if meiodeacesso=="RÃ¡dio"
recode meio_acesso (0=7) if meiodeacesso=="SatÃ©lite" 
recode meio_acesso (0=8) if meiodeacesso=="Outra"
label define meio 1 "Cabo Coaxial" 2 "Cabos Metálicos" 3 "Fibra Óptica" 4 "Híbrido" 5 "LTE" 6 "Rádio" 7 "Satélite" 8 "Outra"
label values meio_acesso meio

rename ïano ano
rename mãªs mes
rename cãdigoibgemunicãpio id_municipio
rename acessos qtd_acesso

drop portedaprestadora
*drop faixadevelocidade
drop meiodeacesso

gen data_1=yq(ano,(mes/3)) if mes==3|mes==6|mes==9|mes==12
format data_1 %tq
gen data_2=ym(ano, mes) if ano>=2011
format data_2 %tm

sort ano mes

label variable ano "Ano"
label variable mes "Mês"
label variable id_municipio "Código do Município" 
label variable qtd_acesso "Quantidade de Acesso (Base para qtd_acesso1)"
label variable tam_operad "Tamanho da Operadora Local"
*label variable veloc_conex "Faixas de Velocidade de Conexão"
label variable meio_acesso "Meios Tecnológicos de Conexão"
label variable data_1 "Periodicidade Trimestral dos Dados (2007-2018)"
label variable data_2 "Periodicidade Mensal dos Dados (2011-2018)"



save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_Fixa_tot", replace


*##############################################################################*

********************************************************************************
**********************     TRANSPONDO AS INOFORMAÇÕES    ***********************

*Agrupando município e data: essa variável será o nosso novo id para cada par 
// município-data.
egen var1 = group(id_municipio data_1)
egen var2 = group(tam_operad meio_acesso)

*Identificando as combinações diferentes em "var2"
bys var2: gen nvals = _n == 1

*Execute esse comando para ver qual o número de cada combinação de 
// tamanho-meio
list var2 tam_operad meio_acesso if nvals == 1

***OBS.: Note que são 16 combinações possíveis de tam_operad e meio_acess onde 
// cada uma destas combinação será chamada de "dupla")

*Gerando uma variável para cada uma das 16 combinações
forval k = 1/16 {
gen var_`k' = 0
}
	
*Total de acesso para cada par município-ano-dupla: fiz isso pois tinha mais de 
// uma linha para cada município-data-dupla. 
bys var1 var2: egen qtd_acesso1 = total(qtd_acesso)
order qtd_acesso1, before(var_1)

*Deletando duplicadas
bys var1 var2: gen dup = cond(_N==1,0,_n)
drop if dup >= 2	

*Manipulando (com certeza está ineficiente, mas foi o jeito tosco que consegui 
// fazer, não precisa entender o passo a passo)
forvalues k = 1/16{
replace var_`k' = `k'
}
	
forvalues k = 1/16{
replace var_`k' = . if var_`k' != var2
}

forvalues k = 1/16{
replace var_`k' = qtd_acesso1 if var_`k' == var2
}
		
foreach var of varlist var_1-var_16{
sort var1 `var'
bys var1: replace `var' = `var'[_n-1] if `var'[_n-1] != .
}

*Deletando todas as linhas para cada par munincipio-ano menos uma delas. 
bys var1: gen unique = _n
keep if unique == 1

*Rotulando todas as combinações criadas
label variable var1 "Variável de Ajuste 1 (id_municipio-data_1)"
label variable var2 "Variável de Ajuste 2 (tam_operad–meio_acesso)"
label variable qtd_acesso1 "Quantidade de Acesso – (Correta!)"

label variable var_1 "Pequeno Porte; Cabo Coaxial"
label variable var_2 "Pequeno Porte; Cabos Metálicos"
label variable var_3 "Pequeno Porte; Fibra Óptica"
label variable var_4 "Pequeno Porte; Híbrido"
label variable var_5 "Pequeno Porte; LTE"
label variable var_6 "Pequeno Porte; Rádio"
label variable var_7 "Pequeno Porte; Satélite"
label variable var_8 "Pequeno Porte; Outra"
label variable var_9 "Grande Porte; Cabo Coaxial"
label variable var_10 "Grande Porte; Cabos Metálicos"
label variable var_11 "Grande Porte; Fibra Óptica"
label variable var_12 "Grande Porte; Híbrido"
label variable var_13 "Grande Porte; LTE"
label variable var_14 "Grande Porte; Rádio"
label variable var_15 "Grande Porte; Satélite"
label variable var_16 "Grande Porte; Outra"

drop nvals dup unique 


compress


save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_Fixa_ajust", replace


================================================================================
################################################################################
================================================================================

use "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_Fixa_ajust"

merge m:m id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_Cidig2.dta"


save "C:\Users\rlfra\Desktop\TIC nervoso\Dados da Anatel\BL_Fixa_ajust&cidig", replace


*1) trimestral
gen trim_plt=qofd(relat_plt)
format %tq trim_plt

gen trim_pac=qofd(relat_pac)
format %tq trim_pac

gen dist_k_plt=data_1-trim_plt
gen dist_k_pac=data_1-trim_pac

*2) mensal
gen mes_plt=qofd(relat_plt)
format %tm trim_plt

gen mes_pac=qofd(relat_pac)
format %tm trim_pac

gen dist_k_plt_=data_2-mes_plt
gen dist_k_pac_=data_2-mes_pac



preserve 

keep if apta_plt==1
replace dist_k_pl=. if event_plt==6

foreach y of varlist var_2 var_3 var_10 var_11 {
eventdd `y', hdfe timevar(dist_k_plt) ci(rcap) ///
absorb (i.ano i.id_regiao) accum lags(20) leads(10) ///
graph_op(title("`y'", size(medsmall) color(black)) ///
subtitle("2007-2018", size(small)) ///
xtitle("Períodos", size(small)) ///
legend(order(1 "IC 95%" 2 "Coef.")) ///
note("Obs.: `e(N)'; R^2: 0`e(r2)'") ///
graphregion(fcolor(white) lcolor(white)) ///
name(grES_`y'_plt_1, replace))
}

restore



preserve 

keep if apta_pac==1 & relat_pac!=.

foreach y of varlist var_2 var_3 var_10 var_11 {
eventdd `y', hdfe timevar(dist_k_pac) ci(rcap) ///
absorb (i.ano i.id_regiao) accum lags(11) leads(11) ///
graph_op(title("`y'", size(medsmall) color(black)) ///
subtitle("2007-2018", size(small)) ///
xtitle("Períodos", size(small)) ///
legend(order(1 "IC 95%" 2 "Coef.")) ///
note("Obs.: `e(N)'; R^2: 0`e(r2)'") ///
graphregion(fcolor(white) lcolor(white)) ///
name(grES_`y'_pac_1, replace))
}

restore

graph combine grES_var_2_pac_1 grES_var_3_pac_1 ///
grES_var_10_pac_1  grES_var_11_pac_1 ///
, graphregion(fcolor(white) lcolor(white)) ///
note("Fonte: Dados Abertos da Anatel (2007-2018)", size(small))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\ES_ANATEL_PAC.gph", replace

