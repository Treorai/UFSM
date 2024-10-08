# Gabarito Flipflops

## Flipflop JK (Latch)

> JK é uma latch sensível ao clock

### Tabela Verdade

| Q S R | Q | !Q |
| :-: | :-: | :-: |
| 0 0 0 | 0 | 1 |
| 0 0 1 | 0 | 1 |
| 0 1 0 | 1 | 0 |
| 0 1 1 | 0 | 0 |
| 1 0 0 | 1 | 0 |
| 1 0 1 | 0 | 1 |
| 1 1 0 | 1 | 0 |
| 1 1 1 | 0 | 0 | 

### Excitação

| S R | Q | !Q |
| :-: | :-: | :-: |
| 0 0 | Q | !Q |
| 0 1 | 0 | 1 |
| 1 0 | 1 | 0 |
| 1 1 | - | - |

> SR=11 é proibído

## Flipflop Tipo D

### Tabela Verdade

| D | Q | !Q |
| :-: | :-: | :-: |
| 0 | 0 | 1 |
| 1 | 1 | 0 |

### Excitação

| D | Q | !Q |
| :-: | :-: | :-: |
| 0 | 0 | 1 |
| 1 | 1 | 0 |

## Flipflop Tipo T

### Tabela Verdade

| xxx | Q | !Q |
| :-: | :-: | :-: |
| 0 | 0 | 1 |
| 1 | 1 | 0 |

### Excitação

| xxx | Q | !Q |
| :-: | :-: | :-: |
| 0 | 0 | 1 |
| 1 | 1 | 0 |


## Flipflop JK

### Tabela Verdade

| J K | Q | !Q |
| :-: | :-: | :-: |
| 0 0 | Q | !Q |
| 0 1 | 0 | 1 |
| 1 0 | 1 | 0 |
| 1 1 | !Q | Q |

### Excitação

| Q(t) | Q(t+1) | JK | S(J K) |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 00 <br> 01 | 0 X |
| 0 | 1 | 11 <br> 10 | 1 X |
| 1 | 0 | 11 <br> 01 | X 1 |
| 1 | 1 | 00 <br> 10 | X 0 |
