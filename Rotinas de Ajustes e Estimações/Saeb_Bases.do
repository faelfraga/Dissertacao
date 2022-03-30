*************#####################################################**************
*************###############                       ###############**************
*************###############   PROVA BRASIL/SAEB   ###############**************
*************###############                       ###############**************
*************#####################################################**************


*INTRO) O SEGUINTE ARQUIVO BUSCA AJUSTAR ANO A ANO AS BASES DE DADOS DO SISTEMA 
//DE AVALIAÇÃO DO ESINO BÁSICO BRASILEIRO. SÃO REALZADAS ALGUMAS RECODIFICAÇÕES 
// E, NO FIM, EMPILHAMOS OS DADOS PARA QUE SEJA REALIZADA UMA ANALISE DESCRITIVA 
// EM COMBINAÇÃO COM AS INFORMAÇÕES DO PROGRAMA CIDADES DIGITAIS. 

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2017     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ALUNO_5EF_2017"

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP ERRO_PADRAO_LP PROFICIENCIA_LP_SAEB ERRO_PADRAO_LP_SAEB PROFICIENCIA_MT ERRO_PADRAO_MT PROFICIENCIA_MT_SAEB ERRO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q051
	 
** Em 2017 a variável de dispersão vem nomeada como ERRO PADRÃO, de 2015 em 
// diante a nomeação é de DESVIO PADRÃO. Em definição, há diferença! Aqui também
// existe alguma distinção? OLHAR O RELATÓRIO METODOLÓGICO!!! SE=SD/raiz(n)
rename ERRO_PADRAO_LP DESVIO_PADRAO_LP
rename ERRO_PADRAO_MT DESVIO_PADRAO_MT
rename ERRO_PADRAO_LP_SAEB DESVIO_PADRAO_LP_SAEB
rename ERRO_PADRAO_MT_SAEB DESVIO_PADRAO_MT_SAEB
* ou vice e versa dependendo do ano padrão


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q036 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2017", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ALUNO_9EF_2017"

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP ERRO_PADRAO_LP PROFICIENCIA_LP_SAEB ERRO_PADRAO_LP_SAEB PROFICIENCIA_MT ERRO_PADRAO_MT PROFICIENCIA_MT_SAEB ERRO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057

** Em 2017 a variável de dispersão vem nomeada como ERRO PADRÃO, de 2015 em 
// diante a nomeação é de DESVIO PADRÃO. Em definição, há diferença! Aqui também
// existe alguma distinção? OLHAR O RELATÓRIO METODOLÓGICO!!!
rename ERRO_PADRAO_LP DESVIO_PADRAO_LP
rename ERRO_PADRAO_MT DESVIO_PADRAO_MT
rename ERRO_PADRAO_LP_SAEB DESVIO_PADRAO_LP_SAEB
rename ERRO_PADRAO_MT_SAEB DESVIO_PADRAO_MT_SAEB
* ou vice e versa dependendo do ano padrão

** As infirmações disponibilizadas pelo ECONS apresentavam alguns equívocos. 
// Devido a isso, foi necessária a realização de uma nova rotulação de todas as 
// variáveis listadas abaixo

label define q001 1 "Masculino" 2 "Feminino"
label define q002 1 "Branca" 2 "Preta" 3 "Parda" 4 "Amarelo" 5 "Indígena" 6 "Não quero declarar"
label define q003 1 "Janeiro" 2 "Fevereiro" 3 "Março" 4 "Abril" 5 "Maio" 6 "Junho" 7 "Julho" 8 "Agosto" 9 "Setembro" 10 "Outubro" 11 "Novembro" 12 "Dezembro"
label define q004 1 "2005 ou depois" 2 "2004" 3	"2003" 4 "2002"	5 "2001" 6 "2000" 7 "1999" 8 "1998 ou antes"

foreach i in 05 06 07 08 09 10 11 12 13 14 15 {
label define q0`i' 1 "Não tem" 2 "Sim, um" 3	"Sim, dois" 4 "Sim, três" 5 "Sim, quatro ou mais"
} 

label define q016 1 "Uma, pois moro sozinho(a)" 2 "Duas" 3 "Três" 4 "Quatro" 5 "Cinco" 6 "Seis pessoas ou mais"
label define q017 1 "Não tem" 2 "Sim, um" 3 "Sim, dois" 4 "Sim, três" 5 "Sim, quatro ou mais"
label define q018 1 "Sim" 2 "Não" 3 "Não, mas moro com outra mulher responsável por mim"
label define q019 1 "Nunca estudou" 2 "Não completou a 4.ª série/5.º ano" 3 "Completou a 4.ª série/5.º ano, mas não completou a 8.ª série/9.º ano" 4 "Completou a 8.ª série/9.º ano, mas não completou o Ensino Médio" 5 "Completou o Ensino Médio, mas não completou a Faculdade" 6 "Completou a Faculdade" 7 "Não sei"

foreach i in 20 21 24 25 27 28 29 30 31 45 50 53 {
label define q0`i' 1 "Sim" 2 "Não"
}

label define q022 1 "Sim" 2 "Não" 3 "Não, mas moro com outro homem responsável por mim"
label define q023 1 "Nunca estudou" 2 "Não completou a 4.ª série/5.º ano" 3 "Completou a 4.ª série/5.º ano, mas não completou a 8.ª série/9.º ano" 4 "Completou a 8.ª série/9.º ano, mas não completou o Ensino Médio" 5 "Completou o Ensino Médio, mas não completou a Faculdade" 6 "Completou a Faculdade" 7 "Não sei"

foreach i in 26 32 33 34 35 36 37 38 39 40 41 42 {
label define q0`i' 1 "Sempre ou quase sempre" 2 "De vez em quando" 3 "Nunca ou quase nunca"
}

label define q043 1 "Entre 1 e 2 horas" 2 "Mais de 2 horas, até 3 horas" 3 "Mais de 3 horas" 4 "Não vejo TV, não navego na internet e não jogo jogos eletrônicos"
label define q044 1 "Entre 1 e 2 horas"	2 "Mais de 2 horas, até 3 horas" 3 "Mais de 3 horas" 4 "Não faço trabalhos domésticos"
label define q046 1 "Na creche (0 a 3 anos)" 2 "Na pré-escola (4 a 5 anos)" 3 "Na primeira série ou primeiro ano (6 a 7 anos)"
label define q047 1 "Somente em escola pública" 2 "Somente em escola particular" 3 "Em escola pública e em escola particular"

foreach i in 48 49 {
label define q0`i' 1 "Não" 2 "Sim, uma vez" 3 "Sim, duas vezes ou mais"
}

foreach i in 51 52 54 55 {
label define q0`i' 1 "Sempre ou quase sempre" 2 "De vez em quando" 3 "Nunca ou quase nunca" 4 "O(A) professor(a) não passa dever de casa"
}

label define q056 1 "Sempre ou quase sempre" 2 "De vez em quando" 3 "Nunca ou quase nunca" 4 "A escola não possui biblioteca ou sala de leitura.
label define q057 1 "Somente continuar estudando" 2 "Somente trabalhar" 3 "Continuar estudando e trabalhar" 4 "Ainda não sei"

forvalues i = 1/9 {
label values TX_RESP_Q00`i' q00`i'
}

forvalues i = 10/57 {
label values TX_RESP_Q0`i' q0`i'
}

