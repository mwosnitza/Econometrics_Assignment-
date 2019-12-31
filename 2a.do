//Assignment 2(a)

//table one

//table one (whole sample)

sum afqt89 hsdeg hgcomp marit_93 hhwage93 pov_93 rwage_93 netass93[iweight=wgt]

//table one (other parental structure (two_bio = 0))

sort two_bio

by two_bio: sum afqt89 hsdeg hgcomp marit_93 hhwage93 pov_93 rwage_93 /// 
netass93[iweight=wgt]

gen white = (1 - black - hispanic) 
gen male = (1 - female)

//table two
//missing(Foreign language)

sum white black hispanic male female age dad_lhs dad_ghs mom_lhs mom_ghs /// 
momrborn dadrborn drunkdad drunkmom siblings cob_usa[iweight=wgt]
sum l_biomom l_biodad

//table two (other parental structure(two_bio = 0)) 
//missing(Foreign language at home during childhood)

sort two_bio

by two_bio: sum white black hispanic male female age dad_lhs dad_ghs mom_lhs /// 
mom_ghs momrborn dadrborn drunkdad drunkmom siblings cob_usa [iweight=wgt]
by two_bio: sum l_biomom l_biodad

//generate new variables for table three and four 

gen regon_dum = 0
replace regon_dum = regon_93 if regon_93 >= 0
gen lbiomom = l_biomom/10
gen lbiodad = l_biodad/10
gen marit93 = marit_93*10
gen rwage93 = rwage_93/1000
gen hhwage_93 = hhwage/1000
gen netass_93 = netass/10000

//table three (male)

//AFQT Score (1)

reg afqt89 lbiomom lbiodad [iweight=wgt] if male, robust 
eststo

//AfQT Score (2)

reg afqt89 lbiomom lbiodad isib black hispanic age imomborn idadborn drunkdad /// 
drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa i.regon_dum [iweight=wgt] ///
if male, robust

eststo

//Highest Grade completed (3)

reg hgcomp lbiomom lbiodad [iweight=wgt] if male, robust 

eststo

//Highest Grade completed (4)

reg hgcomp lbiomom lbiodad afqt89 isib black hispanic age imomborn idadborn /// 
drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa ///
i.regon_dum [iweight=wgt] if male, robust

eststo

//Married 1993 (5)

reg marit93 lbiomom lbiodad [iweight=wgt] if male, robust 

eststo

//Married 1993 (6)

reg marit93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if male, robust

eststo

//1993 Annual Wage (7)

reg rwage93 lbiomom lbiodad [iweight=wgt] if male, robust 

eststo

//1993 Annual Wage (8)

reg rwage93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if male, robust

eststo

//1993 Family Income (9)

reg hhwage_93 lbiomom lbiodad [iweight=wgt] if male, robust 

eststo

//1993 Family Income (10)

reg hhwage_93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if male, robust

eststo

//1993 Wealth (11)

reg netass_93 lbiomom lbiodad [iweight=wgt] if male, robust 

eststo

//1993 Wealth (12)

reg netass_93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if male, robust

eststo

//table three

esttab, r2 se

eststo clear


//table four


//AFQT Score (1)

reg afqt89 lbiomom lbiodad [iweight=wgt] if female, robust 

eststo

//AfQT Score (2)

reg afqt89 lbiomom lbiodad isib black hispanic age imomborn idadborn /// 
drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//Highest Grade completed (3)

reg hgcomp lbiomom lbiodad [iweight=wgt] if female, robust

eststo

//Highest Grade completed (4)

reg hgcomp lbiomom lbiodad afqt89 isib black hispanic age imomborn ///
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//Married 1993 (5)

reg marit93 lbiomom lbiodad [iweight=wgt] if female, robust 

eststo

//Married 1993 (6)

reg marit93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn ///
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//1993 Annual Wage (7)

reg rwage93 lbiomom lbiodad [iweight=wgt] if female, robust 

eststo

//1993 Annual Wage (8)

reg rwage93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//1993 Family Income (9)

reg hhwage_93 lbiomom lbiodad [iweight=wgt] if female, robust 

eststo

//1993 Family Income (10)

reg hhwage_93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//1993 Wealth (11)

reg netass_93 lbiomom lbiodad [iweight=wgt] if female, robust 

eststo

//1993 Wealth (12)

reg netass_93 lbiomom lbiodad afqt89 hgcomp isib black hispanic age imomborn /// 
idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs cob_usa /// 
i.regon_dum [iweight=wgt] if female, robust

eststo

//table four

esttab, r2 se

eststo clear

//generate variables no two parents & variable first reason parents left 

gen notwo_bio = 1
	replace notwo_bio = 0 if l_biomom 
gen pdivor = p_divor if notwo_bio 
gen pdied = p_died if notwo_bio 
gen pown = p_own if notwo_bio
gen pmarry = p_marry if notwo_bio 
gen pill = p_ill if notwo_bio
gen pmilit = p_milit if notwo_bio 
gen prun = p_run if notwo_bio
gen pcourt = p_court if notwo_bio == 18 & l_biodad == 18
gen pcolleg = p_colleg if notwo_bio
gen pother = p_other if notwo_bio
gen punknow = p_unknow if notwo_bio
egen live_arrange = rowtotal(pdivor pdied pown pmarry pill pmilit prun /// 
pcourt pcolleg pother punknow)
gen first_res = (live_arrange == 1) 

//table five

sum pdivor pdied pown pmarry pill pmilit prun pcourt ///
pcolleg pother punknow if first_res 

sum pdivor pdied pown pmarry pill pmilit prun pcourt ///
pcolleg pother punknow [iweight=wgt]

//checking for differences in between notwo_bio's 

sum notwo_bio

//generate the two new variables (dad died, mom died) 

gen minusddie = (18 - age_ddie)
	replace minusddie = 0 if dad_died == 0 
	replace minusddie = 0 if two_bio == 1 
	replace minusddie = 0 if age_ddie > l_biodad 
	replace minusddie = minusddie/10
gen minusmdie = (18 - age_mdie)
	replace minusmdie = 0 if two_bio == 1 
	replace minusmdie = 0 if mom_died == 0 
	replace minusmdie = 0 if age_mdie > l_biomom 
	replace minusmdie = minusmdie/10
	
//table six

//Sons AFQT

reg afqt89 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if male, robust

test minusddie=minusmdie 
eststo

//Daugthers AFQT

reg afqt89 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if female, robust

test minusddie=minusmdie 
eststo

//Sons Educational Attainment

reg hgcomp lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa i.regon_dum isib [iweight=wgt] if male, robust

test minusddie=minusmdie
eststo

//Daughters Educational Attainment

reg hgcomp lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa i.regon_dum isib [iweight=wgt] if female, robust

test minusddie=minusmdie 
eststo

//Sons Married in 1993
reg marit93 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if male, robust

test minusddie=minusmdie 
eststo

//Daughters Married in 1993

reg marit93 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if female, robust

test minusddie=minusmdie 
eststo

//Sons Earnings in 1993

reg rwage93 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if male, robust

test minusddie=minusmdie 
eststo

//Daughters Earnings in 1993

reg rwage93 lbiomom lbiodad minusddie minusmdie black hispanic age /// 
imomborn idadborn drunkdad drunkmom imom_lhs imom_ghs idad_lhs idad_ghs /// 
cob_usa isib i.regon_dum [iweight=wgt] if female, robust

test minusddie=minusmdie 
eststo

//table six

esttab, se

eststo clear
