clear all;close all;clc;
% data=readtable("Takmlarla Paylalacak Veri Seti.xlsx");
% id=readtable("id.xlsx");
load('matlab.mat')
%% ItemOrder
ItemOrder=zeros(83,31);
for i=0:82
    indx=find(item==i);
    Datep=Date(indx);
    orderp=order(indx);
    for k=1:length(Datep)
        ItemOrder(i+1,Datep(k))=ItemOrder(i+1,Datep(k))+orderp(k);
    end
end
clear orderp Datep i k indx
% covid=covid(1:31);
% construction=construction(1:31);
% precipitation=precipitation(1:31);
% producer_prices=producer_prices(1:31);
covid=(covid - min(covid)) / ( max(covid) - min(covid) );
construction=(construction - min(construction)) / ( max(construction) - min(construction) );
precipitation=(precipitation - min(precipitation)) / (max(precipitation) - min(precipitation));
producer_prices=(producer_prices - min(producer_prices)) / (max(producer_prices) - min(producer_prices));
%% Train
ItemNo=[];Month=[];MonthNo=[];
for i =1:83
ItemNo=[ItemNo;repmat([i-1],28,1)];
MonthNo=[MonthNo;[1:28]'];
Month=[Month;[1:12]';[1:12]';[1:4]'];
end
Jan=zeros(length(ItemNo),1);Feb=Jan;Mar=Jan;Apr=Jan;May=Jan;Jun=Jan;Jul=Jan;Aug=Jan;Sep=Jan;Oct=Jan;Nov=Jan;Dec=Jan;
Jan(find(Month==1))=1;
Feb(find(Month==2))=1;
Mar(find(Month==3))=1;
Apr(find(Month==4))=1;
May(find(Month==5))=1;
Jun(find(Month==6))=1;
Jul(find(Month==7))=1;
Aug(find(Month==8))=1;
Sep(find(Month==9))=1;
Oct(find(Month==10))=1;
Nov(find(Month==11))=1;
Dec(find(Month==12))=1;
A=zeros(length(ItemNo),1);B=A;C=A;
for i =1:length(GroupA)
A(find(ItemNo==GroupA(i)),1)=1;
end
for i =1:length(GroupB)
B(find(ItemNo==GroupB(i)),1)=1;
end
for i =1:length(GroupC)
C(find(ItemNo==GroupC(i)),1)=1;
end
Covid=repmat(covid(1:28)',83,1);
Construction=repmat(construction(1:28)',83,1);
Precipitation=repmat(precipitation(1:28)',83,1);
Producer_prices=repmat(producer_prices(1:28)',83,1);
Order=[];
for i=1:83
    Order=[Order;ItemOrder(i,1:28)'];
end
DataTrain=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Covid,Construction,Precipitation,Producer_prices,Order);
% DataTrain=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Order);
%% Test
ItemNo=[];Month=[];MonthNo=[];
for i =1:83
ItemNo=[ItemNo;repmat([i-1],3,1)];
MonthNo=[MonthNo;[29:31]'];
Month=[Month;[5:7]'];
end
Jan=zeros(length(ItemNo),1);Feb=Jan;Mar=Jan;Apr=Jan;May=Jan;Jun=Jan;Jul=Jan;Aug=Jan;Sep=Jan;Oct=Jan;Nov=Jan;Dec=Jan;
Jan(find(Month==1))=1;
Feb(find(Month==2))=1;
Mar(find(Month==3))=1;
Apr(find(Month==4))=1;
May(find(Month==5))=1;
Jun(find(Month==6))=1;
Jul(find(Month==7))=1;
Aug(find(Month==8))=1;
Sep(find(Month==9))=1;
Oct(find(Month==10))=1;
Nov(find(Month==11))=1;
Dec(find(Month==12))=1;
A=zeros(length(ItemNo),1);B=A;C=A;
for i =1:length(GroupA)
A(find(ItemNo==GroupA(i)),1)=1;
end
for i =1:length(GroupB)
B(find(ItemNo==GroupB(i)),1)=1;
end
for i =1:length(GroupC)
C(find(ItemNo==GroupC(i)),1)=1;
end
Covid=repmat(covid(29:31)',83,1);
Construction=repmat(construction(29:31)',83,1);
Precipitation=repmat(precipitation(29:31)',83,1);
Producer_prices=repmat(producer_prices(29:31)',83,1);
Order=[];
for i=1:83
    Order=[Order;ItemOrder(i,29:31)'];
end
DataTest=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Covid,Construction,Precipitation,Producer_prices,Order);
% DataTest=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Order);
%% Train 31
ItemNo=[];Month=[];MonthNo=[];
for i =1:83
ItemNo=[ItemNo;repmat([i-1],31,1)];
MonthNo=[MonthNo;[1:31]'];
Month=[Month;[1:12]';[1:12]';[1:7]'];
end
Jan=zeros(length(ItemNo),1);Feb=Jan;Mar=Jan;Apr=Jan;May=Jan;Jun=Jan;Jul=Jan;Aug=Jan;Sep=Jan;Oct=Jan;Nov=Jan;Dec=Jan;
Jan(find(Month==1))=1;
Feb(find(Month==2))=1;
Mar(find(Month==3))=1;
Apr(find(Month==4))=1;
May(find(Month==5))=1;
Jun(find(Month==6))=1;
Jul(find(Month==7))=1;
Aug(find(Month==8))=1;
Sep(find(Month==9))=1;
Oct(find(Month==10))=1;
Nov(find(Month==11))=1;
Dec(find(Month==12))=1;
A=zeros(length(ItemNo),1);B=A;C=A;
for i =1:length(GroupA)
A(find(ItemNo==GroupA(i)),1)=1;
end
for i =1:length(GroupB)
B(find(ItemNo==GroupB(i)),1)=1;
end
for i =1:length(GroupC)
C(find(ItemNo==GroupC(i)),1)=1;
end
Covid=repmat(covid(1:31)',83,1);
Construction=repmat(construction(1:31)',83,1);
Precipitation=repmat(precipitation(1:31)',83,1);
Producer_prices=repmat(producer_prices(1:31)',83,1);
Order=[];
for i=1:83
    Order=[Order;ItemOrder(i,1:31)'];
end
DataTrain31=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Covid,Construction,Precipitation,Producer_prices,Order);
% DataTrain31=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Order);
%% Pred 31
ItemNo=[];Month=[];MonthNo=[];
for i =1:83
ItemNo=[ItemNo;repmat([i-1],6,1)];
MonthNo=[MonthNo;[34 35 36 32 33 37]'];
Month=[Month;[10 11 12 8 9 1]'];
end
Jan=zeros(length(ItemNo),1);Feb=Jan;Mar=Jan;Apr=Jan;May=Jan;Jun=Jan;Jul=Jan;Aug=Jan;Sep=Jan;Oct=Jan;Nov=Jan;Dec=Jan;
Jan(find(Month==1))=1;
Feb(find(Month==2))=1;
Mar(find(Month==3))=1;
Apr(find(Month==4))=1;
May(find(Month==5))=1;
Jun(find(Month==6))=1;
Jul(find(Month==7))=1;
Aug(find(Month==8))=1;
Sep(find(Month==9))=1;
Oct(find(Month==10))=1;
Nov(find(Month==11))=1;
Dec(find(Month==12))=1;
A=zeros(length(ItemNo),1);B=A;C=A;
for i =1:length(GroupA)
A(find(ItemNo==GroupA(i)),1)=1;
end
for i =1:length(GroupB)
B(find(ItemNo==GroupB(i)),1)=1;
end
for i =1:length(GroupC)
C(find(ItemNo==GroupC(i)),1)=1;
end
Covid=repmat(covid([34 35 36 32 33 37])',83,1);
Construction=repmat(construction([34 35 36 32 33 37])',83,1);
Precipitation=repmat(precipitation([34 35 36 32 33 37])',83,1);
Producer_prices=repmat(producer_prices([34 35 36 32 33 37])',83,1);
DataPred31=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C,Covid,Construction,Precipitation,Producer_prices);
% DataPred31=table(ItemNo,MonthNo,Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec,A,B,C);
%%
writetable(DataTrain,'DataTrain.xlsx','Sheet','MyNewSheet','WriteVariableNames',true);
writetable(DataTest,'DataTest.xlsx','Sheet','MyNewSheet','WriteVariableNames',true);
writetable(DataTrain31,'DataTrain31.xlsx','Sheet','MyNewSheet','WriteVariableNames',true);
writetable(DataPred31,'DataPred31.xlsx','Sheet','MyNewSheet','WriteVariableNames',true);
% writematrix(DataValid,'DataValid.csv')