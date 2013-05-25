fig=figure;
aviobj=avifile('LorentzPlots.avi','FPS',5);
ec_mov=xlsread('Global_ectot','c3:ag225');
pop_mov=xlsread('Global_pop','c3:ag225');
ecpercap_mov=xlsread('Global_ecpercap','c3:ag225');
format long;

for j=1:11;
    ec=ec_mov(:,j);
pop=pop_mov(:,j);
ecpercap=ecpercap_mov(:,j);
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

plot(cm_popratio,cm_ecratio,'r*-',cm_popratio80,cm_ecratio80,'b*-',x4,y4,'k-');
xlim([0,1]);
ylim([0,1]);
h=legend('1980 G=0.66','Exponential Distribution G=0.5',2);
set(h,'Fontsize',16,'Fontweight','Bold');
t=title('Inequality in the global energy consumption');
t1=xlabel('Fraction of the world population');
t2=ylabel('Fraction of the world energy consumption');
set(t,'Fontsize',16,'Fontweight','Bold');
set(t1,'Fontsize',16,'Fontweight','Bold');
set(t2,'Fontsize',16,'Fontweight','Bold');
N(j)=getframe;
MOV=getframe(fig);
aviobj=addframe(aviobj,MOV);
end

for j=1:10;
    ec=ec_mov(:,j+11);
pop=pop_mov(:,j+11);
ecpercap=ecpercap_mov(:,j+11);
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

plot(cm_popratio,cm_ecratio,'r*-',cm_popratio90,cm_ecratio90,'y*-',cm_popratio80,cm_ecratio80,'b*-',x4,y4,'k-');
xlim([0,1]);
ylim([0,1]);
h=legend('1990 G=0.64','1980 G=0.66','Exponential Distribution G=0.5',2);
set(h,'Fontsize',16,'Fontweight','Bold');
t=title('Inequality in the global energy consumption');
t1=xlabel('Fraction of the world population');
t2=ylabel('Fraction of the world energy consumption');
set(t,'Fontsize',16,'Fontweight','Bold');
set(t1,'Fontsize',16,'Fontweight','Bold');
set(t2,'Fontsize',16,'Fontweight','Bold');
N(j)=getframe;
MOV=getframe(fig);
aviobj=addframe(aviobj,MOV);
end


for j=1:10;
ec=ec_mov(:,j+21);
pop=pop_mov(:,j+21);
ecpercap=ecpercap_mov(:,j+21);
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
ylim([0,1]);
h=legend('2010 G=0.55','2000 G=0.62','1990 G=0.64','1980 G=0.66','Exponential Distribution G=0.5',2);
set(h,'Fontsize',16,'Fontweight','Bold');
t=title('Inequality in the global energy consumption');
t1=xlabel('Fraction of the world population');
t2=ylabel('Fraction of the world energy consumption');
set(t,'Fontsize',16,'Fontweight','Bold');
set(t1,'Fontsize',16,'Fontweight','Bold');
set(t2,'Fontsize',16,'Fontweight','Bold');
N(j)=getframe;
MOV=getframe(fig);
aviobj=addframe(aviobj,MOV);
end

close(fig)
aviobj=close(aviobj)

 
