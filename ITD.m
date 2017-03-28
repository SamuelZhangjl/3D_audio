function t = ITD(angle)
r = 0.18; % diameter of a head 18cm
c = 344; % the speed of sound 344m/s
t = r * (angle + sin(angle))/c; %Howard & Angus 1996

end