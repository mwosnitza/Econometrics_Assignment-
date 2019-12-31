 //Assignment 2(b)

//generate variables of the dataset 
gen two_bio = R2737900
	replace two_bio = . if two_bio < 0

	replace R2837200 = 0 if R2837200 == -4
	replace R2837300 = 0 if R2837300 == -4
	replace R2837400 = 0 if R2837400 == -4
	replace R2837500 = 0 if R2837500 == -4
	replace R2837600 = 0 if R2837600 == -4
	replace R2837700 = 0 if R2837700 == -4
	replace R2837800 = 0 if R2837800 == -4
	replace R2837900 = 0 if R2837900 == -4
	replace R2838000 = 0 if R2838000 == -4
	replace R2838100 = 0 if R2838100 == -4
	replace R2839200 = 0 if R2838200 == -4
	replace R2838300 = 0 if R2838300 == -4
	replace R2838400 = 0 if R2838400 == -4
	replace R2838500 = 0 if R2838500 == -4
	replace R2838600 = 0 if R2838600 == -4
	replace R2838700 = 0 if R2838700 == -4 
	replace R2838800 = 0 if R2838800 == -4 
	replace R2838900 = 0 if R2838900 == -4
	replace R2839000 = 0 if R2839000 == -4
	replace R2839100 = 0 if  R2839100 == -4

	replace R2837200 = . if R2837200 < 0
	replace R2837300 = . if R2837300 < 0
	replace R2837400 = . if R2837400 < 0
	replace R2837500 = . if R2837500 < 0	
	replace R2837600 = . if R2837600 < 0
	replace R2837700 = . if R2837700 < 0
	replace R2837800 = . if R2837800 < 0
	replace R2837900 = . if R2837900 < 0
	replace R2838000 = . if R2838000 < 0
	replace R2838100 = . if R2838100 < 0
	replace R2839200 = . if R2838200 < 0
	replace R2838300 = . if R2838300 < 0
	replace R2838400 = . if R2838400 < 0
	replace R2838500 = . if R2838500 < 0
	replace R2838600 = . if R2838600 < 0
	replace R2838700 = . if R2838700 < 0 
	replace R2838800 = . if R2838800 < 0 
	replace R2838900 = . if R2838900 < 0
	replace R2839000 = . if R2839000 < 0
	replace R2839100 = . if R2839100 < 0

gen l_biomom = R2837400 + R2837500 + R2837600 + R2837700 + R2837800 ///
+ R2837900 + R2838000 +  R2838100 + R2838200 + R2838300 + R2838400 ///
+ R2838500 + R2838600 + R2838700 + R2838800 + R2838900 + R2839000 + R2839100
	replace l_biomom = 18 if two_bio == 1
	replace l_biomom = 0 if R2837200 == 1

	replace R2839200 = 0 if R2839300 == -4
	replace R2839300 = 0 if R2839300 == -4
	replace R2839400 = 0 if R2839400 == -4
	replace R2839500 = 0 if R2839500 == -4
	replace R2839600 = 0 if R2839600  == -4
	replace R2839700 = 0 if R2839700 == -4
	replace R2839800 = 0 if R2839800 == -4
	replace R2839900 = 0 if R2839900 == -4
	replace R2840000 = 0 if R2840000 == -4
	replace R2840100 = 0 if R2840100 == -4
	replace R2840200 = 0 if R2840200 == -4
	replace R2840300 = 0 if R2840300 == -4
	replace R2840400 = 0 if R2840400 == -4
	replace R2840500 = 0 if R2840500 == -4
	replace R2840600 = 0 if R2840600 == -4
	replace R2840700 = 0 if R2840700 == -4
	replace R2840800 = 0 if R2840800 == -4
	replace R2840900 = 0 if R2840900 == -4
	replace R2841000 = 0 if R2841000 == -4
	replace R2841100 = 0 if R2841100 == -4

	replace R2839200 = . if R2839300 < 0
	replace R2839300 = . if R2839300 < 0
	replace R2839400 = . if R2839400 < 0
	replace R2839500 = . if R2839500 < 0
	replace R2839600 = . if R2839600 < 0
	replace R2839700 = . if R2839700 < 0
	replace R2839800 = . if R2839800 < 0
	replace R2839900 = . if R2839900 < 0
	replace R2840000 = . if R2840000 < 0
	replace R2840100 = . if R2840100 < 0
	replace R2840200 = . if R2840200 < 0
	replace R2840300 = . if R2840300 < 0
	replace R2840400 = . if R2840400 < 0
	replace R2840500 = . if R2840500 < 0
	replace R2840600 = . if R2840600 < 0
	replace R2840700 = . if R2840700 < 0
	replace R2840800 = . if R2840800 < 0
	replace R2840900 = . if R2840900 < 0
	replace R2841000 = . if R2841000 < 0
	replace R2841100 = . if R2841100 < 0