// mudar os labels também!
label variable  TX_RESP_Q001 "Qual é o seu sexo?"
label variable  TX_RESP_Q002 "Qual é a sua cor ou raça?"
label variable  TX_RESP_Q003 "Você poderia nos dizer qual é o mês de seu aniversário?"
label variable  TX_RESP_Q004 "Em que ano você nasceu?"
label variable  TX_RESP_Q005 "Na sua casa tem televisão em cores?"
label variable  TX_RESP_Q006 "Na sua casa tem rádio?"
label variable  TX_RESP_Q007 "Na sua casa tem videocassete e/ou DVD?"
label variable  TX_RESP_Q008 "Na sua casa tem geladeira?"
label variable  TX_RESP_Q009 "Na sua casa tem freezer (parte da geladeira duplex)?"
label variable  TX_RESP_Q010 "Na sua casa tem freezer separado da geladeira?"
label variable  TX_RESP_Q011 "Na sua casa tem máquina de lavar roupa (O tanquinho NÃO deve ser considerado)?"
label variable  TX_RESP_Q012 "Na sua casa tem carro?"
label variable  TX_RESP_Q013 "Na sua casa tem computador?"
label variable  TX_RESP_Q014 "Na sua casa tem banheiro?"
label variable  TX_RESP_Q015 "Na sua casa tem quartos para dormir?"
label variable  TX_RESP_Q016 "Incluindo você, quantas pessoas vivem atualmente em sua casa?"
label variable  TX_RESP_Q017 "Em sua casa trabalha empregado(a) doméstico(a) pelo menos cinco dias por semana?"
label variable  TX_RESP_Q018 "Você mora com sua mãe?"
label variable  TX_RESP_Q019 "Até que série sua mãe, ou a mulher responsável por você, estudou?"
label variable  TX_RESP_Q020 "Sua mãe, ou a mulher responsável por você, sabe ler e escrever?"
label variable  TX_RESP_Q021 "Você vê sua mãe, ou mulher responsável por você, lendo?"
label variable  TX_RESP_Q022 "Você mora com seu pai?"
label variable  TX_RESP_Q023 "Até que série seu pai, ou o homem responsável por você, estudou?"
label variable  TX_RESP_Q024 "Seu pai, ou homem responsável por você, sabe ler e escrever?"
label variable  TX_RESP_Q025 "Você vê o seu pai, ou homem responsável por você, lendo?"
label variable  TX_RESP_Q026 "Com qual frequência seus pais, ou responsáveis por você, vão à reunião de pais?"
label variable  TX_RESP_Q027 "Seus pais ou responsáveis incentivam você a estudar?"
label variable  TX_RESP_Q028 "Seus pais ou responsáveis incentivam você a fazer o dever de casa e/ou os trabalhos da escola?"
label variable  TX_RESP_Q029 "Seus pais ou responsáveis incentivam você a ler?"
label variable  TX_RESP_Q030 "Seus pais ou responsáveis incentivam você a ir a escola e/ou não faltar às aulas?"
label variable  TX_RESP_Q031 "Seus pais ou responsáveis conversam com você sobre o que acontece na escola?"
label variable  TX_RESP_Q032 "Com qual frequência você lê: Jornais."
label variable  TX_RESP_Q033 "Com qual frequência você lê: Livros em geral."
label variable  TX_RESP_Q034 "Com qual frequência você lê: Livros de literatura."
label variable  TX_RESP_Q035 "Com qual frequência você lê: Revistas em geral."
label variable  TX_RESP_Q036 "Com qual frequência você lê: Revistas em quadrinhos (gibis)."
label variable  TX_RESP_Q037 "Com qual frequência você lê: Revistas de comportamento, celebridades, esportes ou TV."
label variable  TX_RESP_Q038 "Com qual frequência você lê: Notícias na internet (ex.: blog, notícia)."
label variable  TX_RESP_Q039 "Com qual frequência você costuma ir à biblioteca?"
label variable  TX_RESP_Q040 "Com qual frequência você costuma ir ao cinema?"
label variable  TX_RESP_Q041 "Com qual frequência você costuma ir a algum tipo de espetáculo ou exposição (teatro, museu, dança, música)?"
label variable  TX_RESP_Q042 "Com qual frequência você participa de festas na sua vizinhaça ou comunidade?"
label variable  TX_RESP_Q043 "Em dia de aula, quanto tempo você gasta assistindo à TV, navegando na internet ou jogando jogos eletrônicos?"
label variable  TX_RESP_Q044 "Em dias de aula, quanto tempo você gasta fazendo trabalhos domésticos (ex.: lavando louça, limpando o quintal etc.)?"
label variable  TX_RESP_Q045 "Atualmente você trabalha fora de casa (recebendo ou não um salário)?"
label variable  TX_RESP_Q046 "Quando você entrou na escola?"
label variable  TX_RESP_Q047 "A partir da quinta série ou sexto ano, em que tipo de escola você estudou?"
label variable  TX_RESP_Q048 "Você já foi reprovado?"
label variable  TX_RESP_Q049 "Você já abandonou a escola durante o período de aulas e ficou fora da escola o resto do ano?"
label variable  TX_RESP_Q050 "Você gosta de estudar Língua Portuguesa?"
label variable  TX_RESP_Q051 "Você faz o dever de casa de Língua Portuguesa?"
label variable  TX_RESP_Q052 "O(A) professor(a) corrige o dever de casa de Língua Portuguesa?"
label variable  TX_RESP_Q053 "Você gosta de estudar Matemática?"
label variable  TX_RESP_Q054 "Você faz o dever de casa de Matemática?"
label variable  TX_RESP_Q055 "O(A) professor(a) corrige o dever de casa de Matemática?"
label variable  TX_RESP_Q056 "Você utiliza a biblioteca ou sala de leitura da sua escola?"
label variable  TX_RESP_Q057 "Quando você terminar o 9º ano(8ª série) você pretende:"


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q038 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2017", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ESCOLA_2017"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 7/9 {
rename TX_RESP_Q00`i' TX_ESC_Q00`i'
}

forvalues i = 10/74 {
rename TX_RESP_Q0`i' TX_ESC_Q0`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2017", replace

clear


*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_DIRETOR_2017.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename TX_RESP_Q00`i' TX_DIR_Q00`i'
}

forvalues i = 10/99 {
rename TX_RESP_Q0`i' TX_DIR_Q0`i'
}

forvalues i = 100/111 {
rename TX_RESP_Q`i' TX_DIR_Q`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q111


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2017", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_PROFESSOR_2017.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename TX_RESP_Q00`i' TX_PRO_Q00`i'
}

forvalues i = 10/99 {
rename TX_RESP_Q0`i' TX_PRO_Q0`i'
}

