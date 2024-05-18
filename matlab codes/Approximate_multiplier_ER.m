clc
clear all
close all
ER=0;
RED=[];
n=4;
samples=10^5;
i= randi([0,2^n-1],1,samples);
j= randi([0,2^n-1],1,samples); 
    for l=1:1:samples
        a_low= bitget(i(l),2:-1:1);
        b_low= bitget(j(l),2:-1:1);
        a_high= bitget(i(l),4:-1:3);
        b_high= bitget(j(l),4:-1:3);
        par0= par_pro(a_low,b_low);
        par1= par_pro(a_high,b_low);
        par2= par_pro(a_low,b_high);
        par3= par_pro(a_high,b_high);
        par0_num= bin2dec(par0);
        par1_num= bin2dec(strcat(par1,'00'));
        par2_num= bin2dec(strcat(par2,'00'));
        par3_num= bin2dec(strcat(par3,'0000'));
        mul_tot= par0_num + par1_num + par2_num + par3_num;
        if mul_tot ~= i(l)*j(l)
            ER=ER+1;
            RED(ER)=abs(mul_tot-(i(l)*j(l)))/(i(l)*j(l));
        end
    end

y=sprintf('The MRED is %d (log10)',log10(mean(RED)));
x=sprintf('The ER is %d',ER*100/samples);
z=sprintf('The accuracy is %d',100-(ER*100/samples));
disp(y); disp(x); disp(z);


function p= par_pro(a,b)
    x1= a(1) & b(1);
    x2= a(2) & b(1) | a(1) & b(2);
    x3= a(2) & b(2);
    x=[x1 x2 x3];
    p=strrep(num2str(x),' ','');
end