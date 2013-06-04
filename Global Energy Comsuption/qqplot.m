fig=figure;
aviobj=avifile('QQ.avi','FPS',5);
ec_mov=xlsread('Global_ectot','c3:ag225');
pop_mov=xlsread('Global_pop','c3:ag225');
ecpercap_mov=xlsread('Global_ecpercap','c3:ag225');
year_mov=xlsread('Global_ectot','c1:ag1');
format long;

for j=1:31;
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

x4=cm_popratio;
y4=x4+(1-x4).*log(1-x4);
year=1979+j;
qqplot(y4,cm_ecratio);
axis([0,1,0,1]);
timer=text(0.5,0.8,num2str(year));
set(timer,'Fontsize',20,'Fontweight','Bold');
t=title('Q-Q Plot');
t1=xlabel('Theoretical Exponential Distribution');
t2=ylabel('Annual Total Energy Consumption');
set(t,'Fontsize',16,'Fontweight','Bold');
set(t1,'Fontsize',16,'Fontweight','Bold');
set(t2,'Fontsize',16,'Fontweight','Bold');
k=1979+j;
saveas(gcf,num2str(year));
N(j)=getframe;
MOV=getframe(fig);
aviobj=addframe(aviobj,MOV);
end
close(fig)
aviobj=close(aviobj)