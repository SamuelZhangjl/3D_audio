clear; close all; clc;
%author:Jingliang Zhang
%theme: how to transform a normal sound into a binaural sound

%read sound, extract
filename = 'ding.wav';
[y,Fs] = audioread(filename);
sound(y,Fs);
pause(1);
ts = 1/Fs;
% sound(y,Fs);
%Y = fft(y);
% fm = 3000*length(Y)/Fs;
% f = (0:fm)*Fs/length(Y);
% figure(1);
% plot(f,abs(Y(1:length(f))));

R = deg2rad(60);
t = ITD(R);

x1 = y(:,1);
x2 = x1;

N = int32(t/ts);
itd1 = [x1;zeros(N,1)];
itd2 = [zeros(N,1);x2];

ITDOutputl = zeros(length(itd1),2);
% ITDOutputl(:,1) =  itd1;
% ITDOutputl(:,2) =  itd2;
% sound(ITDOutputl);
% pause(1);

ITDOutputl(:,1) = IIDleft(R, itd1, Fs);
ITDOutputl(:,2) = IIDright(R, itd2, Fs);
sound(ITDOutputl,Fs);
pause(1);





% ITDOutputr(:,1) =  itd2;
% ITDOutputr(:,2) =  itd1;
% sound(ITDOutputr);
% pause(1);

ITDOutputr(:,1) = IIDright(R, itd2, Fs);
ITDOutputr(:,2) = IIDleft(R, itd1, Fs);
sound(ITDOutputr,Fs);




% [iid1,iid2] = IID(R, x1, Fs);
% IIDOutputl = zeros(length(iid1),2);
% IIDOutputl(:,1) = abs(iid1);
% IIDOutputl(:,2) = abs(iid2);
% sound(IIDOutputl);
% pause(1);
% 
% IIDOutputr(:,1) = abs(iid2);
% IIDOutputr(:,2) = abs(iid1);
% sound(IIDOutputr);
% 
% pause(1);
% temp = length(IIDOutputl);
% ITDOutputl = ITDOutputl(1:temp,:);
% output = 0.5 * ITDOutputl + 0.5 * IIDOutputl;
% sound(output);




