**************#####################################################*************
**************###############                       ###############*************
**************###############   PROVA BRASIL/SAEB   ###############*************
**************###############                       ###############*************
**************#####################################################*************


*INTRO) ANALISE DESCRITIVA EM COMBINAÇÃO COM AS INFORMAÇÕES DO PROGRAMA CIDADES
// DIGITAIS. 

.
.
.

*###############################################################################
********************************************************************************
*##########################       5º ANO DO EF      ###########################*



********************************************************************************
***************************         AJUSTANDO       ****************************

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_5EF", replace


** Primeiro filtro sobre as observações: retirando alunos do ensino médio, 
// alunos de escolas particulares e demais participantes do SAEB por além da PB
drop if ID_SERIE==12|ID_SERIE==13
drop if ID_DEPENDENCIA_ADM==4
keep if IN_PROVA_BRASIL==1	


** Recodificando as informações sobre a raça dos indivíduos 
recode TX_RESP_Q002 (2=0) if ID_PROVA_BRASIL<=2015
recode TX_RESP_Q002 (3=2) if ID_PROVA_BRASIL<=2015
recode TX_RESP_Q002 (0=3) if ID_PROVA_BRASIL<=2015


** Recodificando as informações sobre a posse de computador dos indivíduos 
recode TX_RESP_Q013 (3=0) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (2=1) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (1=0) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (3=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (4=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (5=1) if ID_PROVA_BRASIL>=2013

label define comp_1 0 "Não tem" 1 "Tem"
label values TX_RESP_Q013 comp_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador de apoio parental ao aluno
foreach x of var TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 ///
TX_RESP_Q031 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define apoio_1 1 "Não" 2 "Sim"

foreach x of var TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 ///
TX_RESP_Q031 {
label values `x' apoio_1
}


** Recodificando e rotulando para que as variáveis de Atividades na Internet e
// Trabalho fora de casa para que fiquem em ordem crescente
recode TX_RESP_Q036 (1=0)
recode TX_RESP_Q036 (3=1)
recode TX_RESP_Q036 (0=3)

label define inter_1 1 "Nunca ou quase nunca" 2 "De vez em quando" 3 "Sempre ou quase sempre"
label values TX_RESP_Q036 inter_1

recode TX_RESP_Q042 (1=0)
recode TX_RESP_Q042 (2=1)
recode TX_RESP_Q042 (0=2)

label define traba_1 1 "Não" 2 "Sim" 
label values TX_RESP_Q042 traba_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis escolares de equipamento 
foreach x of var TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 ///
TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 ///
TX_ESC_Q018 TX_ESC_Q019 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define equip_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 ///
TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 ///
TX_ESC_Q018 TX_ESC_Q019 {
label values `x' equip_1
}


** Recodificando, rotulando, colocando em ordem crescente e ajustando em só uma
// variáveis as informações sobre as salas de aula
recode TX_ESC_Q020 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q020 (4=2) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q021 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q021 (4=2) if ID_PROVA_BRASIL>=2013

label define salas_1 1 "Menos de 50%" 2 "Mais de 50%"

foreach x of var TX_ESC_Q020 TX_ESC_Q021 {
label values `x' salas_1
}


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis escolares de segurança
foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 {
recode `x' (2=1) if ID_PROVA_BRASIL>=2013
recode `x' (3=1) if ID_PROVA_BRASIL>=2013 
recode `x' (4=2) if ID_PROVA_BRASIL>=2013
}

recode TX_ESC_Q036 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q036 (3=2) if ID_PROVA_BRASIL>=2013

foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 ///
TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define segur_1 1 "Não" 2 "Sim"

foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 ///
TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 {
label values `x' segur_1
}


** Recodificando, rotulando e colocando em ordem crescente as variáveis que 
// apontam a existência e a qualidade de computadores e acesso à internet
foreach x of var TX_ESC_Q037 TX_ESC_Q038 TX_ESC_Q039 TX_ESC_Q040 TX_ESC_Q041 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define tics_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q037 TX_ESC_Q038 TX_ESC_Q039 TX_ESC_Q040 TX_ESC_Q041 {
label values `x' tics_1
}


** Recodificando, rotulando e colocando em ordem crescente as variáveis que 
// apontam a existência de biblioteca, quadra e laboratório nas escolas
foreach x of var TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define estru_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061 {
label values `x' estru_1
}


** Recodificando e rotulando as informações sobre o grau de escolaridade do
// diretor  
recode TX_DIR_Q004 (5=0) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (6=5) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (0=6) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (2=1) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (3=1) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (4=2) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (5=3) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (6=0) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (7=4) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (8=5) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (9=6) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (10=7) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (0=7) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (7=6) if ID_PROVA_BRASIL>=2013
recode TX_DIR_Q004 (8=6) if ID_PROVA_BRASIL>=2013
recode TX_DIR_Q004 (9=7) if ID_PROVA_BRASIL>=2013

label define escol_2 1 "Menos que o Ensino Médio (antigo 2º grau)" 2 "Ensino Médio - Magistério (antigo 2º grau)" 3 "Ensino  Médio - Outros (antigo 2º grau)" 4 "Ensino Superior - Pedagogia" 5 "Ensino Superior - Curso Normal Superior" 6 "Ensino Superior - Outras Licenciaturas" 7 "Ensino Superior - Outros"
label values TX_DIR_Q004 escol_2


** Recodificando e rotulando as variáveis de salário do diretor: passamos as 
// informações para a grandeza de "salários minímos" e ajustamos o ano de 2007  
recode TX_DIR_Q010 (9=8) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (10=9) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (11=9) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (12=10) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (13=11) if ID_PROVA_BRASIL==2007

label define remun_1 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_DIR_Q010 remun_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis de experiência do diretor 
foreach x of var TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 {
recode `x' (2=1) if ID_PROVA_BRASIL>=2011
recode `x' (3=2) if ID_PROVA_BRASIL>=2011
recode `x' (4=3) if ID_PROVA_BRASIL>=2011
recode `x' (5=3) if ID_PROVA_BRASIL==2011
recode `x' (5=4) if ID_PROVA_BRASIL>=2013
recode `x' (6=4) if ID_PROVA_BRASIL==2011
recode `x' (6=5) if ID_PROVA_BRASIL>=2013
recode `x' (7=5) if ID_PROVA_BRASIL>=2011
recode `x' (8=5) if ID_PROVA_BRASIL>=2011
}

label define exper_1 1 "Há menos de 2 anos" 2 "De 2 a 4 anos" 3 "De 5 a 10 anos" 4 "De 11 a 15 anos" 5 "Há mais de 15 anos"

foreach x of var TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 {
label values `x' exper_1
}


** Recodificando e rotulando as informações sobre a realização de atividades
// para o desenvolvimento profissional de diretores 
recode TX_DIR_Q019 (1=0)
recode TX_DIR_Q019 (2=1)
recode TX_DIR_Q019 (0=2)

label define trein_1 1 "Não" 2 "Sim" 
label values TX_DIR_Q019 trein_1


** Rotulando em ordem crescente as informações sobre a presença de professores
// estáveis na escola 
label define estab_1 1 "Menor ou igual a 25%" 2 "De 26% a 50%" 3 "De 51% a 75%" 4 "De 76% a 90%" 5 "De 91% a 100%" 
label values TX_DIR_Q028 estab_1


** Recodificando, rotulando, colocanco em ordem crescente e criando um 
// indicador através das variáveis de problemas no funcionamento da escola 
foreach x of var TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 ///
TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 {
recode `x' (3=2) if ID_PROVA_BRASIL>=2013
recode `x' (4=3) if ID_PROVA_BRASIL>=2013
}

label define funci_1 1 "Não" 2 "Sim, moderado" 3 "Sim, grave"

foreach x of var TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 ///
TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 {
label values `x' funci_1
}


** Recodificando, rotulando, colocanco em ordem crescente e criando um 
// indicador através das variáveis de apoio ao diretor
foreach x of var TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define apoio_2 1 "Não" 2 "Sim"

foreach x of var TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 {
label values `x' apoio_2
}


** Recodificando e rotulando as informações de escolaridade do professor: 
// somou-se as categorias com "outros" e passou-se "cur" para antes de "outros"
recode TX_PRO_Q004 (9=8) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (5=0) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (6=5) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (7=6) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (0=7) if ID_PROVA_BRASIL>=2013

label define escol_3 1 "Menos que o Ensino Médio (antigo 2º grau)" 2 "Ensino Médio - Magistério (antigo 2º grau)" 3 "Ensino  Médio - Outros (antigo 2º grau)" 4 "Ensino Superior - Pedagogia" 5 "Ensino Superior - Curso Normal Superior" 6 "Ensino Superior - Licenciatura em Matemática" 7 "Ensino Superior - Licenciatura em Letras" 8 "Ensino Superior – Outras Licenciaturas ou Áreas"
label values TX_PRO_Q004 escol_3


** Recodificando e rotulando as variáveis de salário do professor: passamos as 
// informações para a grandeza de "salários minímos" e ajustamos o ano de 2007  
recode TX_PRO_Q010 (9=8) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (10=9) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (11=9) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (12=10) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (13=11) if ID_PROVA_BRASIL==2007

label define remun_2 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_PRO_Q010 remun_2


** Recodificando, rotulando, colocando em ordem crescente e criando um 
// indicador de experiência do professor  
foreach x of var TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 {
recode `x' (5=4) if ID_PROVA_BRASIL==2011
recode `x' (6=5) if ID_PROVA_BRASIL==2011
recode `x' (7=6) if ID_PROVA_BRASIL==2011
recode `x' (8=7) if ID_PROVA_BRASIL==2011
}

label define exper_2 1 "Meu primeiro ano" 2 "1-2 anos" 3 "3-5 anos" 4 "6-10 anos" 5 "11-15 anos" 6 "15-20 anos" 7 "Há mais de 20 anos"

foreach x of var TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 {
label values `x' exper_2
}


** Recodificando e rotulando as informações sobre a realização de atividades
// para o desenvolvimento profissional de professores 
foreach x of var TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 {
recode `x' (3=2)
recode `x' (4=2)
recode `x' (5=2)
}

label define trein_2a 1 "Não" 2 "Sim"

foreach x of var TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 {
label values `x' trein_2a
}

recode TX_PRO_Q011 (1=0)
recode TX_PRO_Q011 (2=1)
recode TX_PRO_Q011 (0=2)
replace TX_PRO_Q011=1 if TX_PRO_Q021==1 & TX_PRO_Q022==1 & TX_PRO_Q023==1 & TX_PRO_Q024==1
replace TX_PRO_Q011=2 if TX_PRO_Q021==2|TX_PRO_Q022==2|TX_PRO_Q023==2|TX_PRO_Q024==2

label define trein_2b 1 "Não" 2 "Sim"
label values TX_PRO_Q011 trein_2b


** Recodificando e rotulando para que as variáveis de Atividades na Internet e
// Trabalho fora de casa para que fiquem em ordem crescente
recode TX_PRO_Q040 (1=0) if ID_PROVA_BRASIL==2011
recode TX_PRO_Q040 (3=1) if ID_PROVA_BRASIL==2011
recode TX_PRO_Q040 (0=3) if ID_PROVA_BRASIL==2011

label define inter_2 1 "Nunca ou quase nunca" 2 "De vez em quando" 3 "Sempre ou quase sempre"
label values TX_PRO_Q040 inter_2


** Recodificando, rotulando e colocando em ordem crescente as informações sobre 
// a utilização do computador e da internet como ferramenta pedagógica
foreach x of var TX_PRO_Q049 TX_PRO_Q050 {
recode `x' (4=3) if ID_PROVA_BRASIL>=2013
recode `x' (3=0) if ID_PROVA_BRASIL<=2011
recode `x' (1=3) if ID_PROVA_BRASIL<=2011
recode `x' (0=1) if ID_PROVA_BRASIL<=2011
}

label define tics_2 1 "Não, porque não tem" 2 "Não, sem necessidade" 3 "Sim" 

foreach x of var TX_PRO_Q049 TX_PRO_Q050 {
label values `x' tics_2
}


drop _merge1 _merge2 _merge3 APP_2015 APP_2013 APP_2011 ///
APP_2009 APP_2007 

compress

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_5EF_AJUSTADA", replace

clear






*###############################################################################
********************************************************************************
*##########################       9º ANO DO EF      ###########################*



********************************************************************************
***************************         AJUSTANDO       ****************************

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_9EF", replace


** Primeiro filtro sobre as observações: retirando alunos do ensino médio, 
// alunos de escolas particulares e demais participantes do SAEB por além da PB
drop if ID_SERIE==12|ID_SERIE==13
drop if ID_DEPENDENCIA_ADM==4
keep if IN_PROVA_BRASIL==1	


** Recodificando as informações sobre a raça dos indivíduos 
recode TX_RESP_Q002 (2=0) if ID_PROVA_BRASIL<=2015
recode TX_RESP_Q002 (3=2) if ID_PROVA_BRASIL<=2015
recode TX_RESP_Q002 (0=3) if ID_PROVA_BRASIL<=2015


** Recodificando as informações sobre a posse de computador dos indivíduos 
recode TX_RESP_Q013 (3=0) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (2=1) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (1=0) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (3=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (4=1) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (5=1) if ID_PROVA_BRASIL>=2013

label define comp_1 0 "Não tem" 1 "Tem"
label values TX_RESP_Q013 comp_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador de apoio parental ao aluno
foreach x of var TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 ///
TX_RESP_Q031 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define apoio_1 1 "Não" 2 "Sim"

foreach x of var TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 ///
TX_RESP_Q031 {
label values `x' apoio_1
}


** Recodificando e rotulando para que as variáveis de Atividades na Internet e
// Trabalho fora de casa para que fiquem em ordem crescente
recode TX_RESP_Q038 (1=0)
recode TX_RESP_Q038 (3=1)
recode TX_RESP_Q038 (0=3)

label define inter_1 1 "Nunca ou quase nunca" 2 "De vez em quando" 3 "Sempre ou quase sempre"
label values TX_RESP_Q038 inter_1

recode TX_RESP_Q045 (1=0)
recode TX_RESP_Q045 (2=1)
recode TX_RESP_Q045 (0=2)

label define traba_1 1 "Não" 2 "Sim" 
label values TX_RESP_Q045 traba_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis escolares de equipamento 
foreach x of var TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 ///
TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 ///
TX_ESC_Q018 TX_ESC_Q019 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define equip_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 ///
TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 ///
TX_ESC_Q018 TX_ESC_Q019 {
label values `x' equip_1
}


** Recodificando, rotulando, colocando em ordem crescente e ajustando em só uma
// variáveis as informações sobre as salas de aula
recode TX_ESC_Q020 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q020 (4=2) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q021 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q021 (4=2) if ID_PROVA_BRASIL>=2013

gen salas_esc=.
replace salas_esc=1 if TX_ESC_Q020==2 & TX_ESC_Q021==2
replace salas_esc=2 if TX_ESC_Q020==1 & TX_ESC_Q021==2
replace salas_esc=3 if TX_ESC_Q020==2 & TX_ESC_Q021==1
replace salas_esc=4 if TX_ESC_Q020==1 & TX_ESC_Q021==1

label define salas_1 1 "Não Iluminada e Não Arejada" 2 "Só Iluminada" 3 "Só Arejada" 4 "Iluminada e Arejada"
label values salas_esc salas_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis escolares de segurança
foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 {
recode `x' (2=1) if ID_PROVA_BRASIL>=2013
recode `x' (3=1) if ID_PROVA_BRASIL>=2013 
recode `x' (4=2) if ID_PROVA_BRASIL>=2013
}

recode TX_ESC_Q036 (2=1) if ID_PROVA_BRASIL>=2013
recode TX_ESC_Q036 (3=2) if ID_PROVA_BRASIL>=2013

foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 ///
TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define segur_1 1 "Não" 2 "Sim"

foreach x of var TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 ///
TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 ///
TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 {
label values `x' segur_1
}


** Recodificando, rotulando e colocando em ordem crescente as variáveis que 
// apontam a existência e a qualidade de computadores e acesso à internet
foreach x of var TX_ESC_Q037 TX_ESC_Q038 TX_ESC_Q039 TX_ESC_Q040 TX_ESC_Q041 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define tics_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q037 TX_ESC_Q038 TX_ESC_Q039 TX_ESC_Q040 TX_ESC_Q041 {
label values `x' tics_1
}


** Recodificando, rotulando e colocando em ordem crescente as variáveis que 
// apontam a existência de biblioteca, quadra e laboratório nas escolas
foreach x of var TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061 {
recode `x'(4=5)
recode `x'(1=4)
recode `x'(2=0)
recode `x'(3=2)
recode `x'(0=3)
recode `x'(5=1)
}

label define estru_1 1 "Inexistente" 2 "Ruim" 3 "Regular" 4 "Bom"

foreach x of var TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061 {
label values `x' estru_1
}


** Recodificando e rotulando as informações sobre o grau de escolaridade do
// diretor  
recode TX_DIR_Q004 (5=0) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (6=5) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (0=6) if ID_PROVA_BRASIL<=2009
recode TX_DIR_Q004 (2=1) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (3=1) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (4=2) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (5=3) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (6=0) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (7=4) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (8=5) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (9=6) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (10=7) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (0=7) if ID_PROVA_BRASIL==2011
recode TX_DIR_Q004 (7=6) if ID_PROVA_BRASIL>=2013
recode TX_DIR_Q004 (8=6) if ID_PROVA_BRASIL>=2013
recode TX_DIR_Q004 (9=7) if ID_PROVA_BRASIL>=2013

label define escol_2 1 "Menos que o Ensino Médio (antigo 2º grau)" 2 "Ensino Médio - Magistério (antigo 2º grau)" 3 "Ensino  Médio - Outros (antigo 2º grau)" 4 "Ensino Superior - Pedagogia" 5 "Ensino Superior - Curso Normal Superior" 6 "Ensino Superior - Outras Licenciaturas" 7 "Ensino Superior - Outros"
label values TX_DIR_Q004 escol_2


** Recodificando e rotulando as variáveis de salário do diretor: passamos as 
// informações para a grandeza de "salários minímos" e ajustamos o ano de 2007  
recode TX_DIR_Q010 (9=8) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (10=9) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (11=9) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (12=10) if ID_PROVA_BRASIL==2007
recode TX_DIR_Q010 (13=11) if ID_PROVA_BRASIL==2007

label define remun_1 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_DIR_Q010 remun_1


** Recodificando, rotulando, colocando em ordem crescente e criando um
// indicador através das variáveis de experiência do diretor 
foreach x of var TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 {
recode `x' (2=1) if ID_PROVA_BRASIL>=2011
recode `x' (3=2) if ID_PROVA_BRASIL>=2011
recode `x' (4=3) if ID_PROVA_BRASIL>=2011
recode `x' (5=3) if ID_PROVA_BRASIL==2011
recode `x' (5=4) if ID_PROVA_BRASIL>=2013
recode `x' (6=4) if ID_PROVA_BRASIL==2011
recode `x' (6=5) if ID_PROVA_BRASIL>=2013
recode `x' (7=5) if ID_PROVA_BRASIL>=2011
recode `x' (8=5) if ID_PROVA_BRASIL>=2011
}

label define exper_1 1 "Há menos de 2 anos" 2 "De 2 a 4 anos" 3 "De 5 a 10 anos" 4 "De 11 a 15 anos" 5 "Há mais de 15 anos"

foreach x of var TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 {
label values `x' exper_1
}


** Recodificando e rotulando as informações sobre a realização de atividades
// para o desenvolvimento profissional de diretores 
recode TX_DIR_Q019 (1=0)
recode TX_DIR_Q019 (2=1)
recode TX_DIR_Q019 (0=2)

label define trein_1 1 "Não" 2 "Sim" 
label values TX_DIR_Q019 trein_1


** Rotulando em ordem crescente as informações sobre a presença de professores
// estáveis na escola 
label define estab_1 1 "Menor ou igual a 25%" 2 "De 26% a 50%" 3 "De 51% a 75%" 4 "De 76% a 90%" 5 "De 91% a 100%" 
label values TX_DIR_Q028 estab_1


** Recodificando, rotulando, colocanco em ordem crescente e criando um 
// indicador através das variáveis de problemas no funcionamento da escola 
foreach x of var TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 ///
TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 {
recode `x' (3=2) if ID_PROVA_BRASIL>=2013
recode `x' (4=3) if ID_PROVA_BRASIL>=2013
}

label define funci_1 1 "Não" 2 "Sim, moderado" 3 "Sim, grave"

foreach x of var TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 ///
TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 {
label values `x' funci_1
}


** Recodificando, rotulando, colocanco em ordem crescente e criando um 
// indicador através das variáveis de apoio ao diretor
foreach x of var TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 {
recode `x' (1=0)
recode `x' (2=1)
recode `x' (0=2)
}

label define apoio_2 1 "Não" 2 "Sim"

foreach x of var TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 {
label values `x' apoio_2
}


** Recodificando e rotulando as informações de escolaridade do professor: 
// somou-se as categorias com "outros" e passou-se "cur" para antes de "outros"
recode TX_PRO_Q004 (9=8) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (5=0) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (6=5) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (7=6) if ID_PROVA_BRASIL>=2013
recode TX_PRO_Q004 (0=7) if ID_PROVA_BRASIL>=2013

label define escol_3 1 "Menos que o Ensino Médio (antigo 2º grau)" 2 "Ensino Médio - Magistério (antigo 2º grau)" 3 "Ensino  Médio - Outros (antigo 2º grau)" 4 "Ensino Superior - Pedagogia" 5 "Ensino Superior - Curso Normal Superior" 6 "Ensino Superior - Licenciatura em Matemática" 7 "Ensino Superior - Licenciatura em Letras" 8 "Ensino Superior – Outras Licenciaturas ou Áreas"
label values TX_PRO_Q004 escol_3


** Recodificando e rotulando as variáveis de salário do professor: passamos as 
// informações para a grandeza de "salários minímos" e ajustamos o ano de 2007  
recode TX_PRO_Q010 (9=8) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (10=9) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (11=9) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (12=10) if ID_PROVA_BRASIL==2007
recode TX_PRO_Q010 (13=11) if ID_PROVA_BRASIL==2007

label define remun_2 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_PRO_Q010 remun_2


** Recodificando, rotulando, colocando em ordem crescente e criando um 
// indicador de experiência do professor  
foreach x of var TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 {
recode `x' (5=4) if ID_PROVA_BRASIL==2011
recode `x' (6=5) if ID_PROVA_BRASIL==2011
recode `x' (7=6) if ID_PROVA_BRASIL==2011
recode `x' (8=7) if ID_PROVA_BRASIL==2011
}

label define exper_2 1 "Meu primeiro ano" 2 "1-2 anos" 3 "3-5 anos" 4 "6-10 anos" 5 "11-15 anos" 6 "15-20 anos" 7 "Há mais de 20 anos"

foreach x of var TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 {
label values `x' exper_2
}


** Recodificando e rotulando as informações sobre a realização de atividades
// para o desenvolvimento profissional de professores 
foreach x of var TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 {
recode `x' (3=2)
recode `x' (4=2)
recode `x' (5=2)
}

label define trein_2a 1 "Não" 2 "Sim"

foreach x of var TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 {
label values `x' trein_2a
}

recode TX_PRO_Q011 (1=0)
recode TX_PRO_Q011 (2=1)
recode TX_PRO_Q011 (0=2)
replace TX_PRO_Q011=1 if TX_PRO_Q021==1 & TX_PRO_Q022==1 & TX_PRO_Q023==1 & TX_PRO_Q024==1
replace TX_PRO_Q011=2 if TX_PRO_Q021==2|TX_PRO_Q022==2|TX_PRO_Q023==2|TX_PRO_Q024==2

label define trein_2b 1 "Não" 2 "Sim"
label values TX_PRO_Q011 trein_2b


** Recodificando e rotulando para que as variáveis de Atividades na Internet e
// Trabalho fora de casa para que fiquem em ordem crescente
recode TX_PRO_Q040 (1=0) if ID_PROVA_BRASIL==2011
recode TX_PRO_Q040 (3=1) if ID_PROVA_BRASIL==2011
recode TX_PRO_Q040 (0=3) if ID_PROVA_BRASIL==2011

label define inter_2 1 "Nunca ou quase nunca" 2 "De vez em quando" 3 "Sempre ou quase sempre"
label values TX_PRO_Q040 inter_2


** Recodificando, rotulando e colocando em ordem crescente as informações sobre 
// a utilização do computador e da internet como ferramenta pedagógica
foreach x of var TX_PRO_Q049 TX_PRO_Q050 {
recode `x' (4=3) if ID_PROVA_BRASIL>=2013
recode `x' (3=0) if ID_PROVA_BRASIL<=2011
recode `x' (1=3) if ID_PROVA_BRASIL<=2011
recode `x' (0=1) if ID_PROVA_BRASIL<=2011
}

label define tics_2 1 "Não, porque não tem" 2 "Não, sem necessidade" 3 "Sim" 

foreach x of var TX_PRO_Q049 TX_PRO_Q050 {
label values `x' tics_2
}


drop _merge1 _merge2 _merge3 APP_2015 APP_2013 APP_2011 ///
APP_2009 APP_2007 

compress

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_9EF_AJUSTADA", replace

clear






================================================================================
################################################################################
================================================================================

*###############################################################################
********************************************************************************
**********************         MERGE COM A CIDIG2       ************************



********************************************************************************
*******************         COMBINANDO - 5º e 9º ANO       *********************


foreach i in 5 9 {
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`i'EF_AJUSTADA", replace

rename ID_MUNICIPIO id_municipio

merge m:m id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_Cidig2.dta"

rename id_municipio ID_MUNICIPIO

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`i'EF_COMBINADA", replace



********************************************************************************
*******************        RECORTANDO - 5º e 9º ANO        *********************

keep if apta_plt!=.

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`i'EF_cidig", replace

clear



********************************************************************************
**************       COMBINANDO COM A PBLE - 5º E 9º ANO       *****************

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`i'EF_cidig.dta"

rename _merge _merge1
rename id_uf uf
rename (ID_UF ID_MUNICIPIO ID_ESCOLA) (id_uf id_municipio id_escola)

merge m:m id_uf id_municipio id_escola using "C:\Users\rlfra\Desktop\pble.dta", generate(_merge2)

rename (id_uf id_municipio id_escola) (ID_UF ID_MUNICIPIO ID_ESCOLA)
rename uf id_uf

gen pble=., before(_merge2)
recode pble (.=1) if data_ativ<17653 & ID_PROVA_BRASIL==2007 & data_ativ!=.
recode pble (.=0) if data_ativ>=17653 & ID_PROVA_BRASIL==2007 & data_ativ!=.

recode pble (.=1) if data_ativ<18189 & ID_PROVA_BRASIL==2009 & data_ativ!=.
recode pble (.=0) if data_ativ>=18189 & ID_PROVA_BRASIL==2009 & data_ativ!=.

recode pble (.=1) if data_ativ<18938 & ID_PROVA_BRASIL==2011 & data_ativ!=.
recode pble (.=0) if data_ativ>=18938 & ID_PROVA_BRASIL==2011 & data_ativ!=.

recode pble (.=1) if data_ativ<19675 & ID_PROVA_BRASIL==2013 & data_ativ!=.
recode pble (.=0) if data_ativ>=19675 & ID_PROVA_BRASIL==2013 & data_ativ!=.

recode pble (.=1) if data_ativ<20403 & ID_PROVA_BRASIL==2015 & data_ativ!=.
recode pble (.=0) if data_ativ>=20403 & ID_PROVA_BRASIL==2015 & data_ativ!=.

recode pble (.=1) if data_ativ<21115 & ID_PROVA_BRASIL==2017 & data_ativ!=.
recode pble (.=0) if data_ativ>=21115 & ID_PROVA_BRASIL==2017 & data_ativ!=.


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_`i'EF_cidig&pble.dta", replace
}






================================================================================
################################################################################
================================================================================

*###############################################################################
********************************************************************************
**********************       VARIÁVEIS DE CONTROLE      ************************


*** ajustes de dir
* passar TX_DIR_Q010 para salários minímios 
recode TX_DIR_Q010 (9=8) if ano==2007
recode TX_DIR_Q010 (10=9) if ano==2007
recode TX_DIR_Q010 (11=9) if ano==2007
recode TX_DIR_Q010 (12=10) if ano==2007
recode TX_DIR_Q010 (13=11) if ano==2007

label define remun1 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_DIR_Q010 remun1


* rearrenjar TX_DIR_Q016 para intervelos maiores 
- 2017, 2015 e 2013
1 "Menos de um ano"
2 "1-2 anos"
3 "3-5 anos"
4 "6-10 anos"
5 "11-15 anos"
6 "16-20 anos"
7 "Mais de 20 anos"

- 2011
1 "Há menos de um ano"
2 "De 1 a 2 anos"	
3 "De 2 a 5 anos"	
4 "De 5 a 7 anos"	
5 "De 7 a 10 anos"	
6 "De 10 a 15 anos"
7 "De 15 a 20 anos"	
8 "Há mais de 20 anos"	

- 2009 e 2007
1 "Há menos de 2 anos"
2 "De 2 a 4 anos"
3 "De 5 a 10 anos"
4 "De 11 a 15 anos"
5 "Há mais de 15 anos" 


* apenas mudar as categorias de TX_DIR_Q067
recode TX_DIR_Q067 (3=2) if ano==2013|ano==2015|ano==2017
recode TX_DIR_Q067 (4=3) if ano==2013|ano==2015|ano==2017

recode TX_DIR_Q072 (3=2) if ano==2013|ano==2015|ano==2017
recode TX_DIR_Q072 (4=3) if ano==2013|ano==2015|ano==2017

label define prob1 1 "Não"	2 "Pouco ou Moderado" 3 "Muito"
label values TX_DIR_Q067 prob1
label values TX_DIR_Q072 prob1

rename TX_DIR_Q010 remun_dir
rename TX_DIR_Q016 exper_dir
rename TX_DIR_Q067 probl_rec
rename TX_DIR_Q072 probl_par


*** ajustes de pro
*TX_PRO_Q002 está OK!


* passar TX_PRO_Q010 para salários minímios 
label define remun2 1 "até 1 SM" 2 "de 1 a 1,5 SM" 3 "de 1,5 a 2 SM" ///
4 "de 2 a 2,5 SM" 5 "de 2,5 a 3 SM" 6 "de 3 a 3,5 SM" 7 "de 3,5 a 4 SM" ///
8 "de 4 a 5 SM" 9 "de 5 a 7 SM" 10 "de 7 a 10 SM" 11 "acima de 10 SM"
label values TX_PRO_Q010 remun2


*** REORGANIZAR OU NÃO?? ***
1 "até 1 SM"
2 "de 1 a 1,5 SM"
3 "de 1,5 a 2 SM"
4 "de 2 a 2,5 SM"
5 "de 2,5 a 3 SM"
6 "de 3 a 3,5 SM"
7 "de 3,5 a 4 SM"
8 "de 4 a 5 SM"
9 "de 5 a 7 SM"
10 "de 7 a 10 SM"
11 "acima de 10 SM"


* rearrenjar TX_PRO_Q013 para intervelos maiores 
2017, 2015 e 2013
1 "Menos de um ano"
2 "1-2 anos"
3 "3-5 anos"
4 "6-10 anos"
5 "11-15 anos"
6 "16-20 anos"
7 "Mais de 20 anos"

2011
1 "Há menos de um ano"
2 "De 1 a 2 anos"	
3 "De 2 a 5 anos"	
4 "De 5 a 7 anos"	
5 "De 7 a 10 anos"	
6 "De 10 a 15 anos"
7 "De 15 a 20 anos"	
8 "Há mais de 20 anos"	

2009 e 2007
1 "Há menos de 2 anos"
2 "De 2 a 4 anos"
3 "De 5 a 10 anos"
4 "De 11 a 15 anos"
5 "Há mais de 15 anos" 


* inverter o "nunca" com o "sempre" em TX_PRO_Q049
replace TX_PRO_Q049=3 if TX_PRO_Q049==4 & ano==2013|TX_PRO_Q049==4 & ano==2015|TX_PRO_Q049==4 & ano==2017
recode TX_PRO_Q049 (3=0) if ano==2007|ano==2009|ano==2011
recode TX_PRO_Q049 (1=3) if ano==2007|ano==2009|ano==2011
recode TX_PRO_Q049 (0=1) if ano==2007|ano==2009|ano==2011


* TX_PRO_Q049 TX_PRO_Q050 deverão ser ajustados da mesma forma, em relação ao 
// anos inciais
replace TX_PRO_Q050=3 if TX_PRO_Q050==4 & ano==2013|TX_PRO_Q050==4 & ano==2015|TX_PRO_Q050==4 & ano==2017
recode TX_PRO_Q050 (3=0) if ano==2007|ano==2009|ano==2011
recode TX_PRO_Q050 (1=3) if ano==2007|ano==2009|ano==2011
recode TX_PRO_Q050 (0=1) if ano==2007|ano==2009|ano==2011


** Criando a variável de Status Socioeconômico com base nos Critérios da ABEP
// de 2008, pelo Critério de Classificação Econômica do Brasil de 2014
gen pont_tv=0 
recode pont_tv (0=1) if TX_RESP_Q005==1 & ID_PROVA_BRASIL<=2011
recode pont_tv (0=1) if TX_RESP_Q005==2 & ID_PROVA_BRASIL>=2013
recode pont_tv (0=2) if TX_RESP_Q005==2 & ID_PROVA_BRASIL<=2011
recode pont_tv (0=2) if TX_RESP_Q005==3 & ID_PROVA_BRASIL>=2013
recode pont_tv (0=3) if TX_RESP_Q005==3 & ID_PROVA_BRASIL<=2011
recode pont_tv (0=3) if TX_RESP_Q005==4 & ID_PROVA_BRASIL>=2013
recode pont_tv (0=4) if TX_RESP_Q005==5 

gen pont_rd=0 
recode pont_rd (0=1) if TX_RESP_Q006==1 & ID_PROVA_BRASIL<=2011
recode pont_rd (0=1) if TX_RESP_Q006==2 & ID_PROVA_BRASIL>=2013
recode pont_rd (0=2) if TX_RESP_Q006==2 & ID_PROVA_BRASIL<=2011
recode pont_rd (0=2) if TX_RESP_Q006==3 & ID_PROVA_BRASIL>=2013
recode pont_rd (0=3) if TX_RESP_Q006==3 & ID_PROVA_BRASIL<=2011
recode pont_rd (0=3) if TX_RESP_Q006==4 & ID_PROVA_BRASIL>=2013
recode pont_rd (0=4) if TX_RESP_Q006==5 

gen pont_vc=0
recode pont_vc (0=2) if TX_RESP_Q007==1 & ID_PROVA_BRASIL<=2011
recode pont_vc (0=2) if TX_RESP_Q007==2 & ID_PROVA_BRASIL>=2013
recode pont_vc (0=2) if TX_RESP_Q007==3
recode pont_vc (0=2) if TX_RESP_Q007==4
recode pont_vc (0=2) if TX_RESP_Q007==5

gen pont_gl=0
recode pont_gl (0=4) if TX_RESP_Q008==1 & ID_PROVA_BRASIL<=2011
recode pont_gl (0=4) if TX_RESP_Q008==2 
recode pont_gl (0=4) if TX_RESP_Q008==3 & ID_PROVA_BRASIL>=2013
recode pont_gl (0=4) if TX_RESP_Q008==4
recode pont_gl (0=4) if TX_RESP_Q008==5

gen pont_fr=0
recode pont_fr (0=2) if TX_RESP_Q009==1 & ID_PROVA_BRASIL<=2011|TX_RESP_Q010==1 & ID_PROVA_BRASIL<=2011
recode pont_fr (0=2) if TX_RESP_Q009==2 & ID_PROVA_BRASIL>=2013|TX_RESP_Q010==2 & ID_PROVA_BRASIL>=2013
recode pont_fr (0=2) if TX_RESP_Q009==3 & ID_PROVA_BRASIL>=2013|TX_RESP_Q010==3 & ID_PROVA_BRASIL>=2013
recode pont_fr (0=2) if TX_RESP_Q009==4
recode pont_fr (0=2) if TX_RESP_Q009==5

gen pont_ml=0
recode pont_ml (0=2) if TX_RESP_Q011==1 & ID_PROVA_BRASIL<=2011
recode pont_ml (0=2) if TX_RESP_Q011==2 & ID_PROVA_BRASIL>=2013
recode pont_ml (0=2) if TX_RESP_Q011==3
recode pont_ml (0=2) if TX_RESP_Q011==4
recode pont_ml (0=2) if TX_RESP_Q011==5

gen pont_cr=0
recode pont_cr (0=4) if TX_RESP_Q012==1 & ID_PROVA_BRASIL<=2011
recode pont_cr (0=4) if TX_RESP_Q012==2 & ID_PROVA_BRASIL>=2013
recode pont_cr (0=7) if TX_RESP_Q012==2 & ID_PROVA_BRASIL<=2011
recode pont_cr (0=7) if TX_RESP_Q012==3 & ID_PROVA_BRASIL>=2013
recode pont_cr (0=9) if TX_RESP_Q012==3 & ID_PROVA_BRASIL<=2011
recode pont_cr (0=9) if TX_RESP_Q012==4 & ID_PROVA_BRASIL>=2013
recode pont_cr (0=9) if TX_RESP_Q012==5


**############################################################################**

** Recodificando e rotulando as informações sobre a posse do computador caseiro
recode TX_RESP_Q013 (3=0) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (1=2) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (0=1) if ID_PROVA_BRASIL<=2011
recode TX_RESP_Q013 (3=2) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (4=2) if ID_PROVA_BRASIL>=2013
recode TX_RESP_Q013 (5=2) if ID_PROVA_BRASIL>=2013

label define comp_1 1 "Não tem" 2 "Tem" 
label values TX_RESP_Q013 comp_1 

**############################################################################**


gen pont_wc=0
recode pont_wc (0=4) if TX_RESP_Q014==1 & ID_PROVA_BRASIL<=2011
recode pont_wc (0=4) if TX_RESP_Q014==2 & ID_PROVA_BRASIL>=2013
recode pont_wc (0=5) if TX_RESP_Q014==2 & ID_PROVA_BRASIL<=2011
recode pont_wc (0=5) if TX_RESP_Q014==3 & ID_PROVA_BRASIL>=2013
recode pont_wc (0=6) if TX_RESP_Q014==3 & ID_PROVA_BRASIL<=2011
recode pont_wc (0=6) if TX_RESP_Q014==4 & ID_PROVA_BRASIL>=2013
recode pont_wc (0=7) if TX_RESP_Q014==4 & ID_PROVA_BRASIL<=2011
recode pont_wc (0=7) if TX_RESP_Q014==5 & ID_PROVA_BRASIL>=2013

gen pont_ed=0
recode pont_ed (0=3) if TX_RESP_Q017==1 & ID_PROVA_BRASIL<=2011
recode pont_ed (0=3) if TX_RESP_Q017==2 & ID_PROVA_BRASIL>=2013
recode pont_ed (0=4) if TX_RESP_Q017==2 & ID_PROVA_BRASIL<=2011
recode pont_ed (0=4) if TX_RESP_Q017==3 
recode pont_ed (0=4) if TX_RESP_Q017==4 & ID_PROVA_BRASIL>=2013
recode pont_ed (0=4) if TX_RESP_Q017==5


**############################################################################**

** Recodificando e rotulando as escolaridades de mãe e pai dos alunos
foreach x of var TX_RESP_Q019 TX_RESP_Q023 {
recode `x' (2=1) if ID_PROVA_BRASIL>=2011
recode `x' (3=2) if ID_PROVA_BRASIL>=2011
recode `x' (4=3) if ID_PROVA_BRASIL>=2011
recode `x' (5=4) if ID_PROVA_BRASIL>=2011
recode `x' (6=5) if ID_PROVA_BRASIL>=2011
recode `x' (7=6) if ID_PROVA_BRASIL>=2011
}

label define escol_1 1 "Nunca estudou ou Não completou a 4.ª série" 2 "Completou a 4.ª série, mas não completou a 8.ª série" 3 "Completou a 8.ª série, mas não completou o Ensino Médio" 4 "Completou o Ensino Médio, mas não completou a Faculdade" 5 "Completou a Faculdade" 6 "Não sei"

foreach x of var TX_RESP_Q019 TX_RESP_Q023 {
label values `x' escol_1
}

gen pont_gr1=0
recode pont_gr1 (0=1) if TX_RESP_Q019==2
recode pont_gr1 (0=2) if TX_RESP_Q019==3
recode pont_gr1 (0=4) if TX_RESP_Q019==4
recode pont_gr1 (0=8) if TX_RESP_Q019==5

gen pont_gr2=0
recode pont_gr2 (0=1) if TX_RESP_Q023==2
recode pont_gr2 (0=2) if TX_RESP_Q023==3
recode pont_gr2 (0=4) if TX_RESP_Q023==4
recode pont_gr2 (0=8) if TX_RESP_Q023==5

**############################################################################**


gen pont_gr=(pont_gr1+pont_gr2)/2

gen pont_class=pont_tv+pont_rd+pont_wc+pont_cr+pont_ed+pont_ml+pont_vc+pont_gl+pont_fr+pont_gr

gen classes2008=0

recode classes2008 (0=6) if pont_class>=35 & pont_class!=.
recode classes2008 (0=5) if pont_class<35 & pont_class>=29
recode classes2008 (0=4) if pont_class<29 & pont_class>=23
recode classes2008 (0=3) if pont_class<23 & pont_class>=18
recode classes2008 (0=2) if pont_class<18 & pont_class>=14
recode classes2008 (0=1) if pont_class<14 
replace classes2008=. if pont_class==0

label define class_1 6 "A" 5 "B1" 4 "B2" 3 "C1" 2 "C2" 1 "DE"
label values classes2008 class_1

