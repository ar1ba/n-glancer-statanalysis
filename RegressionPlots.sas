data spIN;
 infile datalines delimiter=",";
   input sp cilialength;
   datalines;
0.0720961317420005,	9.2
0.288267016410827,	14.4
0.0731472596526146,	6.4
*paste rest of delimited data separated between sp (N) and cilia length #s;
;
	
data NspIN;
 infile datalines delimiter=",";
   input Nsp cilialength;
   datalines;
54, 9.2
855, 14.4
76, 6.4
*paste rest of delimited data separated between Nsp (IN) and cilia length #s;
;


data NsiAll;
 infile datalines delimiter=",";
   input NSi cilialength;
   datalines;
681,	9.2
1856,	14.4
1143,	6.4
*paste rest of delimited data separated between Nsi (all neurons) and cilia length #s;
;

data NciAll;
 infile datalines delimiter=",";
   input Nci cilialength;
   datalines;
31,	9.2
8,	14.4
5,	6.4
*paste rest of delimited data separated between Nci (all neurons) and cilia length #s;
;

data spPN;
 infile datalines delimiter=",";
   input sp cilialength;
   datalines;
0.387915313243865,	6.6
0.330402642488479,	8.1
0.373241394758224,	10
*paste rest of delimited data separated between sp (PN) and cilia length #s;
;

data NspPN;
 infile datalines delimiter=",";
   input Nsp cilialength;
   datalines;
10426,	6.6
7328,	8.1
10665,	10
*paste rest of delimited data separated between Nsp (PN) and cilia length #s;
;

data SmoothAll;
 infile datalines delimiter=",";
   input Smooth Sp;
   datalines;
1,	0.07209613174
1,	0.2882670164
1,	0.07314725965
*paste rest of delimited data separated between smooth (all neurons) and sp (all neurons) #s;
;

data SpTotal;
 infile datalines delimiter=",";
   input Sp Total;
   datalines;
0.08888889104,	11
0.094218418,	26
0.1252847314,	10
*paste rest of delimited data separated between sp (all neurons) and total contact (all neurons) #s;
;

data SpAxonI;
 infile datalines delimiter=",";
   input Sp AxonI;
   datalines;
0.08888889104,	6
0.094218418,	13
0.1252847314,	5
0.1252847314,	10
*paste rest of delimited data separated between sp (all neurons) and inhibitory axonal contact (all neurons) #s;
;

data SpAxonE;
 infile datalines delimiter=",";
   input Sp AxonE;
   datalines;
0.08888889104,	1
0.094218418,	11
0.1252847314,	4
0.1252847314,	10
*paste rest of delimited data separated between sp (all neurons) and excitatory axonal contact (all neurons) #s;
;

data SpAxon;
 infile datalines delimiter=",";
   input Sp Axon;
   datalines;
0.08888889104,	12
0.094218418,	25
0.1252847314,	9
0.1252847314,	10
*paste rest of delimited data separated between sp (all neurons) and total axonal contact (all neurons) #s;
;

data SpDendrite;
 infile datalines delimiter=",";
   input Sp Dendrite;
   datalines;
0.08888889104,	1
0.094218418,	2
0.1252847314,	0
0.1252847314,	10
*paste rest of delimited data separated between sp (all neurons) and total dendritic contact (all neurons) #s;
;

data NsiDendrite;
 infile datalines delimiter=",";
   input Nsi Dendrite;
   datalines;
101,	1
422,	2
454,	0
*paste rest of delimited data separated between Nsi (all neurons) and total dendritic contact (all neurons) #s;
;
   
data NsiTotal;
 infile datalines delimiter=",";
   input Nsi Total;
   datalines;  
101,	11
422,	26
454,	10
*paste rest of delimited data separated between Nsi (all neurons) and total contact (all neurons) #s;
;

data NsiAxonI;
 infile datalines delimiter=",";
   input Nsi AxonI;
   datalines;  
101,	6
422,	13
454,	5
*paste rest of delimited data separated between Nsi (all neurons) and inhibitory axonal contact (all neurons) #s;
;

data NsiAxonE;
 infile datalines delimiter=",";
   input Nsi AxonE;
   datalines;
101,	1
422,	11
454,	4
*paste rest of delimited data separated between Nsi (all neurons) and excitatory axonal contact (all neurons) #s;
;
   