forvalues i = 100/125 {
rename TX_RESP_Q`i' TX_PRO_Q`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA CO_PROFESSOR ID_SERIE TX_PRO_Q001-TX_PRO_Q125


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q040 TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2017", replace

clear

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2015     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ALUNO_5EF_2015"

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q051


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q036 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2015", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ALUNO_9EF_2015"

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q038 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2015", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_ESCOLA_2015"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 7/9 {
rename TX_RESP_Q00`i' TX_ESC_Q00`i'
}

forvalues i = 10/74 {
rename TX_RESP_Q0`i' TX_ESC_Q0`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2015", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_DIRETOR_2015.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename TX_RESP_Q00`i' TX_DIR_Q00`i'
}

forvalues i = 10/99 {
rename TX_RESP_Q0`i' TX_DIR_Q0`i'
}

forvalues i = 100/111 {
rename TX_RESP_Q`i' TX_DIR_Q`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q111


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2015", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\saeb_TS_PROFESSOR_2015.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename TX_RESP_Q00`i' TX_PRO_Q00`i'
}

forvalues i = 10/99 {
rename TX_RESP_Q0`i' TX_PRO_Q0`i'
}

forvalues i = 100/125 {
rename TX_RESP_Q`i' TX_PRO_Q`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE TX_PRO_Q001-TX_PRO_Q125


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q040 TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2015", replace

clear

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2013     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\SAEB_Aluno_5¬serieEF_2013"

** O código de identificação de todas as variáveis são passados para a 
// configuração de letra maíuscula. Dos 3 que serão usados como base (2017, 2015
// e 2013), 2 estão desta forma (2017 e 2015)
rename (id_prova_brasil id_regiao id_uf id_municipio id_area id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento_prova id_caderno id_bloco_1 id_bloco_2 tx_resp_bloco_1_lp tx_resp_bloco_2_lp tx_resp_bloco_1_mt tx_resp_bloco_2_mt in_proficiencia in_prova_brasil estrato_aneb peso_aluno_lp peso_aluno_mt proficiencia_lp desvio_padrao_lp proficiencia_lp_saeb desvio_padrao_lp_saeb proficiencia_mt desvio_padrao_mt proficiencia_mt_saeb desvio_padrao_mt_saeb in_preenchimento_questionario tx_resp_q001 tx_resp_q002 tx_resp_q003 tx_resp_q004 tx_resp_q005 tx_resp_q006 tx_resp_q007 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013 tx_resp_q014 tx_resp_q015 tx_resp_q016 tx_resp_q017 tx_resp_q018 tx_resp_q019 tx_resp_q020 tx_resp_q021 tx_resp_q022 tx_resp_q023 tx_resp_q024 tx_resp_q025 tx_resp_q026 tx_resp_q027 tx_resp_q028 tx_resp_q029 tx_resp_q030 tx_resp_q031 tx_resp_q032 tx_resp_q033 tx_resp_q034 tx_resp_q035 tx_resp_q036 tx_resp_q037 tx_resp_q038 tx_resp_q039 tx_resp_q040 tx_resp_q041 tx_resp_q042 tx_resp_q043 tx_resp_q044 tx_resp_q045 tx_resp_q046 tx_resp_q047 tx_resp_q048 tx_resp_q049 tx_resp_q050 tx_resp_q051) (ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PREENCHIMENTO_PROVA ID_CADERNO ID_BLOCO_1 ID_BLOCO_2 TX_RESP_BLOCO_1_LP TX_RESP_BLOCO_2_LP TX_RESP_BLOCO_1_MT TX_RESP_BLOCO_2_MT IN_PROFICIENCIA IN_PROVA_BRASIL ESTRATO_ANEB PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB IN_PREENCHIMENTO_QUESTIONARIO TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q003 TX_RESP_Q004 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q018 TX_RESP_Q019 TX_RESP_Q020 TX_RESP_Q021 TX_RESP_Q022 TX_RESP_Q023 TX_RESP_Q024 TX_RESP_Q025 TX_RESP_Q026 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q032 TX_RESP_Q033 TX_RESP_Q034 TX_RESP_Q035 TX_RESP_Q036 TX_RESP_Q037 TX_RESP_Q038 TX_RESP_Q039 TX_RESP_Q040 TX_RESP_Q041 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q044 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q047 TX_RESP_Q048 TX_RESP_Q049 TX_RESP_Q050 TX_RESP_Q051)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q051


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q036 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2013", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\SAEB_Aluno_9¬serieEF_2013"

** O código de identificação de todas as variáveis são passados para a
// configuração de letra maíuscula. Dos 3 que serão usados como base (2017, 2015
// e 2013), 2 estão desta forma (2017 e 2015)
rename (id_prova_brasil id_regiao id_uf id_municipio id_area id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento_prova id_caderno id_bloco_1 id_bloco_2 tx_resp_bloco_1_lp tx_resp_bloco_2_lp tx_resp_bloco_1_mt tx_resp_bloco_2_mt in_proficiencia in_prova_brasil estrato_aneb peso_aluno_lp peso_aluno_mt proficiencia_lp desvio_padrao_lp proficiencia_lp_saeb desvio_padrao_lp_saeb proficiencia_mt desvio_padrao_mt proficiencia_mt_saeb desvio_padrao_mt_saeb in_preenchimento_questionario tx_resp_q001 tx_resp_q002 tx_resp_q003 tx_resp_q004 tx_resp_q005 tx_resp_q006 tx_resp_q007 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013 tx_resp_q014 tx_resp_q015 tx_resp_q016 tx_resp_q017 tx_resp_q018 tx_resp_q019 tx_resp_q020 tx_resp_q021 tx_resp_q022 tx_resp_q023 tx_resp_q024 tx_resp_q025 tx_resp_q026 tx_resp_q027 tx_resp_q028 tx_resp_q029 tx_resp_q030 tx_resp_q031 tx_resp_q032 tx_resp_q033 tx_resp_q034 tx_resp_q035 tx_resp_q036 tx_resp_q037 tx_resp_q038 tx_resp_q039 tx_resp_q040 tx_resp_q041 tx_resp_q042 tx_resp_q043 tx_resp_q044 tx_resp_q045 tx_resp_q046 tx_resp_q047 tx_resp_q048 tx_resp_q049 tx_resp_q050 tx_resp_q051 tx_resp_q052 tx_resp_q053 tx_resp_q054 tx_resp_q055 tx_resp_q056 tx_resp_q057) (ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PREENCHIMENTO_PROVA ID_CADERNO ID_BLOCO_1 ID_BLOCO_2 TX_RESP_BLOCO_1_LP TX_RESP_BLOCO_2_LP TX_RESP_BLOCO_1_MT TX_RESP_BLOCO_2_MT IN_PROFICIENCIA IN_PROVA_BRASIL ESTRATO_ANEB PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB IN_PREENCHIMENTO_QUESTIONARIO TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q003 TX_RESP_Q004 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q018 TX_RESP_Q019 TX_RESP_Q020 TX_RESP_Q021 TX_RESP_Q022 TX_RESP_Q023 TX_RESP_Q024 TX_RESP_Q025 TX_RESP_Q026 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q032 TX_RESP_Q033 TX_RESP_Q034 TX_RESP_Q035 TX_RESP_Q036 TX_RESP_Q037 TX_RESP_Q038 TX_RESP_Q039 TX_RESP_Q040 TX_RESP_Q041 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q044 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q047 TX_RESP_Q048 TX_RESP_Q049 TX_RESP_Q050 TX_RESP_Q051 TX_RESP_Q052 TX_RESP_Q053 TX_RESP_Q054 TX_RESP_Q055 TX_RESP_Q056 TX_RESP_Q057)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q038 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2013", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\SAEB_Escola_2013"

** O código de identificação de todas as variáveis são passados para a
// configuração de letra maíuscula. Dos 3 que serão usados como base (2017, 2015
// e 2013), 2 estão  desta forma (2017 e 2015)
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao nu_matriculados_censo_5ef nu_presentes_5ef taxa_participacao_5ef nu_matriculados_censo_9ef nu_presentes_9ef taxa_participacao_9ef media_5ef_lp media_5ef_mt media_9ef_lp media_9ef_mt in_preenchimento_questionario tx_resp_q007 tx_resp_q008 tx_resp_q009 tx_resp_q010 tx_resp_q011 tx_resp_q012 tx_resp_q013 tx_resp_q014 tx_resp_q015 tx_resp_q016 tx_resp_q017 tx_resp_q018 tx_resp_q019 tx_resp_q020 tx_resp_q021 tx_resp_q022 tx_resp_q023 tx_resp_q024 tx_resp_q025 tx_resp_q026 tx_resp_q027 tx_resp_q028 tx_resp_q029 tx_resp_q030 tx_resp_q031 tx_resp_q032 tx_resp_q033 tx_resp_q034 tx_resp_q035 tx_resp_q036 tx_resp_q037 tx_resp_q038 tx_resp_q039 tx_resp_q040 tx_resp_q041 tx_resp_q042 tx_resp_q043 tx_resp_q044 tx_resp_q045 tx_resp_q046 tx_resp_q047 tx_resp_q048 tx_resp_q049 tx_resp_q050 tx_resp_q051 tx_resp_q052 tx_resp_q053 tx_resp_q054 tx_resp_q055 tx_resp_q056 tx_resp_q057 tx_resp_q058 tx_resp_q059 tx_resp_q060 tx_resp_q061 tx_resp_q062 tx_resp_q063 tx_resp_q064 tx_resp_q065 tx_resp_q066 tx_resp_q067 tx_resp_q068 tx_resp_q069 tx_resp_q070 tx_resp_q071 tx_resp_q072 tx_resp_q073 tx_resp_q074) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO NU_MATRICULADOS_CENSO_5EF NU_PRESENTES_5EF TAXA_PARTICIPACAO_5EF NU_MATRICULADOS_CENSO_9EF NU_PRESENTES_9EF TAXA_PARTICIPACAO_9EF MEDIA_5EF_LP MEDIA_5EF_MT MEDIA_9EF_LP MEDIA_9EF_MT IN_PREENCHIMENTO_QUESTIONARIO TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q018 TX_RESP_Q019 TX_RESP_Q020 TX_RESP_Q021 TX_RESP_Q022 TX_RESP_Q023 TX_RESP_Q024 TX_RESP_Q025 TX_RESP_Q026 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q032 TX_RESP_Q033 TX_RESP_Q034 TX_RESP_Q035 TX_RESP_Q036 TX_RESP_Q037 TX_RESP_Q038 TX_RESP_Q039 TX_RESP_Q040 TX_RESP_Q041 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q044 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q047 TX_RESP_Q048 TX_RESP_Q049 TX_RESP_Q050 TX_RESP_Q051 TX_RESP_Q052 TX_RESP_Q053 TX_RESP_Q054 TX_RESP_Q055 TX_RESP_Q056 TX_RESP_Q057 TX_RESP_Q058 TX_RESP_Q059 TX_RESP_Q060 TX_RESP_Q061 TX_RESP_Q062 TX_RESP_Q063 TX_RESP_Q064 TX_RESP_Q065 TX_RESP_Q066 TX_RESP_Q067 TX_RESP_Q068 TX_RESP_Q069 TX_RESP_Q070 TX_RESP_Q071 TX_RESP_Q072 TX_RESP_Q073 TX_RESP_Q074)

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 7/9 {
rename TX_RESP_Q00`i' TX_ESC_Q00`i'
}

forvalues i = 10/74 {
rename TX_RESP_Q0`i' TX_ESC_Q0`i'
}

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2013", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\SAEB_Diretor_2013.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename tx_resp_q00`i' TX_DIR_Q00`i'
}

forvalues i = 10/99 {
rename tx_resp_q0`i' TX_DIR_Q0`i'
}

forvalues i = 100/111 {
rename tx_resp_q`i' TX_DIR_Q`i'
}

** Passamos todas as variáveis de identificação, além das selecionadas, para a
// formatação maiúscula e ficamos de acordo com os anos de 2015 e 2017
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q111


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2013", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\SAEB_Professor_2013.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/9 {
rename tx_resp_q00`i' TX_PRO_Q00`i'
}

forvalues i = 10/99 {
rename tx_resp_q0`i' TX_PRO_Q0`i'
}

forvalues i = 100/125 {
rename tx_resp_q`i' TX_PRO_Q`i'
}

** Passamos todas as variáveis de identificação, além das selecionadas, para a
// formatação maiúscula e ficamos de acordo com os anos de 2015 e 2017
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_serie) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE TX_PRO_Q001-TX_PRO_Q125


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q040 TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q021 TX_PRO_Q022 TX_PRO_Q023 TX_PRO_Q024 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2013", replace

clear

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2011     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2011.dta"

** Para o tratamento de dados de 2011 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge 1:1 id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_5ano_2011.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em 
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if id_serie==5

** Após a exclusão das informações sobre o 9º ano, conferimos o marge e 
// excluímos a variável que o indica
tab _merge
drop _merge 

** Renomeamos apenas as variáveis de interesse da análise

foreach i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 {
rename tx_resp_q0`i' TX_RESP_Q0`i'
}

rename tx_resp_q015 TX_RESP_Q017
rename tx_resp_q016 TX_RESP_Q015
rename tx_resp_q017 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 {
rename tx_resp_q0`i' TX_RESP_Q0`i'
}

forvalues i = 35/39 {
local j = `i'-1
rename tx_resp_q0`i' TX_RESP_Q0`j'
}

gen TX_RESP_Q039=., after(TX_RESP_Q038)
// é a soma das questões 40, 41 e 42 a seguir
replace TX_RESP_Q039=1 if tx_resp_q040==1|tx_resp_q041==1|tx_resp_q042==1
replace TX_RESP_Q039=2 if tx_resp_q040==2 & tx_resp_q041!=1 & tx_resp_q042!=1
replace TX_RESP_Q039=2 if tx_resp_q040!=1 & tx_resp_q041==2 & tx_resp_q042!=1
replace TX_RESP_Q039=2 if tx_resp_q040!=1 & tx_resp_q041!=1 & tx_resp_q042==2
replace TX_RESP_Q039=3 if tx_resp_q040==3 & tx_resp_q041==3 & tx_resp_q042==3  

