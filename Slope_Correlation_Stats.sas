*below is code written to assess the slope and correlation estimates for specific regressions of interest;

PROC REG DATA=NsiAxonE;
   title 'Nsi vs. Total Excitatory Axonal Contacts in All Neurons';
	MODEL AxonE=Nsi / clb;
   ods output ParameterEstimates=PE; *saves the ParameterEstimates table to the PE data set;
run;
data _null_; *The following DATA step saves int/slope estimates into macro variables;
   set PE; *In the PE data set, the ESTIMATE variable contains the parameter estimates; 
   if _n_ = 1 then call symput('Int', put(estimate, BEST6.));   *1st row contains intercept estimate;
   else          call symput('Slope', put(estimate, BEST6.)); *2nd row contains intercept estimate;
run;

PROC SGPLOT DATA=NsiAxonE;
   label Nsi="Number of Incoming Synaptic Contacts";
   label AxonE="Total Excitatory Axonal Contacts";
	SCATTER X=AxonE Y=NSi / transparency=0.7;
	REG X=AxonE Y=NSi  / clm cli;
	inset "Intercept = &Int" "Slope = &Slope" / position=topright;
run;



PROC REG DATA=SpAxonE;
   title 'Sp vs. Total Excitatory Axonal Contacts in All Neurons';
	MODEL AxonE=Sp / clb;
   ods output ParameterEstimates=PE; *saves the ParameterEstimates table to the PE data set;
run;
data _null_; *The following DATA step saves int/slope estimates into macro variables;
   set PE; *In the PE data set, the ESTIMATE variable contains the parameter estimates; 
   if _n_ = 1 then call symput('Int', put(estimate, BEST6.));   *1st row contains intercept estimate;
   else          call symput('Slope', put(estimate, BEST6.)); *2nd row contains intercept estimate;
run;

PROC SGPLOT DATA=SpAxonE;
   label Sp="Spininess";
   label AxonE="Total Excitatory Axonal Contacts";
	SCATTER X=AxonE Y=Sp / transparency=0.7;
	REG X=AxonE Y=Sp  / clm cli;
	inset "Intercept = &Int" "Slope = &Slope" / position=topright;
run;
