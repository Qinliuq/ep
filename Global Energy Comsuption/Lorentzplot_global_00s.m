format long;
ec=xlsread('Global_ectot','ag3:ag225');
pop=xlsread('Global_pop','ag3:ag225');
ecpercap=xlsread('Global_ecpercap','ag3:ag225');
data=[ecpercap,ec,pop];
lorentz=sortrows(data,1);
s_ec=lorentz(:,2);
s_pop=lorentz(:,3);
ecratio=s_ec/sum(s_ec);
popratio=s_pop/sum(s_pop);
cm_ecratio=0;
cm_popratio=0;
for i=1:223;
    cm_ecratio(i,1)=sum(ecratio(1:i));
end
disp(cm_ecratio)
for i=1:223;
    cm_popratio(i,1)=sum(popratio(1:i));
end
disp(cm_popratio)

x4=0:0.0001:1;
y4=x4+(1-x4).*log(1-x4);


plot(cm_popratio,cm_ecratio,'r*-',cm_popratio00,cm_ecratio00,'g*-',cm_popratio90,cm_ecratio90,'y*-',cm_popratio80,cm_ecratio80,'b*-',x4,y4,'k-');
xlim([0,1]);
ylim([0,1])
