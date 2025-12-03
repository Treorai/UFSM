# UFSM00051 - Concepção de Circuitos Integrados

> Circuitos Eletrônicos

## Formação do Canal do Transistor MOS

Quando uma tensão $Vg$ é aplicada sobre o transistor, o boro recebe um eletron (ficando com 4) e se torna um íon.  

## Virtuoso

[Virtuoso layout tutorial](https://www.youtube.com/watch?v=X-ke0KeekQE)

```sh
ssh -X ****.**@192.168.139.58
```

## Simulador LT SPICE

## nMos

> seta entrando

w= 120n

Passa a corrente D-S quando a entrada G tiver uma tensão negativa.

![nmos](./src/nmos.png)

## pMos

> bolinha / seta saindo

w= 145n

Passa a corrente S-D quando a entrada G tiver uma tensão positiva.

![pmos](./src/pmos.png)


## Inversor

![invscheme](./src/inv_scheme.png)

## Layout

> Default sizes

![alt text](./src/default_sizes.png)

## Shortcuts

1. $update components and nets
    - check create label as (x)label-[same as pin]
2. shift+f -> show componnet
3. ctrl+a -> $show selected incomplete nets
4. [o] -> vias