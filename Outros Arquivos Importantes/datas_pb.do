- cabeçalho

gen dia_pb_ini=., after(ID_PROVA_BRASIL)
recode dia_pb_ini (.=5) if ID_PROVA_BRASIL==2007
recode dia_pb_ini (.=19) if ID_PROVA_BRASIL==2009
recode dia_pb_ini (.=7) if ID_PROVA_BRASIL==2011
recode dia_pb_ini (.=11) if ID_PROVA_BRASIL==2013
recode dia_pb_ini (.=3) if ID_PROVA_BRASIL==2015
recode dia_pb_ini (.=23) if ID_PROVA_BRASIL==2017

gen mes_pb_ini=., after(dia_pb_ini)
recode mes_pb_ini (.=11) if ID_PROVA_BRASIL==2007|ID_PROVA_BRASIL==2011| ///
ID_PROVA_BRASIL==2013|ID_PROVA_BRASIL==2015
recode mes_pb_ini (.=10) if ID_PROVA_BRASIL==2009|ID_PROVA_BRASIL==2017

gen dia_pb_fin=., after(mes_pb_ini)
recode dia_pb_fin (.=20) if ID_PROVA_BRASIL==2007
recode dia_pb_fin (.=30) if ID_PROVA_BRASIL==2009
recode dia_pb_fin (.=18) if ID_PROVA_BRASIL==2011
recode dia_pb_fin (.=21) if ID_PROVA_BRASIL==2013
recode dia_pb_fin (.=13) if ID_PROVA_BRASIL==2015
recode dia_pb_fin (.=3) if ID_PROVA_BRASIL==2017

gen mes_pb_fin=., after(dia_pb_fin)
recode mes_pb_fin (.=11) if ID_PROVA_BRASIL==2007|ID_PROVA_BRASIL==2011| ///
ID_PROVA_BRASIL==2013|ID_PROVA_BRASIL==2015|ID_PROVA_BRASIL==2017
recode mes_pb_fin (.=10) if ID_PROVA_BRASIL==2009


gen pb_date_ini = mdy(mes_pb_ini, dia_pb_ini, ID_PROVA_BRASIL), after(ID_PROVA_BRASIL)
gen pb_date_fin = mdy(mes_pb_fin, dia_pb_fin, ID_PROVA_BRASIL), after(pb_date_ini)

format %td pb_date_ini
format %td pb_date_fin

drop dia_pb_ini mes_pb_ini dia_pb_fin mes_pb_fin



=======
=======

gen trim_pb=qofd(pb_date_ini)
format %tq trim_pb

gen trim_plt=qofd(relat_plt)
format %tq trim_plt

gen trim_pac=qofd(relat_pac)
format %tq trim_pac
