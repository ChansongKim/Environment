

************************** CCES 2016 *********************************

** DV **
gen pro_envi=((CC16_333a + CC16_333b + CC16_333c + CC16_333d)/4)

** Number of childs under 18 **
recode child18num (1=1)(2=2)(3=3)(4= 4)(5=5)(6/20=6 "more6"), gen(childs18_re)
recode child18 (1=1 "yes")(2=0 "no"), gen(child18_ox)
gen child_n=.
replace child_n=0 if child18_ox==0
replace child_n=1 if childs18_re ==1
replace child_n=2 if childs18_re ==2
replace child_n=3 if childs18_re ==3
replace child_n=4 if childs18_re ==4
replace child_n=5 if childs18_re ==5
replace child_n=6 if childs18_re ==6
recode child_n (0=0 "no child")(1=1)(2=2)(3=3)(4=4)(5 6 = 5 "more5"), gen(numofchild)
recode numofchild (0=0)(1=1)(2=2)(3=3)(4 5 =4 ), gen(noc)

** Edu **
recode educ (1 2 = 0 "low")(3 4 5 6 = 1 "high"), gen(edu_re)

** Homemaker **
recode employ (1 2 3 4 5 6 8 9 = 0 )(7=1 ), gen(homemaker)

** Family income **
xtile fainc_re=faminc, nq(3)
xtile fainc2_re=faminc, nq(5)


** Female **
recode gender (1=0)(2=1), gen(female)

** Ideology **
recode ideo5 (1 2 = 1)(3  =2)(4 5 = 3), gen(ideo_re)

** PID(republican) **
recode pid7 (1 2 3 4= 0 "other")(5 6 7 = 1 "repub"), gen(pid2_re)

** Marital status **
recode marstat (1 =1 "married")(2 3 4 6 =2 "other")(5= 3 "single"), gen(marry_re)

** Religion **
recode religpew (1=1)(2 3 4 5 6 7 8 9 10 11 12 = 0), gen(protestant_re)

** Attenance religion **
recode pew_churatd (7=.)(6 5 =1 "low")(4 3 =2 " middle")( 2 1 = 3 "high"), gen(relirate_re)
recode pew_churatd (7=.)(6=1)(5=2)(4=3)(3=4)(2=5)(1=6), gen(relirate2_re)

** Age **
gen birth=(2016-birthyr)
recode birth (18/29 = 2 )(30/39=3)(40/49=4)(50/59=5)(60/69=6)(70/99=7), gen(age_re)

** Race(White) **
recode race (1=1 "white")(2 3 4 5 6 7 8 = 0 "other"), gen(white)

** Region(West) **
recode inputstate ( 30 56 16 8 35 49 4 32 53 41 6 = 1 "west"), gen(west)
recode west (1=1 "west")( 2/55 = 0 "other"), gen(west_re)

** Main model **
reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust


** outreg **
reg pro_envi noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word replace

reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word append

** graph **
reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
margins, at( noc =(0(1)4)) atmeans
marginsplot, recast(line) recastci(rarea)


************************** CCES 2018 *********************************

** DV **

recode CC18_415b (0=1)(1=0), gen(CC18_415b_re)
gen pro_envi=((CC18_415a + CC18_415b_re + CC18_415c + CC18_415d)/4)

** Number of childs under 18 **
recode child18num (1=1)(2=2)(3=3)(4= 4)(5=5)(6/20=6 "more6"), gen(childs18_re)
recode child18 (1=1 "yes")(2=0 "no"), gen(child18_ox)
gen child_n=.
replace child_n=0 if child18_ox==0
replace child_n=1 if childs18_re ==1
replace child_n=2 if childs18_re ==2
replace child_n=3 if childs18_re ==3
replace child_n=4 if childs18_re ==4
replace child_n=5 if childs18_re ==5
replace child_n=6 if childs18_re ==6
recode child_n (0=0 "no child")(1=1)(2=2)(3=3)(4=4)(5 6 = 5 "more5"), gen(numofchild)
recode numofchild (0=0)(1=1)(2=2)(3=3)(4 5 =4 ), gen(noc)

** Edu **
recode educ (1 2 = 0 "low")(3 4 5 6 = 1 "high"), gen(edu_re)

** Homemaker **
recode employ (1 2 3 4 5 6 8 9 = 0 )(7=1 ), gen(homemaker)

** Family income **
recode faminc_new 97=., gen(faminc)
xtile fainc_re=faminc, nq(3)

** Female **
recode gender (1=0)(2=1), gen(female)

