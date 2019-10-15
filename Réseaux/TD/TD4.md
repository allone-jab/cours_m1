# Codes Correcteurs

## Code Sacramentum

1. 


| M$_7$ | M$_6$ | M$_5$ | M$_4$ | M$_3$ | M$_2$ | M$_1$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| D$_3$ | D$_2$ | D$_1$ | C$_2$ | D$_0$ | C$_1$ | C$_0$ |

2. 
|   K   | binaire |
| :---: | :-----: |
|   1   |  0001   |
|   2   |  0010   |
|   3   |  0011   |
|   4   |  0100   |
|   5   |  0101   |
|   6   |  0110   |
|   7   |  0111   |
|   8   |  1000   |


$\sigma_1$ = **M$_1$**,M$_3$,M$_5$,M$_7$  
$\sigma_2$ = **M$_2$**,M$_3$,M$_6$,M$_7$  
$\sigma_3$ = **M$_4$**,M$_5$,M$_6$,M$_7$

$\sigma_i$ contribue à C$_j$ où $j = i - 1$

3.
On remplace les C$_j$ par les premiers éléments des $\sigma_i$

| M$_7$ | M$_6$ | M$_5$ | M$_4$ | M$_3$ | M$_2$ | M$_1$ |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| D$_3$ | D$_2$ | D$_1$ | C$_2$ | D$_0$ | C$_1$ | C$_0$ |
|   0   |   1   |   1   | **0** |   1   | **0** | **0** |

4.


## Encodage avec des codes polynomiaux
$G(x) = x + 1$  

1. Degré du polynôme $\rightarrow$ 1
2. `10011010` $\rightarrow x^7 + x^4 + x² + x$
3. $x^8 + x^5 + x^4 + x^2$
4. 

## Décodage avec des codes polynomiaux

`101010010010001010101` et $G(x)=x^4+x+1$

`101010010010001010101` $\rightarrow x^20 + x^{18} + ... + x^2 + 1$