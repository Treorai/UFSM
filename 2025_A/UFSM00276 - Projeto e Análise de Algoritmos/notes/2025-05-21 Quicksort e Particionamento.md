# 21/05/2025

```c
int partition(int *v, int l, int r);
```
- escolhe um pivô
- coloca os elementos menores à esquerda do pivô
- coloca os elementos maiores à direita do pivô
- devolve a posição final do pivô

```c
void quicksort(int *v, int l, int r) {
 int i;
 if(r <= l) return;
 i = partition(v, l, r);
 quicksort(v, l, i-1);
 quicksort(v, i+1, r);
}
```

## Particionamento

```c
int partition(int *v, int l, int r) {
  int pivo = v[l];
  int i = l, f = r;
  while (i < f) {
    while (v[f] >= pivo && i < f)
      f--;
    if (i < f)
      v[i] = v[f];
    while (v[i] <= pivo && i < f)
      i++;
    if (i < f)
      v[f] = v[i];
  }
  v[i] = pivo;
  return i;
}
```
<details>

<summary> Código do Exercício</summary>
  
```py
def partition(v, l, r):
pivo = v[l]
i = l
f = r
print(f"\nInício da partição: {v}")
print(f"Pivô escolhido: v[{l}] = {pivo}")
print(f"Índices iniciais: i = {i}, f = {f}")
while i < f:
print(f"\nProcurando elemento menor que o pivô à esquerda (f):")
while v[f] >= pivo and i < f:
print(f" v[{f}] = {v[f]} >= {pivo} (pivô), decrementando f")
f -= 1
if i < f:
print(f" Encontrado v[{f}] = {v[f]} < {pivo}, movendo para v[{i}]")
v[i] = v[f]
print(f" Estado atual: {v}")
print(f"\nProcurando elemento maior que o pivô à direita (i):")
while v[i] <= pivo and i < f:
print(f" v[{i}] = {v[i]} <= {pivo} (pivô), incrementando i")
i += 1
if i < f:
print(f" Encontrado v[{i}] = {v[i]} > {pivo}, movendo para v[{f}]")
v[f] = v[i]
print(f" Estado atual: {v}")
v[i] = pivo
print(f"\nColocando pivô na posição correta v[{i}] = {pivo}")
print(f"Vetor após partição: {v}")
print(f"Retornando índice do pivô: {i}\n")
return i

def quicksort(v, l, r):
if r <= l:
return
i = partition(v, l, r)
quicksort(v, l, i - 1)
quicksort(v, i + 1, r)

valores = [4,8,2,7,6,3,5,1,9,10]
quicksort(valores, 0, len(valores) - 1)
print(valores)
```
  
</details>

### Solução

```c

```
