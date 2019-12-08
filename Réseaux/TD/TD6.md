# TD6: Routage et sous-réseaux (Partie 1)

## Masques de sous-réseaux personnalisés

### Exercice 1

A $\rightarrow$ `255.0.0.0` + 10 bits $\rightarrow$ `255.255.192.0`  
C $\rightarrow$ `255.255.255.0` + 4 bits $\rightarrow$ `255.255.192.240`  
B $\rightarrow$ `255.255.0.0` + 15 bits $\rightarrow$ `255.255.255.254` *IMPOSSIBLE*  
B $\rightarrow$ `255.255.0.0` + 7 bits $\rightarrow$ `255.255.254.0`  

### Exercice 2

1. 134 -> `10000110` donc classe A  
2. 23 > 16 et 23 < 32 donc 5 bits.
3. `255.248.0.0`
4. 

| Numéro du sous réseau utilisable | Adresse IP du sous-réseaux | première adresse IP utilisable | Adresse de broadcast |
| :------------------------------: | :------------------------: | :----------------------------: | :------------------: |
|               SR1                |        `134.56.8.0`        |          `134.56.8.1`          |   `134.56.15.255`    |
|               SR2                |       `134.56.16.0`        |         `134.56.16.1`          |   `134.56.23.255`    |
|               SR3                |       `134.56.24.0`        |         `134.56.24.1`          |   `134.56.31.255`    |
|               SR4                |       `134.56.32.0`        |         `134.56.32.1`          |   `134.56.39.255`    |
|               SR5                |       `134.56.40.0`        |         `134.56.40.1`          |   `134.56.47.255`    |
|               SR6                |       `134.56.48.0`        |         `134.56.48.1`          |   `134.56.55.255`    |

### Exercice 3

1. 200 = `11001000` -> classe C
2. `255.255.255.240`
3. `200.36.12.52` avec `52` = `00110100`-> `0011` pour le 3$^e$ SR et `0100` pour la 4$^e$ machine


## Adresses de sous-réseaux

### Exercice 4

1. $n \leq 2^b - 2$
2. $2^{(B-b)}-2$

### Exercice 5

1. 2 bits pour éviter de n'avoir que des `0` ou que des `1`
2. 62
3. `01` et `10`
4. 
|    Type    |      adresse      |     Diffusion     |     première      |     dernière      |
| :--------: | :---------------: | :---------------: | :---------------: | :---------------: |
|  Ethernet  | `194.199.116.64`  | `194.199.116.127` | `194.199.116.65`  | `194.199.116.126` |
| Token ring | `194.199.116.128` | `194.199.116.191` | `194.199.116.192` | `194.199.116.190` |

5. premiers ou derniers
6. Les adresses sont réservées

### Exercice 6

| nb bits de l'id du SR | nb max de SR | nb max stations / SR | nb adresses perdues |
| :-------------------: | :----------: | :------------------: | :-----------------: |
|           2           |      2       |          62          |         130         |
|           3           |      6       |          30          |         74          |
|           4           |      14      |          14          |         58          |
|           5           |      30      |          6           |         74          |
|           6           |      62      |          2           |         130         |
|           7           |     126      |          0           |         254         |

### Exercice 7

1. On prend les bits faibles pour l'identification du sous-réseau  

2.

|    Type    |     adresse     |     Diffusion     |    première     |     dernière      |
| :--------: | :-------------: | :---------------: | :-------------: | :---------------: |
|  Ethernet  | `194.199.116.1` | `194.199.116.253` | `194.199.116.5` | `194.199.116.249` |
| Token ring | `194.199.116.2` | `194.199.116.254` | `194.199.116.6` | `194.199.116.250` |

### Exercice 8

