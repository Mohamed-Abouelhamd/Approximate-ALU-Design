clc
clear all
close all
ER=0;
RED=[];
n=16;
m=2;
samples=10^5;
i= randi([0,2^n-1],1,samples);
j= randi([0,2^n-1],1,samples);
lsb_zeros= repmat('0', 1, m);
    for l=1:1:samples
        a= dec2bin(i(l),n);
        b= dec2bin(j(l),n);
        a_low= bitget(i(l),m:-1:1);
        b_low= bitget(j(l),m:-1:1);
        a_high= a(1:n-m);
        b_high= b(1:n-m);
        a_num= bin2dec(strcat(a_high,lsb_zeros));
        b_num= bin2dec(strcat(b_high,lsb_zeros));
        s_low= bitor(a_low,b_low);
        carry_in =(2^m)*double((a_low(1)&b_low(1)));
        s_low_num= bin2dec((strrep(num2str(s_low),' ','')));
        s_high_num = a_num +b_num;
        s_tot= s_high_num + s_low_num + carry_in; 
        if s_tot ~= i(l)+j(l)
            ER=ER+1;
            RED(ER)=abs(s_tot-(i(l)+j(l)))/(i(l)+j(l));
        end
    end

y=sprintf('The MRED is %d (log10)',log10(mean(RED)));
x=sprintf('The ER is %d',ER*100/samples);
z=sprintf('The accuracy is %d',100-(ER*100/samples));
disp(y); disp(x); disp(z);
