**************#####################################################*************
**************###############                       ###############*************
**************###############          PBLE         ###############*************
**************###############                       ###############*************
**************#####################################################*************

*INTRO)

********************************************************************************
******************   ORGANIZANDO AS INFORMAÇÕES DO PROGRAMA   ******************

import delimited C:\Users\rlfra\Desktop\PBLE.csv, delimiter(";") 


*PRESTADORA
gen prestadora1=., after(prestadora)

recode prestadora1 (.=1) if prestadora=="CTBC"
recode prestadora1 (.=2) if prestadora=="OI"
recode prestadora1 (.=3) if prestadora=="SERCOMTEL"
recode prestadora1 (.=4) if prestadora=="TELEFÔNICA"
recode prestadora1 (.=5) if prestadora=="TELEMAR"

label define prest 1 "CTBC" 2 "OI" 3 "SERCOMTEL" 4 "TELEFÔNICA" 5 "TELEMAR"
label values prestadora1 prest

drop prestadora
rename prestadora1 prestadora


*UF
gen id_uf=., after(uf)

recode id_uf (.=11) if uf=="RO"
recode id_uf (.=12) if uf=="AC"
recode id_uf (.=13) if uf=="AM"
recode id_uf (.=14) if uf=="RR"
recode id_uf (.=15) if uf=="PA"
recode id_uf (.=16) if uf=="AP"
recode id_uf (.=17) if uf=="TO"

recode id_uf (.=21) if uf=="MA"
recode id_uf (.=22) if uf=="PI"
recode id_uf (.=23) if uf=="CE"
recode id_uf (.=24) if uf=="RN"
recode id_uf (.=25) if uf=="PB"
recode id_uf (.=26) if uf=="PE"
recode id_uf (.=27) if uf=="AL"
recode id_uf (.=28) if uf=="SE"
recode id_uf (.=29) if uf=="BA"

recode id_uf (.=31) if uf=="MG"
recode id_uf (.=32) if uf=="ES"
recode id_uf (.=33) if uf=="RJ"
recode id_uf (.=35) if uf=="SP"

recode id_uf (.=41) if uf=="PR"
recode id_uf (.=42) if uf=="SC"
recode id_uf (.=43) if uf=="RS"

recode id_uf (.=50) if uf=="MS"
recode id_uf (.=51) if uf=="MT"
recode id_uf (.=52) if uf=="GO"
recode id_uf (.=53) if uf=="DF"

label define est 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO" ///
21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" ///
31 "MG" 32 "ES" 33 "RJ" 35 "SP" 41 "PR" 42 "SC" 43 "RS" 50 "MS" 51 "MT" ///
52 "GO" 53 "DF"	
label values id_uf est

drop uf


*** SITUAÇÃO
gen situacao1=., after(situação)

recode situacao1 (.=1) if situação=="Instalada"

label define sit 1 "Instalada"
label values situacao1 sit

drop situação
rename situacao1 situacao


*** TIPO DE OBRIGAÇÃO
gen obrigacao=., after(tipodeobrigação)
recode obrigacao (.=1) if tipodeobrigação=="PBLE                                                                                                                                                                                                                                                                                                        " 

label define obrig 1 "PBLE"
label values obrigacao obrig

drop tipodeobrigação
drop obrigacao
* ATENÇÃO: a questão dos missings (--)


*VELOCIDADE DE CONEXÃO
destring velocidadedeacessoinstalada, ignore("Mbps") generate(v_conex)
corr velocidadedeacessoinstalada v_conex
drop velocidadedeacessoinstalada


*TECNOLOGIA
gen tecnologia1=., after(tecnologia)
recode tecnologia1 (.=1) if tecnologia=="ADSL"
recode tecnologia1 (.=2) if tecnologia=="DEDICADO"
recode tecnologia1 (.=3) if tecnologia=="Fibra - FTTx"
recode tecnologia1 (.=4) if tecnologia=="Fibra - Ponto a ponto"
recode tecnologia1 (.=5) if tecnologia=="HDSL"
recode tecnologia1 (.=6) if tecnologia=="LP"
recode tecnologia1 (.=7) if tecnologia=="Rede Celular"
recode tecnologia1 (.=8) if tecnologia=="RÁDIO"
recode tecnologia1 (.=9) if tecnologia=="SATÉLITE"

label define tec 1 "ADSL" 2 "DEDICADO" 3 "FIBRA - FTTx" ///
4 "FIBRA - PONTO A PONTO" 5 "HDSL" 6 "LP" 7 "REDE DE CELULAR" 8 "RÁDIO" ///
9 "SATÉLITE"
label values tecnologia1 tec

drop tecnologia
rename tecnologia1 tecnologia


*TIPO ESCOLA
gen id_dependencia_adm=., after(tipoescola)

recode id_dependencia_adm (.=1) if tipoescola=="Federal"
recode id_dependencia_adm (.=2) if tipoescola=="Estadual"
recode id_dependencia_adm (.=3) if tipoescola=="Municipal"
recode id_dependencia_adm (.=4) if tipoescola=="Particular"

label define esc 1 "Federal" 2 "Estadual" 3 "Municipal" 4 "Particular" 
label values id_dependencia_adm esc

drop tipoescola


*DATA DE INSTALAÇÃO
gen date1=date(datadeativação,"DMY"), after(datadeativação)
format date1 %td
drop datadeativação
rename date1 data_ativ


*RENOMEANDO
rename municipio no_municipio

