# Estudos para a Prova 1

## Complexidade de Algoritmos

- O(1)
- O(log n)
- O(n)
- O(n log n)
- O(n^2)
- O(n^3)
- O(2^n)
- O(n!)

## Algoritmo QuickSort

```java

public class main{
    public static void main(String[] args){
        int[] array = {8, 2, 5, 3, 9, 4, 7, 6, 1};

        quickSort(array, 0, array.length - 1);

        for (int i : array) {
            System.out.println(i + " ");
        }
    }

    private static void quickSort(int[] array, int start, int end){
        if(end <= start){ return }

        int pivot = partition(array, start, end);
        quickSort(array, start, pivot - 1);
        quickSort(array, pivot + 1, end);
    }
    private static int partition(int[] array, int start, int end){
        int pivot = array[end];
        int i = start - 1;
        for(int j = start; j <= end - 1; j++){
            if(array[j] < pivot){
                i++;
                int temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
        i++;
        int temp = array[i];
        array[i] = array[end];
        array[end] = temp;

        return i;
    }
}
```

## Método da Árvore

Usando indução matemática, prove que:  
$T(n) = 2T(\frac{n}{2})+O(1) = (2n -1) \times O(1)$

### Resolução

$T(n) = 2T(\frac{n}{2})+O(1) = 2n-1$ ❓

Caso base:  
$T(1) = 1$  
$T(1)=2(1)-1=1$ ✔️

Caso indutivo:  
$H.i. T(\frac{n}{2}) = \frac{2n}{2}+1$  
$T(n)=2T(\frac{n}{2})+1$
$T(n)=2[\frac{2n}{2}-1] +1$  
$T(n)=\frac{4n}{2}-2+1$
$T(n)=2n-1$ ✔️

Conclusão:  
$T(n) = 2T(\frac{n}{2})+O(1) = 2n-1$  
$T(n) \in O(n)$

## Algoritmo de Strassen

- Recursivamente computa 7 produtos
- Realizar as adições (e subtrações) de matrizes
- Ainda custa O(n^2)

$O(n^{log_b a}) = O(n^{log_2 7}) = O(n^{2.8})$

### Os 7 produtos de strassen

- $P1 = A_1(B_2 - B_4)$
- $P2 = (A_1 + A_2)B_4$
- $P3 = (A_3 + A_4)B_1$
- $P4 = A_4(B_3 - B_1)$
- $P5 = (A_1 + A_4)(B_1 + B_4)$
- $P6 = (A_2 - A_4)(B_3 + B_4)$
- $P7 = (A_1 - A_3)(B_1 + B_2)$

### Final

$ A_3B_2 + A_4B_4 = A_4B_4 + A_3B_2$
