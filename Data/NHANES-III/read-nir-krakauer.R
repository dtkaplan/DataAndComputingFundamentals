# Read the NHANES-III data from Nir Krakauer's files
# See DT Kaplan's gmail: https://mail.google.com/mail/u/0/?ui=2&shva=1#inbox/13bf9448a0c59ba8

library(survival)
# library(pspline) 
# library(survey)
nhanes <- read.table("http://www-ce.ccny.cuny.edu/nir/misc/nhanes_data.txt", header = FALSE, sep = " ")
names(nhanes)[2] <- 'seqn' # for matching to NHANES mortality data
names(nhanes)[3] <- 'sex' # 2 is women
names(nhanes)[4] <- 'age' # in years
names(nhanes)[5] <- 'preg' # 1 means pregnant
names(nhanes)[6] <- 'eth' #ethnicity. 1=Mexican American, 2=Other Hispanic, 3=Non-Hispanic White, 4=Non-Hispanic Black, 5 = Other Race - Including Multi-Racial, .=Missing
names(nhanes)[7] <- 'd' # died.  Alive=0. 2=Cardiovascular cause of death. 1=other death
names(nhanes)[8] <- 'm' # Months of follow up?
names(nhanes)[9] <- 'smoke' # 1 means smoker
names(nhanes)[10] <- 'diab' # 1 means diabetic
names(nhanes)[11] <- 'hgt' #height (in meters)
names(nhanes)[12] <- 'wgt' #weight (in kilos)
names(nhanes)[13] <- 'wst' #waist circumfernce (in meters)
names(nhanes)[14] <- 'wci' #ABSI
names(nhanes)[15] <- 'bmi' #BMI
names(nhanes)[16] <- 'ptf' # percent trunk fat
names(nhanes)[17] <- 'tf'  # mass of trunk fat
names(nhanes)[18] <- 'lf'  # limb fat
names(nhanes)[19] <- 'll'  # limb lean tissue
names(nhanes)[20] <- 'lbmi' # lean-tissue only BMI
names(nhanes)[21] <- 'fbmi' # fat-only BMI
names(nhanes)[22] <- 'bbmi' # bone BMI
names(nhanes)[23] <- 'pf'   # percent fat
names(nhanes)[24] <- 'bmd'  # bone mineral density
names(nhanes)[25] <- 'fmhm_other' # Framingham risk score
names(nhanes)[26] <- 'hdl'  #HDL
names(nhanes)[27] <- 'chol' #Cholesterol
names(nhanes)[28] <- 'bps'  # Systolic blood pressure, mmHg
names(nhanes)[29] <- 'bpd'  # Diastolic blood pressure, mmHg
names(nhanes)[30] <- 'income' # ratio of family income to poverty threshold. 5 is ratio greater than or equal to 5
names(nhanes)[31] <- 'zhgt' # z-scores, Stratified by Age and Sex
names(nhanes)[32] <- 'zwgt'
names(nhanes)[33] <- 'zwst'
names(nhanes)[34] <- 'zwci' #z-score for ABSI
names(nhanes)[35] <- 'zbmi'
names(nhanes)[36] <- 'zptf'
names(nhanes)[37] <- 'ztf'
names(nhanes)[38] <- 'zlf'
names(nhanes)[39] <- 'zll'
names(nhanes)[40] <- 'zlbmi'
names(nhanes)[41] <- 'zfbmi'
names(nhanes)[42] <- 'zbbmi'
names(nhanes)[43] <- 'zpf'
names(nhanes)[44] <- 'zbmd'
names(nhanes)[45] <- 'zfmhm_other'
names(nhanes)[46] <- 'zhdl'
names(nhanes)[47] <- 'zchol'
names(nhanes)[48] <- 'zbps'
names(nhanes)[49] <- 'zbpd'
names(nhanes)[50] <- 'zincome'
names(nhanes)[51] <- 'pw'  # a population weight. adding it up over all cases gives roughly the US population
names(nhanes)[52] <- 'psu' # primary sampling unit
names(nhanes)[53] <- 'stratum' # sampling stratum
names(nhanes)[54] <- 'zwh' # z-score of waist/height ratio
