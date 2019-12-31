//For SONS (DO-File)

drop if female == 1

//generate treatment variable (growing up with two biological parents = 0)
gen notwo_bio = 1
replace notwo_bio = 0 if l_biomom == 18 & l_biodad == 18 
gen treat1 = notwo_bio
gen no_biodad = 1
replace no_biodad = 0 if l_biodad == 18
replace no_biodad = . if l_biodad == .
gen treat2 = no_biodad
gen no_biomom = 1
replace no_biomom = 0 if l_biomom == 18
replace no_biomom = . if l_biomom == .
gen treat3 = no_biomom


//generate variables
gen white = (1 - black - hispanic)
gen male = (1 - female)

gen afqt_89 = afqt89/10
gen hg_comp = hgcomp/10
gen rwage93 = rwage_93/10000
gen hhwage_93 = hhwage/10000
gen netass_93 = netass/100000

global y afqt_89 hg_comp marit_93 hhwage_93 rwage93 netass_93
global x black hispanic age idad_lhs idad_ghs imom_lhs imom_ghs ///
imomborn idadborn drunkdad drunkmom isib cob_usa

//checking for support
reg treat1 $x, robust
eststo
reg treat2 $x, robust
eststo
reg treat3 $x, robust
eststo

esttab, se

eststo clear

//calculating propensity score Notwo_bio
probit treat1 $x 
predict pscoreA, pr

//Nearest neighbor matching(& balancing test) Notwo_bio
psmatch2 treat1, pscore(pscoreA)
pstest $x, both

//after balance checks
gen idad_lhs2 = idad_lhs^2
gen idad_ghs2 = idad_ghs^2
gen imom_lhs2 = imom_lhs^2

probit treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 
predict pscore1, pr

//Nearest neighbor matching(& balancing test) Notwo_bio
psmatch2 treat1, pscore(pscore1)
pstest $x idad_lhs2 idad_ghs2 imom_lhs2, both

//graph before 
twoway (kdensity _pscore if _treated==1) (kdensity _pscore if _treated==0, ///
lpattern(dash)), legend( label( 1 "no two biological parents") ///
label( 2 "two biological parents" ) ) ///
xtitle("propensity scores BEFORE matching") name(before, replace)

//graph after
twoway (kdensity _pscore if _treated==1 [aweight=_weight]) ///
(kdensity _pscore if _treated==0 [aweight=_weight] ///
, lpattern(dash)), legend( label( 1 "no two biological parents") ///
label( 2 "two biological parents" )) ///
xtitle("propensity scores AFTER matching") name(after, replace)

