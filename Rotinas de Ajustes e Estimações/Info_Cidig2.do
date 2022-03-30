**************#####################################################*************
**************###############                       ###############*************
**************###############   CIDADES DIGITAIS    ###############*************
**************###############                       ###############*************
**************#####################################################*************

*INTRO) O Banco "Info_Cidig2" traz infomações sobre o Programa Cidades Digitais
// e demais características municipais que influenciam a escolha das candidatas
// para a aplicação do Projeto. Estes dados foram obtidos por consulta pública 
// ao Portal da Transparência via Controladoria Geral da União e algumas buscas
// dentro do próprio site do Ministério das Comunicações. No mais, em relação à
// execução do script abaixo, são idealizados alguns passos de ajuste dos dados
// e outras combinações de informações com o intuito de formar uma base geral.    


********************************************************************************
*****************   TODOS OS MUNICÍPIOS DO BRASIL ATÉ 2018    ******************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\RELATORIO_DTB_BRASIL_MUNICIPIO.xls", sheet("DTB_2018_Municipio") firstrow

*Passando importantes variáveis em texto para númericas 
destring CódigoMunicípioCompleto, generate(id_municipio) 
drop CódigoMunicípioCompleto

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_DTB_2018", replace

clear

*##############################################################################*

********************************************************************************
*********************   DADOS MUNICIPAIS - VIA IBGE/SIDRA   ********************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Densidade de Internet - Censo 2010.xlsx", sheet("Tabela") firstrow

*Passando a variáveil de código municipal para numérica 
destring id_municipio, replace 

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_DensidadeInt", replace

clear


*##############################################################################*

********************************************************************************
********************   DADOS MUNICIPAIS - VIA ATLAS BRASIL   *******************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\AtlasBrasil_Consulta.xlsx", sheet("Atlas Brasil") firstrow

*Renomeando as variáveis
rename Código id_municipio 
rename Espacialidades no_municipio1 
rename ÍndicedeGini2010 gini10
rename Populaçãototal2010 pop_tot10
rename Populaçãorural2010 pop_rur10
rename Populaçãourbana2010 pop_urb10
rename IDHM2010 idhm10
rename IDHMRenda2010 idhm10_rend
rename IDHMLongevidade2010 idhm10_long
rename IDHMEducação2010 idhm10_educ
rename Rendapercapita2010 renda10_pc

*Tirando o Brasil
drop if id_municipio==76

*Unindo as informações do Atlas Brasil, do Censo 2010 e do IBGE de modo geral
merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_DTB_2018.dta", generate(_merge1)
merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_DensidadeInt.dta", generate(_merge2)