forvalues i = 43/54 {
local j = `i'-3
rename tx_resp_q0`i' TX_RESP_Q0`j'
}

drop tx_resp_q*

** Todas as variáveis tem seus códigos passados para a letra maiúscula devido à 
// compatibilização com os outros anos. Dos 3 que serão usados como base (2017,
// 2015 e 2013), 2 estão desta forma 
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento in_proficiencia peso proficiencia_lp desvio_padrao_lp proficiencia_lp_saeb desvio_padrao_lp_saeb proficiencia_mt desvio_padrao_mt proficiencia_mt_saeb desvio_padrao_mt_saeb) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PREENCHIMENTO IN_PROFICIENCIA PESO PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB)

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor 
// especificar esta informação
gen ID_REGIAO=.
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2011 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** Em 2011 as informações de PESO são trazidas de uma só vez! Nos anos seguintes
// ela fornecida como pesos de LP e MT, mas que possuem o mesmo valor!
gen PESO_ALUNO_LP=.
replace PESO_ALUNO_LP=PESO 

gen PESO_ALUNO_MT=.
replace PESO_ALUNO_MT=PESO 

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q051


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q036 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2011", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2011.dta"

** Para o tratamento de dados de 2011 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge 1:1 id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_9ano_2011.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em 
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if id_serie==9

** Após a exclusão das informações sobre o 9º ano, conferimos o marge e 
// excluímos a variável que o indica
tab _merge
drop _merge 

** Renomeamos apenas as variáveis de interesse da análise

foreach i in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 {
rename tx_resp_q0`i' TX_RESP_Q0`i'
}

rename tx_resp_q015 TX_RESP_Q017
rename tx_resp_q016 TX_RESP_Q015
rename tx_resp_q017 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 ///
39 40 {
rename tx_resp_q0`i' TX_RESP_Q0`i'
}

gen TX_RESP_Q041=., after(TX_RESP_Q040)
// é a soma das questões 41 e 42 a seguir
replace TX_RESP_Q041=1 if tx_resp_q041==1|tx_resp_q042==1
replace TX_RESP_Q041=2 if tx_resp_q041==2 & tx_resp_q042!=1
replace TX_RESP_Q041=2 if tx_resp_q041!=1 & tx_resp_q042==2
replace TX_RESP_Q041=3 if tx_resp_q041==3 & tx_resp_q042==3

forvalues i = 43/58 {
local j = `i'-1
rename tx_resp_q0`i' TX_RESP_Q0`j'
}

drop tx_resp_q*

** Todas as variáveis tem seus códigos passados para a letra maiúscula devido à 
// compatibilização com os outros anos. Dos 3 que serão usados como base (2017,
// 2015 e 2013), 2 estão desta forma 
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_turno id_serie id_aluno in_situacao_censo in_preenchimento in_proficiencia peso proficiencia_lp desvio_padrao_lp proficiencia_lp_saeb desvio_padrao_lp_saeb proficiencia_mt desvio_padrao_mt proficiencia_mt_saeb desvio_padrao_mt_saeb) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PREENCHIMENTO IN_PROFICIENCIA PESO PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB)

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor 
// especificar esta informação
gen ID_REGIAO=0
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2011 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** Em 2011 as informações de PESO são trazidas de uma só vez! Nos anos seguintes
// ela fornecida como pesos de LP e MT, mas que possuem o mesmo valor!
gen PESO_ALUNO_LP=.
replace PESO_ALUNO_LP=PESO 

gen PESO_ALUNO_MT=.
replace PESO_ALUNO_MT=PESO 

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_TURNO ID_SERIE ID_ALUNO IN_SITUACAO_CENSO IN_PROVA_BRASIL PESO_ALUNO_LP PESO_ALUNO_MT PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q038 ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2011", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Escola_2011.dta"

** Para o tratamento de dados de 2011 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge m:m id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Escola_2011.dta"

** Após a combinação entre os bancos, conferimos o marge e excluímos a variável que
// o indica
drop _merge 

** Renomeamos apenas as variáveis de interesse da análise
rename tx_resp_q001 TX_ESC_Q007
rename tx_resp_q002 TX_ESC_Q008
rename tx_resp_q003 TX_ESC_Q009

forvalues i = 4/9 {
local j = `i'+6
rename tx_resp_q00`i' TX_ESC_Q0`j'
}

forvalues i = 10/15 {
local j = `i'+6
rename tx_resp_q0`i' TX_ESC_Q0`j'
}

rename tx_resp_q016 TX_ESC_Q032
rename tx_resp_q017 TX_ESC_Q022
rename tx_resp_q018 TX_ESC_Q023
rename tx_resp_q019 TX_ESC_Q034

forvalues i = 20/26 {
local j = `i'+4
rename tx_resp_q0`i' TX_ESC_Q0`j'
}

rename tx_resp_q027 TX_ESC_Q033
rename tx_resp_q028 TX_ESC_Q036
rename tx_resp_q029 TX_ESC_Q031
rename tx_resp_q030 TX_ESC_Q035

forvalues i = 31/46 {
local j = `i'+6
rename tx_resp_q0`i' TX_ESC_Q0`j'
}

forvalues i = 47/50 {
local j = `i'+7
rename tx_resp_q0`i' TX_ESC_Q0`j'
}

rename tx_resp_q051 TX_ESC_Q059

rename tx_resp_q052 TX_ESC_Q060
gen TX_ESC_Q061=TX_ESC_Q060, after(TX_ESC_Q060)

rename tx_resp_q053 TX_ESC_Q062
rename tx_resp_q054 TX_ESC_Q063
rename tx_resp_q055 TX_ESC_Q064
rename tx_resp_q056 TX_ESC_Q058

forvalues i = 57/66 {
local j = `i'+8
rename tx_resp_q0`i' TX_ESC_Q0`j'
}

** Todas as variáveis tem seus códigos passados para a letra maiúscula devido à 
// compatibilização com os outros anos. Dos 3 que serão usados como base (2017,
// 2015 e 2013), 2 estão desta forma 
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_serie nu_matriculados_censo nu_presentes taxa_participacao id_divulgacao media_lp media_mt in_preenchimento) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_SERIE NU_MATRICULADOS_CENSO NU_PRESENTES TAXA_PARTICIPACAO ID_DIVULGACAO MEDIA_LP MEDIA_MT IN_PREENCHIMENTO)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036 TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2011", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Diretor_2011.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/6 {
rename tx_resp_q00`i' TX_DIR_Q00`i'
}

rename tx_resp_q008 TX_DIR_Q007
rename tx_resp_q009 TX_DIR_Q008
rename tx_resp_q010 TX_DIR_Q009
rename tx_resp_q011 TX_DIR_Q019
rename tx_resp_q014 TX_DIR_Q010
rename tx_resp_q015 TX_DIR_Q012
rename tx_resp_q016 TX_DIR_Q011
rename tx_resp_q017 TX_DIR_Q018
rename tx_resp_q018 TX_DIR_Q016

// as Questões 17 e 18 respodem a Questão 15 da Base de 2013 a 2017

rename tx_resp_q019 TX_DIR_Q017
rename tx_resp_q020 TX_DIR_Q013
rename tx_resp_q021 TX_DIR_Q014
rename tx_resp_q022 TX_DIR_Q026
rename tx_resp_q023 TX_DIR_Q027
rename tx_resp_q024 TX_DIR_Q029

// as Questões 25, 26, 27 e 28 respodem a Questão 30 da Base de 2013 a 2017

rename tx_resp_q029 TX_DIR_Q031
rename tx_resp_q030 TX_DIR_Q032

forvalues i = 31/34 {
local j = `i'+6
rename tx_resp_q0`i' TX_DIR_Q0`j'
}

rename tx_resp_q035 TX_DIR_Q028
rename tx_resp_q036 TX_DIR_Q041
rename tx_resp_q037 TX_DIR_Q042

forvalues i = 38/42 {
local j = `i'+7
rename tx_resp_q0`i' TX_DIR_Q0`j'
}

rename tx_resp_q043 TX_DIR_Q043
rename tx_resp_q046 TX_DIR_Q062
rename tx_resp_q047 TX_DIR_Q063
rename tx_resp_q048 TX_DIR_Q064
rename tx_resp_q051 TX_DIR_Q065
rename tx_resp_q053 TX_DIR_Q066

forvalues i = 55/68 {
local j = `i'+12
rename tx_resp_q0`i' TX_DIR_Q0`j'
}

rename tx_resp_q114 TX_DIR_Q050
rename tx_resp_q115 TX_DIR_Q051
rename tx_resp_q117 TX_DIR_Q054
rename tx_resp_q119 TX_DIR_Q053

// as Questões 120, 121 e 122 respodem a Questão 55 da Base de 2013 a 2017

rename tx_resp_q125 TX_DIR_Q081
rename tx_resp_q126 TX_DIR_Q082
rename tx_resp_q127 TX_DIR_Q083
rename tx_resp_q128 TX_DIR_Q086
rename tx_resp_q129 TX_DIR_Q087
rename tx_resp_q130 TX_DIR_Q088
rename tx_resp_q132 TX_DIR_Q089

