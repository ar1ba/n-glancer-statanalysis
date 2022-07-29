
*INPUT DATA;
data ciliarypocket; 	
    infile datalines delimiter=','; 
	input layer $ type $ cp regular;
	diff = cp - regular;
	ratio = cp / regular;
	label cp="Ciliary Pocket Count"
	      regular="Regular Pocket Count";
	datalines;
L1, Interneuron,    27, 	24
L2, Interneuron,    20, 	42
L3, Interneuron,    16, 	43
L4, Interneuron, 	23, 	34
L5, Interneuron,	22, 	29
L6, Interneuron, 	3, 	    7
L2, Pyramidal,  	13, 	42
L3, Pyramidal,  	17, 	39
L4, Pyramidal,  	27, 	23
L5, Pyramidal,  	28, 	22
L6, Pyramidal,  	42, 	56
;

*Two Way ANOVA for CP:Regular difference and ratio;
proc anova data=ciliarypocket;
class type;
model diff = type;
proc anova data=ciliarypocket;
class type;
model ratio = type;
run;

*Test comparison analysis for ciliary pocket count against neuron type and regular pocket;	
proc glm data=ciliarypocket;
   class type;
   model cp = type regular type*regular / solution;
   lsmeans type / stderr pdiff cov out=adjmeans;
run;

*Test comparison analysis for regular pocket count against neuron type and ciliary pocket;
proc glm data=ciliarypocket;
   class type;
   model regular = type cp type*cp / solution;
   lsmeans type / stderr pdiff cov out=adjmeans;
run;



*INPUT DATA;
data basalbody; 	
    infile datalines delimiter=','; 
	input type $ normal irregular;	
	ratio = normal / irregular;
	diff = normal - irregular;
	datalines;
Interneuron,	43,	8
Interneuron,	55,	7
Interneuron,	46,	13
Interneuron,	42,	15
Interneuron,	46,	5
Interneuron,	10,	0
Pyramidal,	34,	21
Pyramidal,	44,	12
Pyramidal,	45,	5
Pyramidal,	50,	0
Pyramidal,	81,	17
;


*Two Way ANOVA for Normal:Irregular difference and ratio;
proc anova data=basalbody;
class type;
model diff = type;
proc anova data=basalbody;
class type;
model ratio = type;
run;
	
proc glm data=basalbody;
   class type;
   model normal = type irregular type*irregular / solution;
   lsmeans type / stderr pdiff cov out=adjmeans;
run;

proc glm data=basalbody;
   class type;
   model irregular = type normal type*normal / solution;
   lsmeans type / stderr pdiff cov out=adjmeans;
run;



*INPUT DATA;
data ciliashape; 	
    infile datalines delimiter=','; 
	input Type $	Smooth	Beaded	Combination;	
	datalines;
Interneuron,	39,	2,	10
Interneuron,	23,	9,	30
Interneuron,	18,	14,	27
Interneuron,	10,	21,	26
Interneuron,	12,	11,	28
Interneuron,	2,	3,	5
Pyramidal,	31,	1,	23
Pyramidal,	25,	0,	31
Pyramidal,	28,	1,	21
Pyramidal,	12,	3,	35
Pyramidal,	47,	5,	46
;

*Two way anova across type for each cilia shape;
proc glm data=ciliashape;
   class Type;
   model Smooth	Beaded Combination = Type;
   manova h=_all_ / printe printh;
run;

*beaded shape seems to have a statistically significant difference - lets run wilcoxon-mann-whitney test;
proc NPAR1WAY data=ciliashape wilcoxon;
class Type;
var Beaded;
run;

*one way anova split bw neuron type;
*first, Interneurons;

*INPUT DATA;
data ciliashapeIN; 	
    infile datalines delimiter=','; 
	input Type $	Smooth	Beaded	Combination;	
	datalines;
Interneuron,	39,	2,	10
Interneuron,	23,	9,	30
Interneuron,	18,	14,	27
Interneuron,	10,	21,	26
Interneuron,	12,	11,	28
Interneuron,	2,	3,	5
;
proc ttest data=ciliashapein plots= summary;
   var Smooth	Beaded	Combination;
run;

*next, pyramidal;

*INPUT DATA;
data ciliashapePN; 	
    infile datalines delimiter=','; 
	input Type $	Smooth	Beaded	Combination;	
	datalines;
Pyramidal,	31,	1,	23
Pyramidal,	25,	0,	31
Pyramidal,	28,	1,	21
Pyramidal,	12,	3,	35
Pyramidal,	47,	5,	46
;
proc ttest data=ciliashapePN plots= summary;
   var Smooth	Beaded	Combination;
run;