gen l_biodad = R2839400 + R2839500 + R2839600 + R2839700 + R2839800 ///
+ R2839900 + R2840000 + R2840100 + R2840200 + R2840300 + R2840400 ///
+ R2840500 + R2840600 + R2840700 + R2840800 + R2840900 + R2841000 + R2841100
	replace l_biodad = 18 if two_bio == 1
	replace l_biodad = 0 if R2839200 == 1

gen regon_93 = R441820
gen hsdeg = 0
	replace hsdeg = 1 if R4418501 > 11
	replace hsdeg = . if R4418501 < 0
gen hgcomp = R4418501
	replace hgcomp = . if hgcomp < 0
gen age = R4418700
	replace age = . if age < 0
gen female = 0 if R0214800 == 1
	replace female = 1 if R0214800 == 2
	replace female = . if R0214800 < 0
gen black = 0
	replace black = 1 if  R0214700 == 2
	replace black = . if  R0214700 < 0
gen hispanic = 0
	replace hispanic = 1 if  R0214700 == 1
	replace hispanic = . if  R0214700 < 0
gen cob_usa = R0000700 
	replace cob_usa = 0 if cob_usa == 2
	replace cob_usa = . if cob_usa < 0 
gen pov_93 = R5080800
	replace pov_93 = . if pov_93 < 0
gen marit_93 = 0
	replace marit_93 = 1 if R4418400 == 1
	replace marit_93 = . if R4418400 < 0
gen urban_93 = R4420100
gen mom_lhs = 0
	replace mom_lhs = 1 if R0006500 < 12
	replace mom_lhs = . if R0006500 < 0
gen mom_ghs = 0
	replace mom_ghs = 1 if R0006500 > 12
	replace mom_ghs = . if R0006500 < 0
gen dad_lhs = 0
	replace dad_lhs = 1 if R0007900 < 12
	replace dad_lhs = . if R0007900 < 0
gen dad_ghs = 0
	replace dad_ghs = 1 if R0007900 > 12
	replace dad_ghs = . if R0007900 < 0
gen self_80 = R0304410
	replace self_80 = . if self_80 < 0
gen siblings = R0009100
	replace siblings = . if siblings < 0
gen bio_yr = 0
	replace bio_yr = 1 if l_biomom == l_biodad
gen mom_died = H0002400 
	replace mom_died = . if mom_died < 0
gen dad_died = H0001600
	replace dad_died = . if dad_died < 0
gen rwage_93 = R4295101 
	replace rwage_93 = . if rwage_93 < 0
gen hhwage93 = R4417700 
	replace hhwage93 = . if hhwage93 < 0

	replace  R0000500 = . if R0000500 < 0
	replace  R2303500 = . if R2303500 < 0
	replace  R2303500 = . if R2303500 == 66
gen momrborn = R0000500 - R2303500
 
	replace  R2303100 = . if R2303100 < 0
	replace  R2303100 = . if R2303100 == 66
gen dadrborn = R0000500 - R2303100

gen drunkdad = 0 
	replace drunkdad = 1 if R2718800 == 1 | R2719100 == 1 ///
	| R2719400 == 1 | R2719700 == 1| R272000 == 1 | R2720300 ==1 
gen drunkmom = 0 
	replace drunkmom = 1 if R2718800 == 3 | R2719100 == 3 ///
	| R2719400 == 3 | R2719700 == 3 | R272000 == 3 | R2720300 == 3 
gen netass93 = R4392303
	replace netass93 = . if netass93 == -3 
gen wgt = R4417400
	replace wgt = . if wgt < 0
gen work_93 = R4418900
	replace work_93 = . if work_93 < 0
