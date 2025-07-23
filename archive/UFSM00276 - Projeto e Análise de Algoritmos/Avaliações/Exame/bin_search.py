def binary_search(array, target, start=0, end=None):
    # Teste se é válido
    if end is None:
        end = len(array) - 1

    # Algoritmo de busca recursiva
    if start <= end:
        mid = (start + end) // 2
        if array[mid] == target:
            return mid
        elif array[mid] > target:
            return binary_search(array, target, start, mid - 1)
        else:
            return binary_search(array, target, mid + 1, end)
    return None
