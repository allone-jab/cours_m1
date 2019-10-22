# TD5: Adresses IP, routage IP sans masque

|   n   | 2$^n$ |
| :---: | :---: |
|   0   |   1   |
|   1   |   2   |
|   2   |   4   |
|   3   |   8   |
|   4   |  16   |
|   5   |  32   |
|   6   |  64   |
|   7   |  128  |
|   8   |  256  |
|   9   |  512  |

## Adresses Réseau

1. 
+ `172.16.0.0`
+ `10.0.0.0`

2.
+ $(256 \times 256)-2 = (2^8 \times 2^8)-2$
+ $(256 \times 256 \times 256)-2 = (2^8 \times 2^8 \times 2^8)-2$

3.
+ `172.16.1.254`
+ `10.10.0.1`

## Adresses IP et classes d'adresses

1. `139.124.5.25` = `1000 1011 ...` 
Commence par `1` donc classe *B*. $\rightarrow$ `139.124.5.25/16`
2. `194.199.116.255` = `1100 0010 ...`
Commence par `11` donc classe *C*. $\rightarrow$ `194.199.116.255/24`
3. `12.34.56.78` = `0000 1100 ...`
Commence par `0` donc classe *A*. $\rightarrow$ `12.34.56.78/8`
4. `224.0.0.2` = `1110 0000 ...`
Commence par `111` donc classe *D*. $\rightarrow$ `224.0.0.2` (pas de masque)

## Adresses IP sous forme binaire

1.
    a. B  
    b. A  
    c. D  
    d. C  

2.  a. `147.216.103.190 /16`  
    b. `108.164.149.197 /8`  
    c. `224.129.162.81`  
    d. `214.92.180.209 /24`

3.  a. `10010011 11011000`  
    b. `01101100`  
    c.   
    d. `11010110 01011100 10110100`  

4.  a. `147.216.0.0`  
    b. `108.0.0.0`  
    c. `0.0.0.0`  
    d. `214.92.180.0`  

## Test de la remise direct

`194.199.110.250` $\rightarrow$ classe C  
`27.158.62.10` $\rightarrow$ classe A  
`139.124.5.250` $\rightarrow$ classe B

`27.5.12.198`  $\rightarrow$ direct, correspond à `27.0.0.0`  
`194.199.115.5`  $\rightarrow$ indirect, ne correspond pas à `194.199.110.0`  
`194.199.110.5`  $\rightarrow$ direct, correspond à `194.199.110.0`  
`139.124.5.255`  $\rightarrow$ direct, correspond à `139.124.0.0`

## Principe des tables de routage

1/2. 
Destination | R1 | R2
:-:|:-:|:-:
`112.0.0.0` | `0.0.0.0` | `175.110.25.251`
`175.110.0.0` | `0.0.0.0` | `0.0.0.0`
`215.192.18.0` | `175.110.3.250`|`0.0.0.0`

3.
4.

5. `215.192.18.21`  

Destination | Routeur 
:-:|:-:
`215.192.18.0` | `0.0.0.0`
default | `215.192.18.250`

6. 
Destination | Routeur
:-:|:-:
`175.110.0.0` | `0.0.0.0`
`215.192.18.0` | `175.110.3.250`

7. On ajoute ça au tableau au dessus  

`112.3.45.67` | `175.110.3.250`