forvalues i = 197/205 {
local j = `i'-97
rename tx_resp_q`i' TX_DIR_Q`j'
}

rename tx_resp_q210 TX_DIR_Q109
rename tx_resp_q211 TX_DIR_Q110
rename tx_resp_q212 TX_DIR_Q111

drop  tx_resp_q*

** Passamos todas as variáveis de identificação, além das selecionadas, para a
// formatação maiúscula e ficamos de acordo com os anos de 2015 e 2017
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO)

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q111


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2011", replace

clear

*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Professor_2011.dta"

** Renomeamos apenas as variáveis de interesse da análise
rename tx_resp_q004 TX_PRO_Q004
rename tx_resp_q016 TX_PRO_Q010
rename tx_resp_q011 TX_PRO_Q011
rename tx_resp_q017 TX_PRO_Q013
rename tx_resp_q018 TX_PRO_Q014
rename tx_resp_q019 TX_PRO_Q015
rename tx_resp_q035 TX_PRO_Q040
rename tx_resp_q115 TX_PRO_Q049
rename tx_resp_q116 TX_PRO_Q050

** Passamos todas as variáveis de identificação, além das selecionadas, para a
// formatação maiúscula e ficamos de acordo com os anos de 2015 e 2017
rename (id_prova_brasil id_uf id_municipio id_escola id_dependencia_adm id_localizacao id_turma id_serie) (ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE)

** Mantendo apenas as variáveis com impoteância de anlálise  
// ------


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q040 TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q011 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2011", replace

clear

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2009     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO) 

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2009.dta"

** Para o tratamento de dados de 2009 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge 1:1 id_aluno id_serie id_dependencia_adm id_localizacao sigla_uf cod_uf no_municipio cod_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_5ano_2009.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em 
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if id_serie==5

** Após a exclusão das informações sobre o 9º ano, conferimos o marge e
// excluímos a variável que o indica
tab _merge
drop _merge 

** Renomeamos apenas as variáveis de interesse da análise

foreach i in 1 2 3 4 5 6 7 8 9 {
rename resp_aln5_`i' TX_RESP_Q00`i'
}

foreach i in 10 11 12 13 14 {
rename resp_aln5_`i' TX_RESP_Q0`i'
}

rename resp_aln5_15 TX_RESP_Q017
rename resp_aln5_16 TX_RESP_Q015
rename resp_aln5_17 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 {
rename resp_aln5_`i' TX_RESP_Q0`i'
}

*Neste ano não temos a Q036, mas Q001 pergunta se o computador tem acesso a 
// rede de internet

forvalues i = 33/43 {
local j = `i'+7
rename resp_aln5_`i' TX_RESP_Q0`j'
}

drop resp_aln5_*

** Todas as variáveis tem seus códigos passados para a letra maiúscula devido à 
// compatibilização com os outros anos. Dos 3 que serão usados como base (2017,
// 2015 e 2013), 2 estão desta forma 
rename (id_aluno id_turma co_turno id_serie pk_cod_entidade id_dependencia_adm id_localizacao sigla_uf cod_uf no_municipio cod_municipio st_lingua_portuguesa st_matematica nu_theta_l nu_setheta_l nu_thetat_l nu_sethetat_l nu_theta_m nu_setheta_m nu_thetat_m nu_sethetat_m tx_respostas) (ID_ALUNO ID_TURMA CO_TURNO ID_SERIE PK_COD_ENTIDADE ID_DEPENDENCIA_ADM ID_LOCALIZACAO SIGLA_UF COD_UF NO_MUNICIPIO COD_MUNICIPIO ST_LINGUA_PORTUGUESA ST_MATEMATICA NU_THETA_L NU_SETHETA_L NU_THETAT_L NU_SETHETAT_L NU_THETA_M NU_SETHETA_M NU_THETAT_M NU_SETHETAT_M TX_RESPOSTAS)

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2009

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")   
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO
rename PK_COD_ENTIDADE ID_ESCOLA
rename CO_TURNO ID_TURNO
rename NU_THETA_L PROFICIENCIA_LP
rename NU_SETHETA_L DESVIO_PADRAO_LP
rename NU_THETA_M PROFICIENCIA_MT
rename NU_SETHETA_M DESVIO_PADRAO_MT
rename NU_THETAT_L PROFICIENCIA_LP_SAEB
rename NU_SETHETAT_L DESVIO_PADRAO_LP_SAEB
rename NU_THETAT_M PROFICIENCIA_MT_SAEB
rename NU_SETHETAT_M DESVIO_PADRAO_MT_SAEB

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor 
// especificar esta informação
gen ID_REGIAO=.
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2009 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q050


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2009", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO) 

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2009.dta"

** Para o tratamento de dados de 2009 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge 1:1 id_aluno id_serie id_dependencia_adm id_localizacao sigla_uf cod_uf no_municipio cod_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_9ano_2009.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if id_serie==9

** Após a exclusão das informações sobre o 9º ano, conferimos o marge e 
// excluímos a variável que o indica
tab _merge
drop _merge 

** Renomeamos apenas as variáveis de interesse da análise
foreach i in 1 2 3 4 5 6 7 8 9 {
rename resp_aln9_`i' TX_RESP_Q00`i'
}

foreach i in 10 11 12 13 14 {
rename resp_aln9_`i' TX_RESP_Q0`i'
}

rename resp_aln9_15 TX_RESP_Q017
rename resp_aln9_16 TX_RESP_Q015
rename resp_aln9_17 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 {
rename resp_aln9_`i' TX_RESP_Q0`i'
}

*Neste ano não temos a Q038, mas Q001 pergunta se o computador tem acesso a rede

forvalues i = 33/45 {
local j = `i'+10
rename resp_aln9_`i' TX_RESP_Q0`j'
}

rename resp_aln9_47 TX_RESP_Q057

drop resp_aln9_*

** Todas as variáveis tem seus códigos passados para a letra maiúscula devido à 
// compatibilização com os outros anos. Dos 3 que serão usados como base (2017,
// 2015 e 2013), 2 estão desta forma 
rename (id_aluno id_turma co_turno id_serie pk_cod_entidade id_dependencia_adm id_localizacao sigla_uf cod_uf no_municipio cod_municipio st_lingua_portuguesa st_matematica nu_theta_l nu_setheta_l nu_thetat_l nu_sethetat_l nu_theta_m nu_setheta_m nu_thetat_m nu_sethetat_m tx_respostas) (ID_ALUNO ID_TURMA CO_TURNO ID_SERIE PK_COD_ENTIDADE ID_DEPENDENCIA_ADM ID_LOCALIZACAO SIGLA_UF COD_UF NO_MUNICIPIO COD_MUNICIPIO ST_LINGUA_PORTUGUESA ST_MATEMATICA NU_THETA_L NU_SETHETA_L NU_THETAT_L NU_SETHETAT_L NU_THETA_M NU_SETHETA_M NU_THETAT_M NU_SETHETAT_M TX_RESPOSTAS)

** Geramos uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2009

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")   
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO
rename PK_COD_ENTIDADE ID_ESCOLA
rename CO_TURNO ID_TURNO
rename NU_THETA_L PROFICIENCIA_LP
rename NU_SETHETA_L DESVIO_PADRAO_LP
rename NU_THETA_M PROFICIENCIA_MT
rename NU_SETHETA_M DESVIO_PADRAO_MT
rename NU_THETAT_L PROFICIENCIA_LP_SAEB
rename NU_SETHETAT_L DESVIO_PADRAO_LP_SAEB
rename NU_THETAT_M PROFICIENCIA_MT_SAEB
rename NU_SETHETAT_M DESVIO_PADRAO_MT_SAEB

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor
// especificar esta informação
gen ID_REGIAO=.
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2009 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** entender as informações de proficiência segundo o relatório metodológico
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q009 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2009", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Escola_2009.dta"

** Para o tratamento de dados de 2009 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge m:m pk_cod_entidade id_dependencia_adm id_localizacao using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Escola_2009.dta"

** Renomeamos apenas as variáveis de interesse da análise
rename resp_esc1 TX_ESC_Q007
rename resp_esc2 TX_ESC_Q008
rename resp_esc3 TX_ESC_Q009

forvalues i = 4/15 {
local j = `i'+6
rename resp_esc`i' TX_ESC_Q0`j'
}

rename resp_esc16 TX_ESC_Q032
rename resp_esc17 TX_ESC_Q022
rename resp_esc18 TX_ESC_Q023
rename resp_esc19 TX_ESC_Q034

forvalues i = 20/26 {
local j = `i'+4
rename resp_esc`i' TX_ESC_Q0`j'
}

rename resp_esc27 TX_ESC_Q033
rename resp_esc28 TX_ESC_Q036
rename resp_esc29 TX_ESC_Q031
rename resp_esc30 TX_ESC_Q035
rename resp_esc31 TX_ESC_Q049
rename resp_esc32 TX_ESC_Q052
rename resp_esc33 TX_ESC_Q048
rename resp_esc34 TX_ESC_Q044
rename resp_esc35 TX_ESC_Q050
rename resp_esc36 TX_ESC_Q047
rename resp_esc37 TX_ESC_Q046

rename resp_esc39 TX_ESC_Q045
rename resp_esc40 TX_ESC_Q056
rename resp_esc41 TX_ESC_Q054
rename resp_esc42 TX_ESC_Q055

