import matplotlib.pyplot as plt
from scipy import signal
import numpy as np

td=1/512
t=np.linspace(0, 1, 512)

#select:
#xsig=2*np.sin(2*30*np.pi*t)+2*np.sin(2*20*np.pi*t); #sinal senoidal de 30Hz e 20Hz
#xsig=np.sin(2*np.pi*3*t) # sinal senoidal de 3 Hz
#xsig=np.square(2*np.pi*3*t) # Pulso quadrado
#xsig=signal.square(t*3) # Onda quadrada

Lsig=len(xsig)
Lfft=int(pow(2, np.ceil(np.log2(Lsig))))
Fmax=1/(2*td)
Faxis=np.linspace(-Fmax,Fmax,int(Lfft+1))
Xsig=np.fft.fftshift(np.fft.fft(xsig,Lfft)/Lfft)
plt.figure(figsize=(16,12))

#Plot Sinal
plt.subplot(2, 1, 1)
plt.plot(t, xsig)
plt.title('Sinal')

#Plot Espectro
plt.subplot(2, 1, 2)
plt.vlines(Faxis[0:int(Lfft)], abs(Xsig), np.zeros(len(Xsig)))
plt.title('Espectro')

plt.show()
