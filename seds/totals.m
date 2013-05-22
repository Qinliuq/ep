#!/usr/bin/octave -qf

%use_all_btu = csvread("use_all_btu.csv");

years = 1960:2010;

tpopp = csvread("tpopp.csv")(2:end,:) * 1000;
tetcb = csvread("tetcb.csv")(2:end,:) * 1000;

percap = tetcb./tpopp;


%figure
%plot(years,flipud(rot90(tpopp)))

%figure
%plot(years,flipud(rot90(tetcb)))

figure; plot(years,flipud(rot90(percap)))

printf("Press any key to exit...\n");
pause;