gen unemp_93 = R4419000
	replace unemp_93 = . if unemp_93 < 0
	replace H0014900 = . if H0014900 < 0
gen age_mdie = H0014900 - momrborn
	replace age_mdie = 18 if age_mdie >= 18
	replace H0013800 = . if H0013800 < 0
gen age_ddie = H0013800 - dadrborn
	replace age_ddie = 18 if age_ddie >= 18

//set restrictions on data in place (drop data if no interview 1993, ….)
drop if R4100202 < 0
gen afqt80 = R0618200
gen afqt89 = R0618300
drop if afqt80 < 0 | afqt89 < 0 
drop if R2737900 < 0

keep (afqt80 afqt89 regon_93 hsdeg hgcomp age female black hispanic ///
cob_usa pov_93 marit_93 urban_93 mom_lhs mom_ghs dad_lhs dad_ghs self_80 ///
siblings two_bio l_biomom l_biodad bio_yr mom_died dad_died rwage_93 ///
hhwage93 netass93 momrborn dadrborn drunkdad drunkmom wgt work_93 unemp_93 ///
age_mdie age_ddie)

//imputed variables 

mi set mlong
save jhr_basic, replace

use jhr_basic.dta
gen imom_lhs = mom_lhs 
mi register imputed imom_lhs
mi impute regress imom_lhs, add(1)
drop if imom_lhs == .
drop if _mi_miss == 1
replace imom_lhs = 0 if imom_lhs < 0
replace imom_lhs = 1 if imom_lhs > 1
keep _mi_id imom_lhs
save imom_lhs, replace

use jhr_basic.dta
gen imom_ghs = mom_ghs 
mi register imputed imom_ghs
mi impute regress imom_ghs, add(1) 
drop if imom_ghs == .
drop if _mi_miss == 1
replace imom_ghs = 0 if imom_ghs < 0
replace imom_ghs = 1 if imom_ghs > 1
keep _mi_id imom_ghs
save imom_ghs, replace

use jhr_basic.dta
gen idad_lhs = dad_lhs 
mi register imputed idad_lhs 
mi imput regress idad_lhs, add(1) 
drop if idad_lhs == .
drop if _mi_miss == 1
replace idad_lhs = 0 if idad_lhs < 0
replace idad_lhs = 1 if idad_lhs > 1
keep _mi_id idad_lhs
save idad_lhs, replace

use jhr_basic.dta
gen idad_ghs = dad_ghs
mi register imputed idad_ghs
mi impute regress idad_ghs, add(1)
drop if idad_ghs == .
drop if _mi_miss == 1
replace idad_ghs = 0 if idad_ghs < 0
replace idad_ghs = 1 if idad_ghs > 1
keep _mi_id idad_ghs
save idad_ghs, replace

use jhr_basic.dta
gen idadborn = dadrborn
mi register imputed idadborn
mi impute regress idadborn, add(1) 
drop if idadborn == .
drop if _mi_mis == 1
replace idadborn = 12 if idadborn < 12
keep _mi_id idadborn
save idadborn, replace

use jhr_basic.dta
gen imomborn = momrborn
mi register imputed imomborn
mi impute regress imomborn, add(1) 
drop if imomborn == .
drop if _mi_mis == 1
replace imomborn = 12 if imomborn < 12
keep _mi_id imomborn
save imomborn, replace

use jhr_basic.dta
gen isib = siblings
mi register imputed isib 
mi impute regress isib, add(1)
drop if isib == .
drop if _mi_miss == 1
replace isib = 0 if isib < 0
replace isib = 1 if isib > 1
keep _mi_id isib
save isib, replace

//create jhr_new dataset
use jhr_basic.dta
merge 1:1 _mi_id using imom_lhs.dta
drop _merge
merge 1:1 _mi_id using imom_ghs.dta
drop _merge
merge 1:1 _mi_id using idad_lhs.dta
drop _merge
merge 1:1 _mi_id using idad_ghs.dta
drop _merge
merge 1:1 _mi_id using imomborn.dta
drop _merge
merge 1:1 _mi_id using idadborn.dta
drop _merge
merge 1:1 _mi_id using isib.dta
drop _merge _mi_miss _mi_id _mi_m
save jhr_new.dta, replace