rename resp_esc56 TX_ESC_Q071
rename resp_esc58 TX_ESC_Q072
rename resp_esc59 TX_ESC_Q073
rename resp_esc60 TX_ESC_Q074

drop resp_esc*

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename pk_cod_entidade ID_ESCOLA
rename id_dependencia_adm ID_DEPENDENCIA_ADM
rename id_localizacao ID_LOCALIZACAO
rename cod_uf ID_UF
rename cod_municipio ID_MUNICIPIO
rename nu_media_port MEDIA_LP
rename nu_media_mat MEDIA_MT
rename nu_participantes NU_PRESENTES
rename id_serie ID_SERIE

*5 variáveis são deixadas de lado: Aquelas referentes as quantidades de 
// presentes nas provas de português e matemática (semlhantes a 
// "nu_participantes"), a de sigla estadual, a de nome do município e a taxa de 
// respostas do questionário

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2009

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_ESCOLA ID_SERIE ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2009", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO) 

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Diretor_2009.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/6 {
rename resp_dir`i' TX_DIR_Q00`i'
}

rename resp_dir8 TX_DIR_Q007
rename resp_dir9 TX_DIR_Q008
rename resp_dir10 TX_DIR_Q009
rename resp_dir11 TX_DIR_Q019
rename resp_dir14 TX_DIR_Q010
rename resp_dir16 TX_DIR_Q011
rename resp_dir15 TX_DIR_Q012
rename resp_dir17 TX_DIR_Q018
rename resp_dir18 TX_DIR_Q016

// as Questões 17 e 18 respodem a Questão 15 da Base de 2013 a 2017

rename resp_dir19 TX_DIR_Q017
rename resp_dir20 TX_DIR_Q013
rename resp_dir21 TX_DIR_Q014
rename resp_dir22 TX_DIR_Q026
rename resp_dir23 TX_DIR_Q027
rename resp_dir24 TX_DIR_Q029

// as Questões 25, 26, 27 e 28 respodem a Questão 30 da Base de 2013 a 2017

rename resp_dir29 TX_DIR_Q031
rename resp_dir30 TX_DIR_Q032

forvalues i = 31/34 {
local j = `i'+6
rename resp_dir`i' TX_DIR_Q0`j'
}

rename resp_dir35 TX_DIR_Q028
rename resp_dir36 TX_DIR_Q041
rename resp_dir37 TX_DIR_Q042

forvalues i = 38/42 {
local j = `i'+7
rename resp_dir`i' TX_DIR_Q0`j'
}

rename resp_dir43 TX_DIR_Q043

forvalues i = 46/59 {
local j = `i'+21
rename resp_dir`i' TX_DIR_Q0`j'
}

rename resp_dir83 TX_DIR_Q050
rename resp_dir84 TX_DIR_Q051
rename resp_dir86 TX_DIR_Q054
rename resp_dir88 TX_DIR_Q053

// as Questões 91, 92 e 93 respodem a Questão 55 da Base de 2013 a 2017

rename resp_dir94 TX_DIR_Q081
rename resp_dir95 TX_DIR_Q082
rename resp_dir96 TX_DIR_Q083
rename resp_dir97 TX_DIR_Q086
rename resp_dir98 TX_DIR_Q087
rename resp_dir99 TX_DIR_Q088
rename resp_dir101 TX_DIR_Q089

// a Questão 133 responde as Questões 34, 35 e 36 da Base de 2013 a 2017

rename resp_dir134 TX_DIR_Q033

** Buscando na base de Diretores dos anos de 2009 e 2007 as informações sobre a
// qualidade dos computadores e do acesso à internet que vinham informados no 
// quastionário escolar até 2011
rename resp_dir60 TX_ESC_Q037
rename resp_dir61 TX_ESC_Q038
rename resp_dir62 TX_ESC_Q039
rename resp_dir63 TX_ESC_Q040
rename resp_dir64 TX_ESC_Q041
rename resp_dir77 TX_ESC_Q057
rename resp_dir78 TX_ESC_Q059
rename resp_dir79 TX_ESC_Q061

drop resp_dir*

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename pk_cod_entidade ID_ESCOLA
rename id_dependencia_adm ID_DEPENDENCIA_ADM
rename id_localizacao ID_LOCALIZACAO
rename cod_uf ID_UF
rename cod_municipio ID_MUNICIPIO

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2009

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q033


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2009", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Professor_2009.dta"

** Renomeamos apenas as variáveis de interesse da análise
rename resp_prof4 TX_PRO_Q004
rename resp_prof16 TX_PRO_Q010
rename resp_prof11 TX_PRO_Q011
rename resp_prof17 TX_PRO_Q013
rename resp_prof18 TX_PRO_Q014
rename resp_prof19 TX_PRO_Q015
*Neste ano não temos a pergunta se o professor ler sites na internet, que servia
// como indicador de atividade
rename resp_prof44 TX_PRO_Q049
rename resp_prof45 TX_PRO_Q050

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename pk_cod_entidade ID_ESCOLA
rename id_dependencia_adm ID_DEPENDENCIA_ADM
rename id_localizacao ID_LOCALIZACAO 
rename cod_uf ID_UF
rename cod_municipio ID_MUNICIPIO
rename id_turma ID_TURMA
rename id_serie ID_SERIE

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2009

** Mantendo apenas as variáveis com impoteância de anlálise  
// ------


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q011 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2009", replace

clear

.
.
.

**############################################################################**
********************************************************************************
****************************     SAEB DE 2007     ******************************

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 5º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2007.dta"

** Para o tratamento de dados de 2007 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge 1:1 ID_ALUNO ID_SERIE ID_DEPENDENCIA_ADM ID_LOCALIZACAO SIGLA_UF COD_UF NO_MUNICIPIO COD_MUNICIPIO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_5ano_2007.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if ID_SERIE==4
recode ID_SERIE (4=5)

** Renomeamos apenas as variáveis de interesse da análise

foreach i in 1 2 3 4 5 6 7 8 { 
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q00`i'
}

rename TX_RESP_QUEST_ALUNO_9 TX_RESP_Q010
rename TX_RESP_QUEST_ALUNO_10 TX_RESP_Q011

foreach i in 12 13 14 { 
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`i'
}

rename TX_RESP_QUEST_ALUNO_15 TX_RESP_Q017
rename TX_RESP_QUEST_ALUNO_16 TX_RESP_Q015
rename TX_RESP_QUEST_ALUNO_17 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 { 
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`i'
}

forvalues i = 33/43 {
local j = `i'+7
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`j'
}

drop TX_RESP_QUEST_ALUNO_*

** Gerando uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2007

** Renomeando as variáveis de identificação e avalição do aluno para que poçamos
// aproximá-las das que são trazidas pelos últimos anos do sistema (os anos 
// "base")  
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO
rename PK_COD_ENTIDADE ID_ESCOLA
rename NU_THETA_L PROFICIENCIA_LP
rename NU_SETHETA_L DESVIO_PADRAO_LP
rename NU_THETA_M PROFICIENCIA_MT
rename NU_SETHETA_M DESVIO_PADRAO_MT
rename NU_THETAT_L PROFICIENCIA_LP_SAEB
rename NU_SETHETAT_L DESVIO_PADRAO_LP_SAEB
rename NU_THETAT_M PROFICIENCIA_MT_SAEB
rename NU_SETHETAT_M DESVIO_PADRAO_MT_SAEB

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor 
// especificar esta informação
gen ID_REGIAO=.
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2007 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q050


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q042 TX_RESP_Q043 TX_RESP_Q045 TX_RESP_Q046


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2007", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES PARA OS ALUNOS DO 9º ANO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Aluno_2007.dta"

** Para o tratamento de dados de 2007 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007
// estas informações são apresentadas de forma separada)  
merge 1:1 ID_ALUNO ID_SERIE ID_DEPENDENCIA_ADM ID_LOCALIZACAO SIGLA_UF COD_UF NO_MUNICIPIO COD_MUNICIPIO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Aluno_9ano_2007.dta"

** Como as informações sobre os alunos são apresentadas de forma conjunta em
// relação à série do indivíduo, manteremos apenas os alunos de uma série 
keep if ID_SERIE==8
recode ID_SERIE (8=9)

** Renomeamos apenas as variáveis de interesse da análise
foreach i in 1 2 3 4 5 6 7 8 {
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q00`i'
}

rename TX_RESP_QUEST_ALUNO_9 TX_RESP_Q010
rename TX_RESP_QUEST_ALUNO_10 TX_RESP_Q011

foreach i in 12 13 14 {
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`i'
}

rename TX_RESP_QUEST_ALUNO_15 TX_RESP_Q017
rename TX_RESP_QUEST_ALUNO_16 TX_RESP_Q015
rename TX_RESP_QUEST_ALUNO_17 TX_RESP_Q016

foreach i in 18 19 20 21 22 23 24 25 26 27 28 29 30 31 {
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`i'
}

forvalues i = 33/45 {
local j = `i'+10
rename TX_RESP_QUEST_ALUNO_`i' TX_RESP_Q0`j'
}

rename TX_RESP_QUEST_ALUNO_47 TX_RESP_Q057

drop TX_RESP_QUEST_ALUNO_*

** Gerando uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2007