//computing the effect without imposed common support restriction
teffects psmatch (afqt_89) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (hg_comp) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (marit_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (hhwage_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (rwage93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (netass_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit), atet
eststo
teffects psmatch (afqt_89) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo
teffects psmatch (hg_comp) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo
teffects psmatch (marit_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo
teffects psmatch (hhwage_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo
teffects psmatch (rwage93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo
teffects psmatch (netass_93) ///
(treat1 $x idad_lhs2 idad_ghs2 imom_lhs2, probit)
eststo

esttab, se
eststo clear

//computing the effect with imposed common support restriction
psmatch2 treat1, pscore(pscore1) outcome($y) common ate
reg afqt_89 treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo
reg hg_comp treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo
reg marit_93 treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo
reg hhwage_93 treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo
reg rwage93 treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo
reg netass_93 treat1 $x idad_lhs2 idad_ghs2 imom_lhs2 [aw = _weight]
eststo

esttab, se
eststo clear

//calculating propensity score Nobio_dad
probit treat2 $x 
predict pscoreB, pr

//Nearest neighbor matching(& balancing test) Nobio_dad
psmatch2 treat2, pscore(pscoreB)
pstest $x, both

//after balance checks
gen imom_ghs2 = imom_ghs^2
gen idad_lhs3 = idad_lhs^3

probit treat1 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2
predict pscore2, pr

//Nearest neighbor matching(& balancing test) Notwo_bio
psmatch2 treat2, pscore(pscore2)
pstest $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, both

//graph before 
twoway (kdensity _pscore if _treated==1) (kdensity _pscore if _treated==0, ///
lpattern(dash)), legend( label( 1 "no biological father") ///
label( 2 "biological father" ) ) ///
xtitle("propensity scores BEFORE matching") name(befored, replace)

//graph after
twoway (kdensity _pscore if _treated==1 [aweight=_weight]) ///
(kdensity _pscore if _treated==0 [aweight=_weight] ///
, lpattern(dash)), legend( label( 1 "no biological father") ///
label( 2 "biological father" )) ///
xtitle("propensity scores AFTER matching") name(afterd, replace)

//computing the effect without imposed common support restriction (nobio_dad)

teffects psmatch (afqt_89) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (hg_comp) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (marit_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (hhwage_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (rwage93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (netass_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit), atet
eststo
teffects psmatch (afqt_89) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo
teffects psmatch (hg_comp) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo
teffects psmatch (marit_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo
teffects psmatch (hhwage_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo
teffects psmatch (rwage93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo
teffects psmatch (netass_93) ///
(treat2 $x idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2, probit)
eststo

esttab, se
eststo clear

//computing the effect with imposed common support restriction (nobio_dad)

psmatch2 treat2, pscore(pscore2) outcome($y) common ate
reg afqt_89 treat2 $x ///
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2 [aw = _weight]
eststo
reg hg_comp treat2 $x ///
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2[aw = _weight]
eststo
reg marit_93 treat2 $x /// 
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2[aw = _weight]
eststo
reg hhwage_93 treat2 $x ///
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2[aw = _weight]
eststo
reg rwage93 treat2 $x ///
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2[aw = _weight]
eststo
reg netass_93 treat2 $x ///
idad_lhs2 idad_lhs3 idad_ghs2 imom_lhs2 imom_ghs2 [aw = _weight]
eststo

esttab, se
eststo clear

//calculating propensity score Nobio_dad
probit treat3 $x 
predict pscoreC, pr

//Nearest neighbor matching(& balancing test) Nobio_dad
psmatch2 treat3, pscore(pscoreC)
pstest $x, both

//after balance checks
gen cob_usa2 = cob_usa^2
gen isib2 = isib^2

//calculating propensity score Nobio_mom
probit treat3 $x cob_usa2 isib2
predict pscore3, pr

//Nearest neighbor matching(& balancing test) Nobio_mom
psmatch2 treat3, pscore(pscore3)
pstest $x cob_usa2 isib2, both


//before
twoway (kdensity _pscore if _treated==1) (kdensity _pscore if _treated==0, ///
lpattern(dash)), legend( label( 1 "no biological mom") ///
label( 2 "biological mom" ) ) ///
xtitle("propensity scores BEFORE matching") name(beforem, replace)

//after
twoway (kdensity _pscore if _treated==1 [aweight=_weight]) ///
(kdensity _pscore if _treated==0 [aweight=_weight] ///
, lpattern(dash)), legend( label( 1 "no biological mom") ///
label( 2 "biological mom" )) ///
xtitle("propensity scores AFTER matching") name(afterm, replace)

//computing the effect without imposed common support restriction (nobio_mom)

teffects psmatch (afqt_89) (treat3 $x cob_usa2 isib2, probit), atet
eststo
teffects psmatch (hg_comp) (treat3 $x cob_usa2 isib2, probit), atet
eststo
teffects psmatch (marit_93) (treat3 $x cob_usa2 isib2, probit), atet
eststo
teffects psmatch (hhwage_93) (treat3 $x cob_usa2 isib2, probit), atet
eststo
teffects psmatch (rwage93) (treat3 $x cob_usa2 isib2, probit), atet
eststo
teffects psmatch (netass_93) (treat3 $x cob_usa2 isib2, probit), atet
eststo

teffects psmatch (afqt_89) (treat3 $x cob_usa2 isib2, probit)
eststo
teffects psmatch (hg_comp) (treat3 $x cob_usa2 isib2, probit)
eststo
teffects psmatch (marit_93) (treat3 $x cob_usa2 isib2, probit)
eststo
teffects psmatch (hhwage_93) (treat3 $x cob_usa2 isib2, probit)
eststo
teffects psmatch (rwage93) (treat3 $x cob_usa2 isib2, probit)
eststo
teffects psmatch (netass_93) (treat3 $x cob_usa2 isib2, probit)
eststo

esttab, se
eststo clear

//computing the effect with imposed common support restriction (nobio_mom)

psmatch2 treat3, pscore(pscore3) outcome($y) common ate
reg afqt_89 treat3 $x cob_usa2 isib2 [aw = _weight]
eststo
reg hg_comp treat3 $x cob_usa2 isib2 [aw = _weight]
eststo
reg marit_93 treat3 $x cob_usa2 isib2 [aw = _weight]
eststo
reg hhwage_93 treat3 $x cob_usa2 isib2 [aw = _weight]
eststo
reg rwage93 treat3 $x cob_usa2 isib2 [aw = _weight]
eststo
reg netass_93 treat3 $x cob_usa2 isib2 [aw = _weight]
eststo

esttab, se
eststo clear
