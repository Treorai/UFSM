load handel;
p = audioplayer(y, Fs);
play(p, [1 (get(p, 'SampleRate') * 3)]);