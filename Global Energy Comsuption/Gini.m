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

a=0;
b=0;
c=0;
n=223;
for i=1:n-1;
    a(i+1,1)=cm_ecratio(i,1)+cm_ecratio(i+1,1);
end
a(1,1)=cm_ecratio(1,1);
disp(a);
for i=1:n-1;
    b(i+1,1)=cm_popratio(i+1,1)-cm_popratio(i,1);
end
b(1,1)=cm_popratio(1,1);
disp(b);
c=a'*b/2;
disp(c);
Gini_(j)=(.5-c)/.5;
disp(Gini_);
year(j)=1979+j;
end
y4=0.5;
x4=1979:0.001:2011;
plot(year,Gini_,'r*',x4,y4,'k-');
axis([1979,2011,0.45,0.7]);
t=title('Gini Coefficient in Global Energy Consumption');
t1=xlabel('Year');
t2=ylabel('Gini Coefficient');
set(t,'Fontsize',16,'Fontweight','Bold');
set(t1,'Fontsize',16,'Fontweight','Bold');
set(t2,'Fontsize',16,'Fontweight','Bold');
grid on;
