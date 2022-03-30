**************#####################################################*************
**************###############                       ###############*************
**************###############      BASE ESPACIAL    ###############*************
**************###############                       ###############*************
**************#####################################################*************

** INTRO)


********************************************************************************
****************************   ESPACIAL E CIDIG2    ****************************

spshape2dta "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\BR_Municipios_2019.shp", saving(municipios) replace 

use municipios, clear


**
spset 


**
destring CD_MUN, replace
rename CD_MUN id_municipio
drop SIGLA_UF


**
merge 1:1 id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\Info_Cidig2.dta"
tab NM_MUN if _merge==1
drop _merge
drop if _ID==.


spshape2dta "C:\Users\rlfra\Desktop\TIC nervoso\Cidades Digitais\estados_2010.shp", saving(estados) replace 


** série de mapas (CIDIG2)
grmap apta_plt, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\apta_plt.gph", replace

grmap apta_pac, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\apta_pac.gph", replace

recode p_plt (.=0) 

grmap p_plt, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\p_plt.gph", replace

recode p_pac (.=0) 

grmap p_pac, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\p_pac.gph", replace

grmap event_plt, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\event_plt.gph", replace

grmap event_pac, clmethod(unique) line(data("estados_shp.dta") size(*0.2))
graph save Graph "C:\Users\rlfra\Desktop\TIC nervoso\Gráficos\event_pc.gph", replace


********************************************************************************
****************************    ESPACIAL E SAEB     ****************************

use mapas, clear


**
spset 


**
destring CD_MUN, replace
rename CD_MUN id_municipio
drop SIGLA_UF

merge m:m id_municipio using "C:\Users\rlfra\Desktop\TIC nervoso\Prova Brasil - Econs\Ajustados\BASE_5EF_AJUSTADA.dta"
