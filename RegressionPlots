*upload respective datasets onto SAS;


ods pdf file='/home/u59002560/Anton/RegressionPlots.pdf';
ods graphics on;

proc sgplot data=spIN noautolegend;
   title 'Sp vs. Cilia Length in Interneurons';
   reg y=cilialength x=sp / clm markerattrs=(Color=Grey) curvelabelattrs=(Color=Black);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NspIN noautolegend;
   title 'NSp vs. Cilia Length in Interneurons';
   reg y=cilialength x=Nsp / clm markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label NSp="Number of dendritic spine skeleton nodes";
   label cilialength="Cilia Length (um)";
   yaxis max=20;
   run;
   
proc sgplot data=NsiAll noautolegend;
   title 'NSi vs. Cilia Length in All Neurons';
   reg y=cilialength x=Nsi / cli cliattrs=(Color=Grey) markerattrs=(Color=Blue) curvelabelattrs=(Color=Blue);
   label NSi="Number of incoming synapses";
   label cilialength="Cilia Length (um)";
   yaxis max=20;
   run;
   
proc sgplot data=NciAll noautolegend;
   title 'Nci vs. Cilia Length in All Neurons';
   reg y=cilialength x=Nci / cli cliattrs=(Color=Grey) markerattrs=(Color=Blue) curvelabelattrs=(Color=Blue);
   label Nci="Number of cilium skeleton nodes";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=spPN noautolegend;
   title 'Sp vs. Cilia Length in Pyramidal Neurons';
   reg y=cilialength x=sp / cli cliattrs=(Color=Grey) markerattrs=(Color=Blue) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label cilialength="Cilia Length (um)";
   run;
   
proc sgplot data=NspPN noautolegend;
   title 'NSp vs. Cilia Length in Pyramidal Neurons';
   reg y=cilialength x=Nsp / cli cliattrs=(Color=Grey) markerattrs=(Color=Blue) curvelabelattrs=(Color=Blue);
   label NSp="Number of dendritic spine skeleton nodes";
   label cilialength="Cilia Length (um)";
   yaxis max=20;
   run;
   
proc sgplot data=SmoothAll;
   title 'Smooth Shape vs. Sp in All Neurons';
   title2 '0 = No Smooth Shape, 1 = Smooth Shape';
   reg y=Sp x=Smooth / cli cliattrs=(clifillattrs=(color=grey)) markerattrs=(Color=Grey) curvelabelattrs=(Color=Blue);
   label Sp="Spininess (Ratio of spines to dendrite skeleton nodes)";
   label Smooth="Smooth Shape";
   yaxis max=0.4;
   run;

ods pdf close;

