# 18/03/2025

### ATmega328P

[MANUAL DO ATmega328P](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)

Microcontrolador 8bits

- Arquitetura RISC (Reduced instruction set)
- 131 instruções 
- 32 registradores de uso geral
- Multiplicador em hardware
- 32Kbytes de memória flash
- 1kb eeprom (disco)
- 2kb sram
- Bloqueio de programação (antipiracy)
- Dois timers/contadores 8bits com prescaler
- Um timer/contador de 16bits com prescaler
- Contador de tempo real com oscilador separado (timer em segundos em vez de clock)
- Seis canais pwm
- adc de oito canais e 10bits
- Medição de temperatura
- USART serial programável 
- Interface serial SPI mestre/escravo
- Interface serial de 2 fios orientada por byte
- Timer watchdog programável com oscilador on-chip separado
  - watchdog: aviso de "tudo bem" para controlador, quando o padrão do software é não ativar; ex: alarme
- Comparador analógico 
- Interrupção e despertar por mudança de pino
- Reset por queda de tensão 
- Oscilador interno
- Fontes de interrupção interna e externa 
- Seis modos de suspenção 
  - Ocioso
  - Redução se ruído adc
  - Economia de energia 
  - Desligamento
  - Espera
  - Espera estendida
- Tensão se operação 
  - 2,7 a 5,5V

# 20/03/2025

ULA: Unidade lógica aritmética  
Registrador de Status: Contem informações sobre o resultado da instrução aritmética mais recentemente executada. Isso muitas vezes elimina a necessidade de usar as instruções de comparação dedicadas  

### SREG - AVR Status Register

| Bit | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
| :-: | :- | :- | :- | :- | :- | :- | :- | :- |
| 0x3F (0x5F) | I | T | H | S | V | N | Z | C |
| Description | Global Interrupt Enable | Bit Copy Storage | Half Carry Flag | Sign Bit<br>`S = N ⨁ V` | Two's Complement Overflow Flag | Negative Flag | Zero Flag | Carry Flag |
| Read/Write | R/W | R/W | R/W | R/W | R/W | R/W | R/W | R/W |
| Initial Value | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

### AVR CPU General Purpose Working Registers

## Registradores das PORTAS

- DDRx: registrador de direção. Indica se os pinos são entrada (0) ou saída (1)  
- PINx: registrador de entrada, usado para ler o valor da porta X  
- PORTx
    - Se porta x está configurada como saída:
        - Colocar um 1 no reg, PORTXn(n-ésimo bit da porta x), força a saída em nível lógico 1
        - Colcoar um 0, força a saída em nível lógico 0
    - Se porta x está configurada como entrada:
        - Colocar um 1, liga o resistor de pull-up
        - Colocar em 0, desliga o resistor de pull-up
 
Por padrão as portas são configuradas como entrada tri-state para não queimar em caso do acidente 5V/0V = infinitos

### MCUCR - MCU Control Register

| Bit | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
| :-: | :- | :- | :- | :- | :- | :- | :- | :- |
| 0x3F (0x5F) | - | BODS | BODSE | PUD | - | - | IVSEL | IVCE |
| Read/Write | R | R | R | R/W | R | R | R/W | R/W |
| Initial Value | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |

## Instruction Set

[Página 281](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf)


### Criando Variaveis

```assembly
.dseg
var:
  .byte 2 ; Aloca 2 byte de memória para a variável "var"

.cseg

.org 0x00

; Replace with your application code
start:
  clr r16
  lds r16, var
  lds r17, var+1

  inc r16
  sts var, r16
  rjmp start
```

### Variáveis de Vetores

```assembly
.dseg
k:    .byte 10

.cseg

.org 0x00

start:
  ldi   r16, low(k)   ; r16 = endereço (k)
  ldi   r17, high(k)  ; r17 = endereço high(k)
  movw  ZL, r16       ; salva o endereço de k no registrador Z

  ldi   r18, 1
  st    Z+, r18

  lds   r19, k
  lds   r20, k+1
```