** Renomeando as variáveis de identificação e avalição do aluno para que poçamos
// aproximá-las das que são trazidas pelos últimos anos do sistema (os anos 
// "base")  
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO
rename PK_COD_ENTIDADE ID_ESCOLA
rename NU_THETA_L PROFICIENCIA_LP
rename NU_SETHETA_L DESVIO_PADRAO_LP
rename NU_THETA_M PROFICIENCIA_MT
rename NU_SETHETA_M DESVIO_PADRAO_MT
rename NU_THETAT_L PROFICIENCIA_LP_SAEB
rename NU_SETHETAT_L DESVIO_PADRAO_LP_SAEB
rename NU_THETAT_M PROFICIENCIA_MT_SAEB
rename NU_SETHETAT_M DESVIO_PADRAO_MT_SAEB

** Preenchemos a variável de ID_REGIÃO com a variável ID_UF para melhor
// especificar esta informação
gen ID_REGIAO=.
replace ID_REGIAO=1 if ID_UF==11|ID_UF==12|ID_UF==13|ID_UF==14|ID_UF==15|ID_UF==16|ID_UF==17
replace ID_REGIAO=2 if ID_UF==21|ID_UF==22|ID_UF==23|ID_UF==24|ID_UF==25|ID_UF==26|ID_UF==27|ID_UF==28|ID_UF==29
replace ID_REGIAO=3 if ID_UF==31|ID_UF==32|ID_UF==33|ID_UF==35
replace ID_REGIAO=4 if ID_UF==41|ID_UF==42|ID_UF==43
replace ID_REGIAO=5 if ID_UF==50|ID_UF==51|ID_UF==52|ID_UF==53

** Em 2007 também não temos a informação da variável ID_AREA, mas conseguimos a 
// preencher tendo os códigos das capitais!!
gen ID_AREA=2

foreach i in 1100205 1200401 1302603 1400100 1501402 1600303 1721000 2111300 ///
2211001 2304400 2408102 2507507 2611606 2704302 2800308 2927408 3106200 ///
3205309 3304557 3550308 4106902 4205407 4314902 5002704 5103403 5208707 ///
5300108 {
replace ID_AREA=1 if ID_MUNICIPIO==`i'
}

replace ID_AREA=. if ID_REGIAO==.

label define area 1 "Capital" 2 "Interior"
label values ID_AREA area

**
gen IN_PROVA_BRASIL=1

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB TX_RESP_Q001-TX_RESP_Q057


** RECORTE
keep ID_PROVA_BRASIL ID_REGIAO ID_UF ID_MUNICIPIO ID_AREA ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ID_ALUNO IN_PROVA_BRASIL PROFICIENCIA_LP DESVIO_PADRAO_LP PROFICIENCIA_LP_SAEB DESVIO_PADRAO_LP_SAEB PROFICIENCIA_MT DESVIO_PADRAO_MT PROFICIENCIA_MT_SAEB DESVIO_PADRAO_MT_SAEB ///
TX_RESP_Q001 TX_RESP_Q002 TX_RESP_Q005 TX_RESP_Q006 TX_RESP_Q007 TX_RESP_Q008 TX_RESP_Q010 TX_RESP_Q011 TX_RESP_Q012 TX_RESP_Q013 TX_RESP_Q014 TX_RESP_Q015 TX_RESP_Q016 TX_RESP_Q017 TX_RESP_Q019 TX_RESP_Q023 TX_RESP_Q027 TX_RESP_Q028 TX_RESP_Q029 TX_RESP_Q030 TX_RESP_Q031 TX_RESP_Q045 TX_RESP_Q046 TX_RESP_Q048 TX_RESP_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2007", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES ESCOLARES)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Resultado_Escola_2007.dta"

** Para o tratamento de dados de 2007 foi a relização de uma combinação entre as
// informações do banco de resultado e do questionário (em 2011, 2009 e 2007 
// estas informações são apresentadas de forma separada)  
merge m:m PK_COD_ENTIDADE ID_DEPENDENCIA_ADM using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Escola_2007.dta"

** Recodificamos as categorias da variável de série para que se organize como as
// dos demais períodos de tempo
recode ID_SERIE (4=5)
recode ID_SERIE (8=9)

** Renomeamos apenas as variáveis de interesse da análise
rename TX_RESP_QUEST_ESCOLA_1 TX_ESC_Q007
rename TX_RESP_QUEST_ESCOLA_2 TX_ESC_Q008
rename TX_RESP_QUEST_ESCOLA_3 TX_ESC_Q009

forvalues i = 8/11 {
local j = `i'+10
rename TX_RESP_QUEST_ESCOLA_`i' TX_ESC_Q0`j'
}

rename TX_RESP_QUEST_ESCOLA_12 TX_ESC_Q010
rename TX_RESP_QUEST_ESCOLA_14 TX_ESC_Q014
rename TX_RESP_QUEST_ESCOLA_15 TX_ESC_Q015
rename TX_RESP_QUEST_ESCOLA_16 TX_ESC_Q011
rename TX_RESP_QUEST_ESCOLA_17 TX_ESC_Q012
rename TX_RESP_QUEST_ESCOLA_18 TX_ESC_Q013
rename TX_RESP_QUEST_ESCOLA_19 TX_ESC_Q016
rename TX_RESP_QUEST_ESCOLA_20 TX_ESC_Q017

rename TX_RESP_QUEST_ESCOLA_21 TX_ESC_Q032
rename TX_RESP_QUEST_ESCOLA_22 TX_ESC_Q022
rename TX_RESP_QUEST_ESCOLA_23 TX_ESC_Q023
rename TX_RESP_QUEST_ESCOLA_24 TX_ESC_Q034

forvalues i = 25/31 {
local j = `i'-1
rename TX_RESP_QUEST_ESCOLA_`i' TX_ESC_Q0`j'
}

rename TX_RESP_QUEST_ESCOLA_32 TX_ESC_Q033
rename TX_RESP_QUEST_ESCOLA_33 TX_ESC_Q036
rename TX_RESP_QUEST_ESCOLA_34 TX_ESC_Q031
rename TX_RESP_QUEST_ESCOLA_35 TX_ESC_Q035

rename TX_RESP_QUEST_ESCOLA_42 TX_ESC_Q049
rename TX_RESP_QUEST_ESCOLA_43 TX_ESC_Q052
rename TX_RESP_QUEST_ESCOLA_44 TX_ESC_Q048
rename TX_RESP_QUEST_ESCOLA_45 TX_ESC_Q044
rename TX_RESP_QUEST_ESCOLA_46 TX_ESC_Q050
rename TX_RESP_QUEST_ESCOLA_47 TX_ESC_Q047
rename TX_RESP_QUEST_ESCOLA_48 TX_ESC_Q046
rename TX_RESP_QUEST_ESCOLA_50 TX_ESC_Q045
rename TX_RESP_QUEST_ESCOLA_51 TX_ESC_Q056

rename TX_RESP_QUEST_ESCOLA_59 TX_ESC_Q071
rename TX_RESP_QUEST_ESCOLA_61 TX_ESC_Q072
rename TX_RESP_QUEST_ESCOLA_62 TX_ESC_Q073
rename TX_RESP_QUEST_ESCOLA_63 TX_ESC_Q074

drop TX_RESP_QUEST_ESCOLA_*

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename PK_COD_ENTIDADE ID_ESCOLA
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO
rename NU_MEDIA_PORT MEDIA_LP
rename NU_MEDIA_MAT MEDIA_MT
rename NU_PARTICIPANTES NU_PRESENTES

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2007

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_ESCOLA ID_SERIE ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_UF ID_MUNICIPIO TX_ESC_Q007-TX_ESC_Q074


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_ESC_Q007 TX_ESC_Q008 TX_ESC_Q009 TX_ESC_Q010 TX_ESC_Q011 TX_ESC_Q012 TX_ESC_Q013 TX_ESC_Q014 TX_ESC_Q015 TX_ESC_Q016 TX_ESC_Q017 TX_ESC_Q018 TX_ESC_Q019 TX_ESC_Q020 TX_ESC_Q021 TX_ESC_Q022 TX_ESC_Q023 TX_ESC_Q024 TX_ESC_Q025 TX_ESC_Q026 TX_ESC_Q027 TX_ESC_Q028 TX_ESC_Q029 TX_ESC_Q030 TX_ESC_Q031 TX_ESC_Q032 TX_ESC_Q033 TX_ESC_Q034 TX_ESC_Q035 TX_ESC_Q036


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2007", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE DIREÇÃO)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Diretor_2007.dta"

** Renomeamos apenas as variáveis de interesse da análise
forvalues i = 1/6 {
rename TX_RESP_QUEST_DIRETOR_`i' TX_DIR_Q00`i'
}

rename TX_RESP_QUEST_DIRETOR_8 TX_DIR_Q007
rename TX_RESP_QUEST_DIRETOR_9 TX_DIR_Q008
rename TX_RESP_QUEST_DIRETOR_10 TX_DIR_Q009
rename TX_RESP_QUEST_DIRETOR_11 TX_DIR_Q019
rename TX_RESP_QUEST_DIRETOR_14 TX_DIR_Q010
rename TX_RESP_QUEST_DIRETOR_16 TX_DIR_Q011
rename TX_RESP_QUEST_DIRETOR_15 TX_DIR_Q012
rename TX_RESP_QUEST_DIRETOR_17 TX_DIR_Q018
rename TX_RESP_QUEST_DIRETOR_18 TX_DIR_Q016