** Ideology **
recode ideo5 (1 2 = 1)(3  =2)(4 5 = 3), gen(ideo_re)

** Marital status **
recode marstat (1 =1 "married")(2 3 4 6 =2 "other")(5= 3 "single"), gen(marry_re)

** Religion **
recode religpew (1=1)(2 3 4 5 6 7 8 9 10 11 12 = 0), gen(protestant_re)

** Attenance religion **
recode pew_churatd (7=.)(6 5 =1 "low")(4 3 =2 " middle")( 2 1 = 3 "high"), gen(relirate_re)
recode pew_churatd (7=.)(6=1)(5=2)(4=3)(3=4)(2=5)(1=6), gen(relirate2_re)

** Age **
gen birth=(2018-birthyr)
recode birth (18/29 = 2 )(30/39=3)(40/49=4)(50/59=5)(60/69=6)(70/99=7), gen(age_re)

** Race(White) **
recode race (1=1 "white")(2 3 4 5 6 7 8 = 0 "other"), gen(white)

** Region(West) **
recode inputstate ( 30 56 16 8 35 49 4 32 53 41 6 = 1 "west"), gen(west)
recode west (1=1 "west")( 2/55 = 0 "other"), gen(west_re)

** outreg **
reg pro_envi noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word replace

reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word append

** graph **
reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
margins, at( noc =(0(1)4)) atmeans
marginsplot, recast(line) recastci(rarea)


************************** CCES 2020 *********************************


** DV **
gen pro_envi=((CC20_333a + CC20_333b + CC20_333c + CC20_333d)/4)

** Number of childs under 18 **
recode child18num (1=1)(2=2)(3=3)(4= 4)(5=5)(6/20=6 "more6"), gen(childs18_re)
recode child18 (1=1 "yes")(2=0 "no"), gen(child18_ox)
gen child_n=.
replace child_n=0 if child18_ox==0
replace child_n=1 if childs18_re ==1
replace child_n=2 if childs18_re ==2
replace child_n=3 if childs18_re ==3
replace child_n=4 if childs18_re ==4
replace child_n=5 if childs18_re ==5
replace child_n=6 if childs18_re ==6
recode child_n (0=0 "no child")(1=1)(2=2)(3=3)(4=4)(5 6 = 5 "more5"), gen(numofchild)

** Edu **
recode educ (1 2 = 0 "low")(3 4 5 6 = 1 "high"), gen(edu_re)

** Homemaker **
recode employ (1 2 3 4 5 6 8 9 = 0 )(7=1 ), gen(homemaker)

** Family income **
recode faminc_new 97=., gen(faminc)
xtile fainc_re=faminc, nq(3)


** Female **
recode gender (1=0)(2=1), gen(female)

** Ideology **
recode ideo5 (1 2 = 1)(3  =2)(4 5 = 3), gen(ideo_re)

** Marital status **
recode marstat (1 =1 "married")(2 3 4 6 =2 "other")(5= 3 "single"), gen(marry_re)

** Religion **
recode religpew (1=1)(2 3 4 5 6 7 8 9 10 11 12 = 0), gen(protestant_re)

** Attenance religion **
recode pew_churatd (7=.)(6 5 =1 "low")(4 3 =2 " middle")( 2 1 = 3 "high"), gen(relirate_re)
recode pew_churatd (7=.)(6=1)(5=2)(4=3)(3=4)(2=5)(1=6), gen(relirate2_re)
** Age **
gen birth=(2020-birthyr)
recode birth (18/29 = 2 )(30/39=3)(40/49=4)(50/59=5)(60/69=6)(70/99=7), gen(age_re)


** Race(White) **
recode race (1=1 "white")(2 3 4 5 6 7 8 = 0 "other"), gen(white)

** Region(West) **
recode inputstate ( 30 56 16 8 35 49 4 32 53 41 6 = 1 "west"), gen(west)
recode west (1=1 "west")( 2/55 = 0 "other"), gen(west_re)


** Main model **
reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust


** outreg **
reg pro_envi noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word replace

reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
outreg2 using roh, alpha(0.001, 0.01, 0.05) dec(2) ctitle(model1) addstat("Adj. R-squared", e(r2_a)) word append

** graph **
reg pro_envi noc c.noc##c.noc female  edu_re age_re fainc2_re fulltime marry2_re white ib2.ideo_re ib2.pid_3  protestant_re relirate2_re west_re, robust
margins, at( noc =(0(1)4)) atmeans
marginsplot, recast(line) recastci(rarea)




