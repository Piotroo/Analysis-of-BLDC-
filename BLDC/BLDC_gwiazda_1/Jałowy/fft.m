okno=0.1;
fs=1000;
dt=1/fs;
nf = okno/dt;
t=0:dt:okno;
%sygnał
x = 50+100*cos(2*pi*50*t)+80*cos(2*pi*150*t+pi)+...
30*cos(2*pi*250*t)+70*cos(2*pi*430*t+pi/2);
y = fft(x,nf);
py = sqrt(y.*conj(y))/nf;
nf2 = nf/2;
f = (0:nf2)*fs/nf;
py(2:nf2) = 2*py(2:nf2);
py(nf2+2:nf) = [];
figure(1)
subplot(211);
plot(t, x);
subplot(212);
bar(f, py);
grid; xlabel('f');
ylabel('amplituda');