data NsiAxon;
 infile datalines delimiter=",";
   input Nsi Axon;
   datalines;
101,	12
422,	25
454,	9
*paste rest of delimited data separated between Nsi (all neurons) and total axonal contact (all neurons) #s;
;
   

*now use proc sgplot to create regression plots and save as a pdf;
ods pdf file='/home/u59002560/Anton/RegressionPlots.pdf';
ods graphics on;

proc sgplot data=spIN noautolegend;
   title 'Sp vs. Cilia Length in Interneurons';
   reg y=sp x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Black);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NspIN noautolegend;
   title 'NSp vs. Cilia Length in Interneurons';
   reg y=Nsp x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label NSp="Number of dendritic spine skeleton nodes";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NsiAll noautolegend;
   title 'NSi vs. Cilia Length in All Neurons';
   reg y=Nsi x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label NSi="Number of incoming synapses";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NciAll noautolegend;
   title 'Nci vs. Cilia Length in All Neurons';
   reg y=Nci x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nci="Number of cilium skeleton nodes";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=spPN noautolegend;
   title 'Sp vs. Cilia Length in Pyramidal Neurons';
   reg y=sp x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NspPN noautolegend;
   title 'NSp vs. Cilia Length in Pyramidal Neurons';
   reg y=Nsp x=cilialength / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label NSp="Number of dendritic spine skeleton nodes";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=SmoothAll;
   title 'Smooth Shape vs. Sp in All Neurons';
   title2 '0 = No Smooth Shape, 1 = Smooth Shape';
   reg y=Sp x=Smooth / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label Smooth="Smooth Shape";
   yaxis max=0.4;
   run;

proc sgplot data=Sptotal noautolegend;
   title 'Sp vs. Total Contacts in All Neurons';
   reg y=sp x=total / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label total="Total Contacts";
   run;

proc sgplot data=SpAxonI noautolegend;
   title 'Sp vs. Total Inhibitory Axonal Contacts in All Neurons';
   reg y=sp x=AxonI / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label AxonI="Total Inhibitory Axonal Contacts";
   run;
   
proc sgplot data=SpAxonE noautolegend;
   title 'Sp vs. Total Excitatory Axonal Contacts in All Neurons';
   reg y=sp x=AxonE / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label AxonE="Total Excitatory Axonal Contacts";
   run;
   
proc sgplot data=SpAxon noautolegend;
   title 'Sp vs. Total Axonal Contacts in All Neurons';
   reg y=sp x=Axon / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label Axon="Total Axonal Contacts";
   run;
   
proc sgplot data=SpDendrite noautolegend;
   title 'Sp vs. Total Dendritic Contacts in All Neurons';
   reg y=sp x=Dendrite / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label Dendrite="Total Dendritic Contacts";
   run;
   
proc sgplot data=Nsitotal noautolegend;
   title 'Nsi vs. Total Contacts in All Neurons';
   reg y=Nsi x=total / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nsi="Number of Incoming Synaptic Contacts";
   label total="Total Contacts";
   run;
   
proc sgplot data=NsiAxonI noautolegend;
   title 'Nsi vs. Total Inhibitory Axonal Contacts in All Neurons';
   reg y=Nsi x=AxonI / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nsi="Number of Incoming Synaptic Contacts";
   label AxonI="Total Inhibitory Axonal Contacts";
   run;

proc sgplot data=NsiAxonE noautolegend;
   title 'Nsi vs. Total Excitatory Axonal Contacts in All Neurons';
   reg y=Nsi x=AxonE / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nsi="Number of Incoming Synaptic Contacts";
   label AxonE="Total Excitatory Axonal Contacts";
   run;
   
proc sgplot data=NsiAxon noautolegend;
   title 'Nsi vs. Total Axonal Contacts in All Neurons';
   reg y=Nsi x=Axon / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nsi="Number of Incoming Synaptic Contacts";
   label Axon="Total Axonal Contacts";
   run;
   
proc sgplot data=NsiDendrite noautolegend;
   title 'Nsi vs. Total Dendritic Contacts in All Neurons';
   reg y=Nsi x=Dendrite / cli cliattrs=(clilineattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Nsi="Number of Incoming Synaptic Contacts";
   label Dendrite="Total Dendritic Contacts";
   run;
   
   

ods pdf close;