*Codificando municípios mais jovens
foreach x in 1504752 4212650 4220000 4314548 5006275 {
replace no_municipio1=Nome_Município if id_municipio==`x'
}

drop Nome_Município _merge1 _merge2

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_AtlasBrasil.dta", replace

clear


*##############################################################################*

********************************************************************************
*****************************   DADOS DAS CIDADES   ****************************

import excel "C:\Users\rlfra\OneDrive\Área de Trabalho\TIC nervoso\Cidades Digitais\Cidades Digitais - Base do MCTIC.xlsx", sheet("Planilha1") firstrow

*Renomendo as variáveis
rename Cidade no_municipio2
rename CÓDIGOIBGE id_municipio
rename ValorPrevisto valor_prev
rename PONTOSATENDIDOS pts_atend
rename STATUSIMPLANTAÇÃO status
rename ValorPagoBruto valor_pago

gen status_n=0 
recode status_n (0=1) if status=="Implantada"
recode status_n (0=2) if status=="Paralisada"
recode status_n (0=3) if status=="Sem Previsão"
recode status_n (0=4) if status=="em implantação"
recode status_n (0=.) if status=="."

*Excluindo a variável populacional desta planilha
drop UF POPULAÇÃOESTIMADA2016 status
rename status_n status

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_CidigMCTI.dta", replace

clear


*##############################################################################*

********************************************************************************
*****************************   DADOS DAS CIDADES   ****************************

*==== explicar o que foi feito nos arquivos """PPac2 e PPiloto""" ====*
NÃO LEMRO, MAS TENHO QUE LEMBRAR!!!

*##############################################################################*

********************************************************************************
**************************     CIDADES APTAS DO PAC    *************************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Cidades Avaliadas pela Comissao.xlsx", sheet("Avaliação total") firstrow

*Renomeando as variáveis 
rename CODIBGE id_municipio
rename Município no_municipio5

*Gerando a variável de habilitação à etapa do PAC
gen apta_pac=0
replace apta_pac=1 if Apto=="x"|Apto=="X"
replace apta_pac=3 if NãoApto=="x"|NãoApto=="X"

*Excluindo as variáveis de UF e Região desta planilha
drop UF REGIÃO Apto NãoApto 

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig1.dta", replace

clear


*##############################################################################*

********************************************************************************
***********************     ESCOLHIDAS NA ETAPA DO PAC    **********************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Cidades Avaliadas pela Comissao.xlsx", sheet("Cidades Concluídas - PAC") firstrow clear

*Renomeando as variáveis
rename Cidade no_municipio2
rename RELATÓRIODEFISCALIZAÇÃO relat_pac

*Combinando as informações para obter o código municipal do IBGE
merge 1:1 no_municipio2 using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_CidigMCTI.dta"

rename no_municipio2 no_municipio6

*Completando as informações com cidades atendidas após JUN/2020
gen dia=.
gen mes=.
gen ano=.

// Curitibanos
replace dia=22 if id_municipio==4204806
replace mes=9 if id_municipio==4204806
replace ano=2020 if id_municipio==4204806

// Anguera
replace dia=13 if id_municipio==2901502
replace mes=10 if id_municipio==2901502
replace ano=2020 if id_municipio==2901502

// Bom Jesus da Serra
replace dia=13 if id_municipio==2903953
replace mes=10 if id_municipio==2903953
replace ano=2020 if id_municipio==2903953

// Barra do Choça
replace dia=26 if id_municipio==2902906
replace mes=10 if id_municipio==2902906
replace ano=2020 if id_municipio==2902906

// Guaramirim
replace dia=28 if id_municipio==4206504
replace mes=10 if id_municipio==4206504
replace ano=2020 if id_municipio==4206504

// Boituva
replace dia=29 if id_municipio==3507001
replace mes=10 if id_municipio==3507001
replace ano=2020 if id_municipio==3507001

// Bonito de Minas
replace dia=20 if id_municipio==3108255
replace mes=11 if id_municipio==3108255
replace ano=2020 if id_municipio==3108255

// Louveira
replace dia=20 if id_municipio==3527306
replace mes=11 if id_municipio==3527306
replace ano=2020 if id_municipio==3527306

// Caçapava do Sul
replace dia=18 if id_municipio==4302808
replace mes=12 if id_municipio==4302808
replace ano=2020 if id_municipio==4302808

// São Joaquim
replace dia=23 if id_municipio==4216503
replace mes=12 if id_municipio==4216503
replace ano=2020 if id_municipio==4216503

// Presidente Tancredo Neves
replace dia=13 if id_municipio==2925758
replace mes=1 if id_municipio==2925758
replace ano=2021 if id_municipio==2925758

// Itaqui
replace dia=8 if id_municipio==4310603
replace mes=3 if id_municipio==4310603
replace ano=2021 if id_municipio==4310603

// Rio Pardo
replace dia=23 if id_municipio==4315701
replace mes=3 if id_municipio==4315701
replace ano=2021 if id_municipio==4315701

* data
gen date=mdy(mes,dia,ano), after(relat_pac)
format %td date

replace relat_pac=date if id_municipio==2925758|id_municipio==2901502| ///
id_municipio==2902906|id_municipio==2903953|id_municipio==3108255| ///
id_municipio==4302808|id_municipio==4310603|id_municipio==4315701| ///
id_municipio==4216503|id_municipio==4204806|id_municipio==4206504| ///
id_municipio==3527306|id_municipio==3507001

*Exclíndo variáveis já existentes que se repetiam nesta planilha
drop UF date valor_prev pts_atend status valor_pago _merge dia mes ano

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig2.dta", replace

clear


*##############################################################################*

********************************************************************************
***********************     ESCOLHIDAS NA ETAPA PILOTO    **********************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Cidades Avaliadas pela Comissao.xlsx", sheet("Cidades Concluídas - Projeto Pi") firstrow

*Renomeando as variáveis
rename Cidade no_municipio2
rename RELATÓRIODEFISCALIZAÇÃO relat_plt

*Combinando as informações para obter o código municipal do IBGE
merge 1:1 no_municipio2 using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_CidigMCTI.dta"

rename no_municipio2 no_municipio7

*Exclíndo variáveis já existentes que se repetiam nesta planilha (assim como no 
// caso da etapa do PAC) 
drop UF PROJETO valor_prev pts_atend status valor_pago _merge

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig3.dta", replace

clear


*##############################################################################*

********************************************************************************
*************************     SELEÇÃO DA ETAPA PILOTO    ***********************

import excel "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Chamada do Programa Piloto.xlsx", sheet("Plan1") firstrow

*Combinando as informações para obter o código municipal do IBGE
merge m:m no_municipio1 using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_AtlasBrasil.dta"

*Excluíndo municípios duplicados (como o mesmo nome e que não faziam parte do 
// processo de seleção do programa) 
drop if id_municipio==1714880
drop if id_municipio==4106704
drop if id_municipio==2200202
drop if id_municipio==2700102
drop if id_municipio==3169109
drop if id_municipio==4124806
drop if id_municipio==3163300
drop if id_municipio==2412005
drop if id_municipio==2110500
drop if id_municipio==2928505
drop if id_municipio==2925808
drop if id_municipio==3204302
drop if id_municipio==1721000
drop if id_municipio==2309201
drop if id_municipio==1714203
drop if id_municipio==2205532
drop if id_municipio==4112405
drop if id_municipio==2405108
drop if id_municipio==3522802
drop if id_municipio==2305506
drop if id_municipio==4309704
drop if id_municipio==2604601
drop if id_municipio==1200203
drop if id_municipio==2402303
drop if id_municipio==5001508

*O caso da cidade de Paulista-PB (Detalhar...)
drop if id_municipio==2610707

*Os casos das cidades de Paranoá e Sobradinho II, no DF
drop if no_municipio1=="BrasíliaPARANOÁ"
drop if no_municipio1=="BrasíliaSOBRADINHOII"

recode apta_plt (1=5) if id_municipio==2308351 
recode apta_plt (1=5) if id_municipio==2604155 
recode apta_plt (1=5) if id_municipio==2604700 
recode apta_plt (1=5) if id_municipio==3201308 
recode apta_plt (1=5) if id_municipio==3305158 
recode apta_plt (1=5) if id_municipio==4102406 
recode apta_plt (1=5) if id_municipio==4304200 
recode apta_plt (1=5) if id_municipio==4312906

*Organizando para que apenas as informações sobre a chamada da etapa PILOTO
// esteja presente nesta planilha
rename no_municipio1 no_municipio8

keep id_municipio no_municipio8 apta_plt indic_plt a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 b1 b2 b3 c1 c2 c3 item_a item_b item_c

drop if apta_plt==.

save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig4.dta", replace

clear


*##############################################################################*

********************************************************************************
********************    COMBINANDO TODAS AS INFORMAÇÕES   **********************

use "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_AtlasBrasil.dta"


*Criando um marcador inicial de merge's
gen _merge0=0
label define merg 0 "Inicial"
label values _merge0 merg

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_CidigMCTI.dta", generate (_merge1)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_PPac.dta", generate (_merge2)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_PPiloto.dta", generate (_merge3)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig1.dta", generate (_merge4)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig2.dta", generate (_merge5)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig3.dta", generate (_merge6)

merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_TranspCidig4.dta", generate (_merge7)


*ANALISE e CONFIRA!!!


*Criando dummy's de estado e região para todos os municípios
gen d_1=id_municipio*1/100000
gen d_2=id_municipio*1/1000000

gen id_regiao=floor(d_2), before(id_municipio)
gen id_uf=floor(d_1), before(id_municipio)

label define rg 1 "NO" 2 "NE" 3 "SE" 4 "SU" 5 "CO"
label values id_regiao rg

label define uf 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO" 21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" 31 "MG" 32 "ES" 33 "RJ" 35 "SP" 41 "PR" 42 "SC" 43 "RS" 50 "MS" 51 "MT" 52 "GO" 53 "DF"
label values id_uf uf

drop d_1 d_2


*Excluíndo e ajustando informações essenciais
drop _merge0 no_municipio2 _merge1 no_municipio3 _merge2 no_municipio4 _merge3 no_municipio5 _merge4 no_municipio6 _merge5 no_municipio7 _merge6 no_municipio8 _merge7


*Criando as variáveis de proporção de populacional e de internet, como é feito
// no processo de seleção da Etapa do PAC
gen dom_int_perc=dom_int10/dom_perm10

egen pop_tot_perc=pc(pop_tot10), prop

gen indic_acesso=pop_tot_perc/dom_int_perc


*Renomeando as categorias de variáveis indicadoras do Programa
replace p_plt=. if p_plt==1 & status!=1

label define stt 1 "Implantada" 2 "Paralisada" 3 "Sem Previsão" 4 "Em Andamento"
label values status stt

label define ppac 1 "Atendida pelo PAC"
label values p_pac ppac

label define pplt 1 "Atendida pelo Projeto Piloto"
label values p_plt pplt

recode apta_pac (1=2) if apta_pac==1 & p_pac!=1 

label define appac 1 "Candidata apta e selecionada" 2 "Candidata apta e não selecionada" 3 "Candidata não apta"
label values apta_pac appac

label define applt 1 "Candidata selecionada" 2 "Candidata eliminada por falta de vagas" 3 "Candidata eliminada por falta de acesso" 4 "Candidata eliminada por pontos" 5 "Candidata selecionada que desistiu" 
label values apta_plt applt


*Criando uma dummy de eventos para a data de conclusão da instalação da 
// infraestrutura de rede
gen event_plt=0
recode event_plt (0=1) if relat_plt<19704 & relat_plt!=.
recode event_plt (0=2) if relat_plt>=19704 & relat_plt<20396
recode event_plt (0=3) if relat_plt>=20396 & relat_plt<21122
recode event_plt (0=4) if relat_plt>=21122 & relat_plt!=.
recode event_plt (0=.) 

gen event_pac=0
recode event_pac (0=3) if relat_pac<21173 & relat_pac!=.
recode event_pac (0=4) if relat_pac>=21173 & relat_pac!=.
recode event_pac (0=.) 

label define event 1 "Antes da PB de 2013" 2 "Entre as PBs de 2013 e 2015" 3 "Entre as PBs de 2015 e 2017" 4 "Após a PB de 2017" 
label values event_plt event
label values event_pac event


/*
*Criando uma dummy ANUAL de eventos para a data de conclusão da instalação da 
// infraestrutura de rede - é a solução??
gen event_plt=0
recode event_plt (0=1) if relat_plt<19704 & relat_plt!=.
recode event_plt (0=2) if relat_plt>=19704 & relat_plt<20115
recode event_plt (0=3) if relat_plt>=20115 & relat_plt<20396
recode event_plt (0=4) if relat_plt>=20396 & relat_plt<21035
recode event_plt (0=5) if relat_plt>=21035 & relat_plt<21122
recode event_plt (0=6) if relat_plt>=21122 & relat_plt!=.
recode event_plt (0=.) 

gen event_pac=0
recode event_pac (0=4) if relat_pac<21026 & relat_pac!=.
recode event_pac (0=5) if relat_pac>=21026 & relat_pac<21173
recode event_pac (0=6) if relat_pac>=21173 & relat_pac!=.
recode event_pac (0=.) 
// ATENÇÃO PARA AS ADIÇÕES E PARA A PROVA PB DE 2019

label define evt 1 "Em 2013, antes da PB" 2 "Após a PB de 2013 ou em 2014" ///
3 "Em 2015, antes da PB" 4 "Após a PB de 2015 ou em 2016" ///
5 "Em 2017, antes da PB" 6 "Após da PB de 2017" 

label values event_plt evt
label values event_pac evt
*/


*Rotulando todas as variáveis
label variable id_regiao "Código Regional do IBGE"
label variable id_uf "Código Estadual do IBGE"
label variable id_municipio "Código Municipal do IBGE"
label variable no_municipio1 "Município"
label variable gini10 "Índice de Gini - Censo 2010"
label variable pop_tot10 "População Total - Censo 2010" 
label variable pop_rur10 "População Rural - Censo 2010"
label variable pop_urb10 "População Urbana - Censo 2010"
label variable idhm10 "Índice de Desenvolvimento Humano - Censo 2010" 
label variable idhm10_rend "IDH pela Renda - Censo 2010"
label variable idhm10_long "IDH pela Longevidade - Censo 2010"
label variable idhm10_educ "IDH pela Educação - Censo 2010"
label variable renda10_pc "Renda per capita"
label variable dom_perm10 "Domicílios Permanentes - Censo 2010"
label variable dom_pc10 "Domicílios com Microcomputador - Censo 2010"
label variable dom_int10 "Domicílios com Microcomputador com acesso à internet - Censo 2010"
label variable valor_prev "Valor de Investimento Previsto"
label variable pts_atend "Pontos Instalados"
label variable status "Status de Implantação" 
label variable valor_pago "Valor de Investimento Pago" 
label variable p_pac "Cidades Atendidas na Etapa do PAC"
label variable p_plt "Cidades Atendidas no Projeto Piloto" 
label variable apta_pac "Cidades Aptas à Seleção do PAC" 
label variable apta_plt "Cidades Aptas à Seleção do Projeto Piloto"
label variable relat_pac "Data do Relatório de Conclusão - PAC"
label variable relat_plt "Data do Relatório de Conclusão - Projeto Piloto"
label variable indic_plt "Pontuação Total de cada município no processo de seleção do Projeto Piloto"
label variable a1 "Categoria 1 do Item A"
label variable a2 "Categoria 2 do Item A"
label variable a3 "Categoria 3 do Item A"
label variable a4 "Categoria 4 do Item A"
label variable a5 "Categoria 5 do Item A"
label variable a6 "Categoria 6 do Item A"
label variable a7 "Categoria 7 do Item A"
label variable a8 "Categoria 8 do Item A"
label variable a9 "Categoria 9 do Item A"
label variable a10 "Categoria 10 do Item A"
label variable b1 "Categoria 1 do Item B"
label variable b2 "Categoria 2 do Item B"
label variable b3 "Categoria 3 do Item B"
label variable c1 "Categoria 1 do Item C"
label variable c2 "Categoria 2 do Item C"
label variable c3 "Categoria 3 do Item C"
label variable item_a "Pontuação do Item A (de Apresentação do Projeto) de cada município no processo de seleção do Projeto Piloto"
label variable item_b "Pontuação do Item B (de Capacidade Gerencial e Técnica) de cada município no processo de seleção do Projeto Piloto"
label variable item_c "Pontuação do Item C (da Densidade de Banda Larga, do IFDM da FIRJAM e das Contas Públicas) de cada município no processo de seleção do Projeto Piloto"
label variable dom_int_perc "Percentual Municipal de Domicílios com acesso à internet - (A)"
label variable pop_tot_perc "Percentual da População Municipal em relação à População Brasileira - (B)"
label variable indic_acesso "Indicador de Acesso - (B)/(A)"
label variable event_plt "Época de Conclusão da Instalação - Projeto Piloto"
label variable event_pac "Época de Conclusão da Instalação - PAC"


compress


save "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_Cidig2.dta", replace


================================================================================
################################################################################
================================================================================



================================================================================
################################################################################
================================================================================

** CRIANDO UMA VARIÁVEL DE MACRORREGIÃO
gen cod_regiao2=0
replace cod_regiao2=1 if uf=="ES"|uf=="MG"|uf=="RJ"|uf=="SP"
replace cod_regiao2=2 if uf=="AL"|uf=="BA"|uf=="PB"|uf=="PE"|uf=="SE"|uf=="MA"|uf=="RN"|uf=="PI"|uf=="CE"
replace cod_regiao2=3 if uf=="AC"|uf=="AM"|uf=="AP"|uf=="PA"|uf=="RO"|uf=="RR"|uf=="TO"
replace cod_regiao2=4 if uf=="PR"|uf=="RS"|uf=="SC"
replace cod_regiao2=5 if uf=="DF"|uf=="GO"|uf=="MT"|uf=="MS"

** CRIANDO UMA VARIÁVEL DE CIDADES ATENDIDAS 
gen cidig=0
replace cidig=1 if status=="Implantada"

** ENTITULANDO AS VARIÁVEIS
label variable id_municipio "Código do Município"
label variable popest2016_mil "População Estimada em 2016 (mil)"
label variable pts_atend "Pontos de Atendimento"
label variable status "Status de Implantação"
label variable popest2016 "População Estimada em 2016 (total)"
label variable cidig "Cidades Atendidas"
label variable cod_regiao2 "Região"

save "C:\Users\rlfra\OneDrive\Área de Trabalho\TIC nervoso\Cidades Digitais\CIDig.dta", replace

** COMBINANDO OS DADOS DE DESNVOLVIMENTO DAS CIDADES DIGITAIS
merge 1:1 id_municipio using "C:\Users\rlfra\OneDrive\Área de Trabalho\TIC nervoso\Cidades Digitais\idh&gini_MunBra.dta"

** CONFERIR AS CIDADES E EXCLUIR A VARIÁVEL ABAIXO!
drop Espacialidades 

** RENOMEANDO AS VARIÁVEIS DO BANCO DE IDH'S E GINI
rename ÍndicedeGini2010 gini
rename IDHM2010 idhm10
rename IDHMRenda2010 idhm10_rend
rename IDHMLongevidade2010 idhm10_long
rename IDHMEducação2010 idhm10_educ

** arrumando umas coisas (1)!
label define reg 1 "Sudeste" 2 "Nordeste" 3 "Norte" 4 "Sul" 5 "Centro-Oeste"
label values cod_regiao2 reg

** dando merges referentes aos progrmas piloto e de extensão!!!! (2)

** arrumando umas coisas (3)!
label variable _merge1 "Merge do Projeto Piloto"
label variable _merge2 "Merge da Extensão do Projeto"
label variable p_piloto "Projeto Piloto do Programa Cidades Digitais"
label variable p_extensao "Extensão do Programa Cidades Digitais"

** arrumando umas coisas (4)!
replace cidade="Água Azul do Norte" if id_municipio==1500347
replace cidade="Buriti" if id_municipio==2102200
replace cidade="Riachão do Poço" if id_municipio==2512762
replace cidade="Sobrado" if id_municipio==2515971

** arrumando umas coisas (5)!
replace id_municipio=3201308 if cidade=="Cariacica"
replace id_municipio=2308351 if cidade=="Milhã"
replace id_municipio=2604155 if cidade=="Casinhas"
replace id_municipio=2604700 if cidade=="Correntes"
replace id_municipio=4102406 if cidade=="Bandeirantes"
replace id_municipio=3305158 if cidade=="São José do Vale do Rio Preto"
replace id_municipio=4312906 if cidade=="Nova Bassano"
replace id_municipio=4304200 if cidade=="Candelária"

** arrumando umas coisas (6)!
drop if id_municipio==1714880
drop if id_municipio==4106704
drop if id_municipio==2200202
drop if id_municipio==2700102
drop if id_municipio==3169109
drop if id_municipio==4124806
drop if id_municipio==3163300
drop if id_municipio==2412005
drop if id_municipio==2110500
drop if id_municipio==2928505
drop if id_municipio==2925808
drop if id_municipio==3204302
drop if id_municipio==1721000
drop if id_municipio==2309201
drop if id_municipio==1714203
drop if id_municipio==2205532
drop if id_municipio==4112405
drop if id_municipio==2405108
drop if id_municipio==3522802
drop if id_municipio==2305506
drop if id_municipio==4309704
drop if id_municipio==2604601
drop if id_municipio==1200203
drop if id_municipio==2402303
drop if id_municipio==5001508

** atualizando as cidades contempladas de AGO/2020 a MAR/2021
id_municipio==4204806 - 22/09/2020 - Curitibanos
id_municipio==2901502 - 13/10/2020 - Anguera
id_municipio==2903953 - 13/10/2020 - Bom Jesus da Serra
id_municipio==2902906 - 26/10/2020 - Barra do Choça
id_municipio==4206504 - 28/10/2020 - Guaramirim 
id_municipio==3507001 - 29/10/2020 - Boituva 
id_municipio==3108255 - 20/11/2020 - Bonito de Minas
id_municipio==3527306 - 20/11/2020 - Louveira
id_municipio==4302808 - 18/12/2020 - Caçapava do Sul
id_municipio==4216503 - 23/12/2020 - São Joaquim
id_municipio==2925758 - 13/01/2021 - Presidente Tancredo Neves
id_municipio==4310603 - 08/03/2021 - Itaqui 
id_municipio==4315701 - 23/03/2021 - Rio Pardo