replace no_municipio="Abreu E Lima" if no_municipio=="Abreu e Lima"
replace no_municipio="Aparecida D'Oeste" if no_municipio=="Aparecida d'Oeste"
replace no_municipio="Brasópolis" if no_municipio=="Brazópolis"
replace no_municipio="Dias D'Ávila" if no_municipio=="Dias d'Ávila"
replace no_municipio="Eldorado dos Carajás" if no_municipio=="Eldorado do Carajás"
replace no_municipio="Embu" if no_municipio=="Embu das Artes"
replace no_municipio="Estrela D'Oeste" if no_municipio=="Estrela d'Oeste"
replace no_municipio="Gracho Cardoso" if no_municipio=="Graccho Cardoso"
replace no_municipio="Guarani D'Oeste" if no_municipio=="Guarani d'Oeste"
replace no_municipio="Herval D'Oeste" if no_municipio=="Herval d'Oeste"
replace no_municipio="Iguaraci" if no_municipio=="Iguaracy"
replace no_municipio="Itapagé" if no_municipio=="Itapajé"
replace no_municipio="Itapejara D'Oeste" if no_municipio=="Itapejara d'Oeste"
replace no_municipio="Itaporanga D'Ajuda" if no_municipio=="Itaporanga d'Ajuda"
replace no_municipio="Lagoa D'Anta" if no_municipio=="Lagoa d'Anta"
replace no_municipio="Mirassol D'Oeste" if no_municipio=="Mirassol d'Oeste"
replace no_municipio="Mãe D'Água" if no_municipio=="Mãe d'Água"
replace no_municipio="Olho D'Água" if no_municipio=="Olho d'Água"
replace no_municipio="Olho D'Água Grande" if no_municipio=="Olho d'Água Grande"
replace no_municipio="Olho D'Água das Cunhãs" if no_municipio=="Olho d'Água das Cunhãs"
replace no_municipio="Olho D'Água das Flores" if no_municipio=="Olho d'Água das Flores"
replace no_municipio="Olho D'Água do Casado" if no_municipio=="Olho d'Água do Casado"
replace no_municipio="Olho-D'Água do Borges" if no_municipio=="Olho-d'Água do Borges"
replace no_municipio="Olhos-D'Água" if no_municipio=="Olhos-d'Água"
replace no_municipio="Palmeira D'Oeste" if no_municipio=="Palmeira d'Oeste"
replace no_municipio="Passa E Fica" if no_municipio=="Passa e Fica"
replace no_municipio="Pedro Ii" if no_municipio=="Pedro II"
replace no_municipio="Pingo-D'Água" if no_municipio=="Pingo-d'Água"
replace no_municipio="Pio Ix" if no_municipio=="Pio IX"
replace no_municipio="Pio Xii" if no_municipio=="Pio XII"
replace no_municipio="Pontes E Lacerda" if no_municipio=="Pontes e Lacerda"
replace no_municipio="Poxoréo" if no_municipio=="Poxoréu"
replace no_municipio="Pérola D'Oeste" if no_municipio=="Pérola d'Oeste"
replace no_municipio="Restinga Seca" if no_municipio=="Restinga Sêca"
replace no_municipio="Quixabá" if no_municipio=="Quixaba" & id_uf==25
replace no_municipio="Santarém" if no_municipio=="Joca Claudino"
replace no_municipio="Santa Bárbara D'Oeste" if no_municipio=="Santa Bárbara d'Oeste"
replace no_municipio="Santa Clara D'Oeste" if no_municipio=="Santa Clara d'Oeste"
replace no_municipio="Santa Isabel do Pará" if no_municipio=="Santa Izabel do Pará"
replace no_municipio="Santa Rita D'Oeste" if no_municipio=="Santa Rita d'Oeste"
replace no_municipio="São Jorge D'Oeste" if no_municipio=="São Jorge d'Oeste"
replace no_municipio="São João D'Aliança" if no_municipio=="São João d'Aliança"
replace no_municipio="São João Del Rei" if no_municipio=="São João del Rei"
replace no_municipio="São João do Pau D'Alho" if no_municipio=="São João do Pau d'Alho"
replace no_municipio="São Luíz do Norte" if no_municipio=="São Luiz do Norte"
replace no_municipio="Seridó" if no_municipio=="São Vicente do Seridó"
replace no_municipio="Presidente Juscelino" if no_municipio=="Serra Caiada"
replace no_municipio="Sítio D'Abadia" if no_municipio=="Sítio d'Abadia"
replace no_municipio="Tanque D'Arca" if no_municipio=="Tanque d'Arca"
replace no_municipio="Vespasiano Correa" if no_municipio=="Vespasiano Corrêa"
replace no_municipio="Westfalia" if no_municipio=="Westfália"
replace no_municipio="Xangri-Lá" if no_municipio=="Xangri-lá"

rename mes mes_atual
rename ano ano_atual


*** Nº DO INEP (com 97% resolvido)
* são 65.324 obs no total, 63.399 após o descarte de 1.925 (~ 2,9%)
* dúvidas: o problema das escolas com letras no código, a não informada e as 
// observações que só traziam quatro números no código   
gen n1=substr(nºinep, 1, 1)

gen id_escola=nºinep, after(nºinep)
replace id_escola="." if n1=="A"|n1=="B"|n1=="C"|n1=="D"|n1=="E"|n1=="G"| ///
n1=="M"|n1=="P"|n1=="R"|n1=="S"|n1=="T"|n1=="U"|n1=="n"

rename nºinep n_inep
destring id_escola, ignore("[*]") replace


* ADICIONANDO LABEL'S 
label variable prestadora "Prestadora/Operadora do Serviço"
label variable situacao "Situação de Instalação"
label variable tecnologia "Tecnologia de Conexão"
label variable id_dependencia_adm "Dependência Administrativa"
label variable data_ativ "Data de Ativação da Programa"
label variable n1 "Variável de Ajuste"
label variable pble "Programa de Banda Larga nas Escolas"

