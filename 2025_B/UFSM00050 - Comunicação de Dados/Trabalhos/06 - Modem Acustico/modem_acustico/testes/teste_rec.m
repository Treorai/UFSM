
r = audiorecorder(22050, 16, 1);
recordblocking(r, 10);     % speak into microphone...


y=getaudiodata(r, 'double');
plot(y);