// as Questões 17 e 18 respodem a Questão 15 da Base de 2013 a 2017

rename TX_RESP_QUEST_DIRETOR_19 TX_DIR_Q017
rename TX_RESP_QUEST_DIRETOR_20 TX_DIR_Q013
rename TX_RESP_QUEST_DIRETOR_21 TX_DIR_Q014
rename TX_RESP_QUEST_DIRETOR_22 TX_DIR_Q026
rename TX_RESP_QUEST_DIRETOR_23 TX_DIR_Q027
rename TX_RESP_QUEST_DIRETOR_24 TX_DIR_Q029

// as Questões 25, 26, 27 e 28 respodem a Questão 30 da Base de 2013 a 2017

rename TX_RESP_QUEST_DIRETOR_29 TX_DIR_Q031
rename TX_RESP_QUEST_DIRETOR_30 TX_DIR_Q032

forvalues i = 31/34 {
local j = `i'+6
rename TX_RESP_QUEST_DIRETOR_`i' TX_DIR_Q0`j'
}

rename TX_RESP_QUEST_DIRETOR_35 TX_DIR_Q028
rename TX_RESP_QUEST_DIRETOR_36 TX_DIR_Q041
rename TX_RESP_QUEST_DIRETOR_37 TX_DIR_Q042

forvalues i = 38/42 {
local j = `i'+7
rename TX_RESP_QUEST_DIRETOR_`i' TX_DIR_Q0`j'
}

rename TX_RESP_QUEST_DIRETOR_43 TX_DIR_Q043

forvalues i = 44/57 {
local j = `i'+23
rename TX_RESP_QUEST_DIRETOR_`i' TX_DIR_Q0`j'
}

rename TX_RESP_QUEST_DIRETOR_80 TX_DIR_Q050
rename TX_RESP_QUEST_DIRETOR_81 TX_DIR_Q051
rename TX_RESP_QUEST_DIRETOR_83 TX_DIR_Q054
rename TX_RESP_QUEST_DIRETOR_85 TX_DIR_Q053

// as Questões 88, 89 e 90 respodem a Questão 55 da Base de 2013 a 2017

rename TX_RESP_QUEST_DIRETOR_91 TX_DIR_Q081
rename TX_RESP_QUEST_DIRETOR_92 TX_DIR_Q082
rename TX_RESP_QUEST_DIRETOR_93 TX_DIR_Q083
rename TX_RESP_QUEST_DIRETOR_94 TX_DIR_Q086
rename TX_RESP_QUEST_DIRETOR_95 TX_DIR_Q087
rename TX_RESP_QUEST_DIRETOR_96 TX_DIR_Q088
rename TX_RESP_QUEST_DIRETOR_98 TX_DIR_Q089

// a Questão 161 respode as Questões 34, 35 e 36 da Base de 2013 a 2017

rename TX_RESP_QUEST_DIRETOR_162 TX_DIR_Q033

** Buscando na base de Diretores dos anos de 2009 e 2007 as informações sobre a
// qualidade dos computadores e do acesso à internet que vinham informados no 
// quastionário escolar até 2011
rename TX_RESP_QUEST_DIRETOR_58 TX_ESC_Q037
rename TX_RESP_QUEST_DIRETOR_59 TX_ESC_Q038
rename TX_RESP_QUEST_DIRETOR_60 TX_ESC_Q039
rename TX_RESP_QUEST_DIRETOR_61 TX_ESC_Q040
rename TX_RESP_QUEST_DIRETOR_62 TX_ESC_Q041
rename TX_RESP_QUEST_DIRETOR_74 TX_ESC_Q057
rename TX_RESP_QUEST_DIRETOR_75 TX_ESC_Q059
rename TX_RESP_QUEST_DIRETOR_76 TX_ESC_Q061

drop TX_RESP_QUEST_DIRETOR_*

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename PK_COD_ENTIDADE ID_ESCOLA
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2007

** Mantendo apenas as variáveis com impoteância de anlálise  
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO TX_DIR_Q001-TX_DIR_Q033


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ///
TX_DIR_Q004 TX_DIR_Q010 TX_DIR_Q016 TX_DIR_Q017 TX_DIR_Q018 TX_DIR_Q019 TX_DIR_Q028 TX_DIR_Q068 TX_DIR_Q069 TX_DIR_Q070 TX_DIR_Q071 TX_DIR_Q072 TX_DIR_Q073 TX_DIR_Q074 TX_DIR_Q075 TX_DIR_Q076 TX_DIR_Q077 TX_DIR_Q078 TX_DIR_Q079 TX_DIR_Q080 ///
TX_ESC_Q038 TX_ESC_Q040 ///
TX_ESC_Q037 TX_ESC_Q039 TX_ESC_Q041 TX_ESC_Q057 TX_ESC_Q059 TX_ESC_Q061


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2007", replace

clear

*
*
*
**** REALIZANDO OS AJUSTES DE CORPO DOCENTE)

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Prova_Brasil_Questionario_Professor_2007.dta"

** Recodificamos as categorias da variável de série para que se organize como as
// dos demais períodos de tempo
recode ID_SERIE (4=5)
recode ID_SERIE (8=9)

** Renomeamos apenas as variáveis de interesse da análise
rename TX_RESP_QUEST_PROF_4 TX_PRO_Q004
rename TX_RESP_QUEST_PROF_16 TX_PRO_Q010
rename TX_RESP_QUEST_PROF_11 TX_PRO_Q011
rename TX_RESP_QUEST_PROF_17 TX_PRO_Q013
rename TX_RESP_QUEST_PROF_18 TX_PRO_Q014
rename TX_RESP_QUEST_PROF_19 TX_PRO_Q015
*Neste ano não temos a pergunta se o professor ler sites na internet, que servia
// como indicador de atividade
rename TX_RESP_QUEST_PROF_44 TX_PRO_Q049
rename TX_RESP_QUEST_PROF_45 TX_PRO_Q050

** Renomeando as variáveis de identificação e avalição da escola para que 
// poçamos aproximá-las das que são trazidas pelos últimos anos do sistema
// (os anos "base")  
rename PK_COD_ENTIDADE ID_ESCOLA
rename COD_UF ID_UF
rename COD_MUNICIPIO ID_MUNICIPIO

** É gerada uma variável de ano assim como nos três anos "base" de análise
gen ID_PROVA_BRASIL=2007

** Mantendo apenas as variáveis com impoteância de anlálise  
// ------


** RECORTE
keep ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE ///
TX_PRO_Q050 ///
TX_PRO_Q004 TX_PRO_Q010 TX_PRO_Q011 TX_PRO_Q013 TX_PRO_Q014 TX_PRO_Q015 TX_PRO_Q049


save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2007", replace

clear

.
.
.


**############################################################################**
********************************************************************************
*****************************     EMPILHANDO     *******************************


** Combinando os dados escolares, de direção e docência com os de alunos 
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2017.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2017.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2017.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2017.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2017.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2015.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2015.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2015.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2015.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2015.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2013.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2013.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2013.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2013.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2013.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2011.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2011.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2011.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2011.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2011.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2009.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2009.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2009.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2009.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2009.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_5EF_2007.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2007.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2007.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2007.dta", generate (_merge3) 
drop if ID_SERIE==9

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2007.dta", replace

clear

.
.

** Empilhando os dados para os alunos do 5º ano do Ensino Fundamental
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2017.dta"

gen APP_2015=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2015.dta"

gen APP_2013=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2013.dta"

gen APP_2011=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2011.dta"

gen APP_2009=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2009.dta"

gen APP_2007=0
*temporário
rename ID_TURMA ID_TURMA1
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_5EF_2007.dta"

foreach x in _merge1 _merge2 _merge3 {
tab `x'
}

compress

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_5EF", replace

clear

.
.
.

** Combinando os dados escolares, de direção e docência com os de alunos 
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2017.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2017.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2017.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2017.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2017.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2015.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2015.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2015.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2015.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2015.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2013.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2013.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2013.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2013.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2013.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2011.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2011.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2011.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2011.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2011.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2009.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2009.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2009.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2009.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2009.dta", replace

clear

use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ALN_9EF_2007.dta"
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\ESC_2007.dta", generate (_merge1)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\DIR_2007.dta", generate (_merge2)
merge m:m ID_PROVA_BRASIL ID_UF ID_MUNICIPIO ID_ESCOLA ID_DEPENDENCIA_ADM ID_LOCALIZACAO ID_TURMA ID_SERIE using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\PRO_2007.dta", generate (_merge3) 
drop if ID_SERIE==5

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2007.dta", replace

clear

.
.

** Empilhando os dados para os alunos do 9º ano do Ensino Fundamental
use "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2017.dta"

gen APP_2015=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2015.dta"

gen APP_2013=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2013.dta"

gen APP_2011=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2011.dta"

gen APP_2009=0
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2009.dta"

gen APP_2007=0
*temporário
rename ID_TURMA ID_TURMA1
append using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\TOTAL_9EF_2007.dta"

foreach x in _merge1 _merge2 _merge3 {
tab `x'
}

compress

save "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_9EF", replace


clear

exit, clear


-------------------------------------------------------------------------------------
#####################################################################################
-------------------------------------------------------------------------------------
