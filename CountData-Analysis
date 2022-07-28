#Statistical Analysis of Categorical Count Data of Neuron Properties across Brain Layer and Neuron Type
#This code is run in SAS, but the same tests can also be done in R or Python

*Compare counts of qualitative property by layers in IN and PN;

*Upload csv files with interneuron and pyramidal neuron count values, combined into one table;
FILENAME REFFILE '/home/u59002560/Anton/Data/INCounts.csv';
FILENAME REFFILE2 '/home/u59002560/Anton/Data/PNCounts.csv';


*Input Dataset and Variables;
LIBNAME Anton "/home/u59002560/Anton";  
DATA Anton.INCounts;
	INFILE REFFILE dlm="," firstobs=2;
	*dlm for tab separated values, observations begin on 2nd row;
	INPUT INLayer CiliaPocket	RegularPocket	NormalBB 	IrregularBB	
	SmoothShape	BeadedShape	CombinationShape	Microtubules	Vesicles	
	Lysosome; 
	ln = log(Microtubules); run;

	
*proc print data=Anton.INCounts;
DATA Anton.PNCounts;
	INFILE REFFILE2 dlm="," firstobs=2;
	*dlm for tab separated values, observations begin on 2nd row;
	INPUT PNLayer CiliaPocket	RegularPocket	NormalBB 	IrregularBB	
	SmoothShape	BeadedShape	CombinationShape	Microtubules	Vesicles	
	Lysosome; run;

*proc print data=Anton.PNCounts;

*We use poisson regression to model count data;
PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL CiliaPocket = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL RegularPocket = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL NormalBB = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL IrregularBB = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL SmoothShape = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL BeadedShape = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL CombinationShape = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL Microtubules = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL Vesicles = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;

PROC GENMOD DATA=Anton.INCounts;
	* this time I add SCALE=PEARSON to address overdispersion;
	MODEL Lysosome = INLayer /DIST=POISSON LINK=LOG SCALE=PEARSON offset=ln;  
RUN;
