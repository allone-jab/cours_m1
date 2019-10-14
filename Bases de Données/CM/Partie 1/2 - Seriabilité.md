# Garder la sériabilité

## Les verrous

On va poser des verrous pour assurer l'accès uniques à une entité par une transaction.

2 verrous: LECTURE/ECRITURE  
2 opérations:
> LOCK(E,R($_W$))
> UNLOCK(E)

Incompatibilités entre les verrous

| T$_1$/T$_2$ |   R   |   W   |
| :---------: | :---: | :---: |
|      R      |       |   X   |
|      W      |   X   |   X   |

Donc un verrou en lecture permet à d'autres transactions de poser le même verrou. Les autres cas sont impossibles.

> Exemple:
> Mise à jour perdue

|     T$_1$     |   A   |   B   |  T$_2$  |
| :-----------: | :---: | :---: | :-----: |
|       `       | 1200  | 3000  |
|    LIRE(A)    |       |       | LIRE(A) |
| ECRIRE(A+100) | 1400  |       |   EC    |

## Verrouillage à deux phases (2PL)

Aucune opération de verrouillage (LOCK) ne peut suivre une opération de déverrouillage (UNLOCK).  
    $\rightarrow$ 2 phases: verrouillage puis déverrouillage.

![Schema 2](../CM/Schemas/SCH2.jpg)

## Problèmes possibles avec 2PL(non strict): avortements en cascade

![Schema 3](../CM/Schemas/SCH3.jpg)

_Problème_: T$_2$ a validé mais a utilisé une donnée modifiée par T$_1$ qui a avorté:
* Perte de la cohérence de la base
* Nécessité d'avorter en cascade les transactions

    **On utilise donc 2PL strict**

Proposition: Un ordonnancement 2PL est sérialisable

Preuve: Par contradiction  
Supposons que l'on a un ordonnancement 2PL mais qu'il n'est pas sérialisable. Par la proposition précédente, on sait que le graphe de dépendance présente un cycle.  
On a donc T$_1$...T$_n$ réelles que T$_1\rightarrow$T$_2\rightarrow$...T$_n\rightarrow$T$_1$.  
Une flèche signifie que l'on a une paire confictuelle et que l'instruction de la première transaction a lieu avant celle de la deuxième.

Comme on doit verrouiller chaque entité avant de l'utiliser T$_1\rightarrow$T$_2$ signifie donc que T$_1$ a verrouillé l'entité et que T$_2$ attend son déverrouillage avant de pouvoir l'utiliser.  
Donc:  
> T$_1\rightarrow$T$_2$: T$_1$ est en phase de déverrouillage quand T$_2$ est en phase de verrouillage.  
> T$_2\rightarrow$T$_3$: T$_2$ est en phase de déverrouillage quand T$_3$ est en phase de verrouillage.  
> T$_n\rightarrow$T$_1$: T$_n$ est en phase de déverrouillage quand T$_1$ est en phase de verrouillage.  

**Impossible: T$_1$ a déjà effectué sa phase de verrouilage et déverrouillage. Il ne peut donc plus poser de verrou.**

## Problèmes avec 2PL: Deadlock

![Schema 4](../CM/Schemas/SCH4.jpg)

2 solutions possibles:
+ éviter les blocages (difficile, performances)
+ les détecter et les résoudre

Le nombre de blocages est habituellement faible dans les BD. On préfère donc les surveiller et débloquer les situations de blocage.

### Graph d'attente

* On maintient un graphe d'attente: T$_1\rightarrow$T$_2$ signifie que T$_1$ attend que T$_2$ libère une ressource.  
* Si un *deadlock* arrive, alors on aura un cycle dans ce graph d'attente.
* On examine périodiquemebt le graph d'attente pour détecter les cycles.
* Si on détecte un cycle, on avorte une des transactions du cycle.

### Ordonnancement par estampillage
Chaque transaction T$_i$ reçoit une estampille TS(T$_i$).  
Chaque entité A de la base est associée à deux estampilles:
* RTM(A): plus grande estampille des transactions qui ont lu A
* WTM(A): plus grande estampille des transactions qui ont modifié A  

Si T$_i$ veut lire A:  
> *Si* TS(T$_i$)$\ge$WTM(A) *Alors* lecture autorisée: RTM(A) = max(RTM(A), TS(T$_i$))  
> Sinon ABORT(T$_i$), relancer T$_i$

Si T$_i$ veut écrire A:
> *Si* TS(T$_i$)$\ge$WTM(A) et TS(T$_i$)$\ge$RTM(A) *Alors* écriture autorisée: WTM(A) = TS(T$_i$)
> Sinon ABORT(T$_i$), relancer T$_i$

## Multi-Version Control

**Idée**: Plusieurs versions de la base (des objets de la base) coexistent, chaque transaction travaillant sur une version.  
$\rightarrow$ garantie de cohérence et d'isolation (propriétés ACID)

**Avantages**:
+ ne nécessite pas de pose de verrous
+ ne bloque pas les lectures  

**Inconvénients**:
+ nécessite de gérer les différentes verisons (et de supprimer les versions inutiles)
+ peut générer des avortements en cascade

### Méthode
* chaque transaction est estampillée (de façon unique) avec sa date de début T$_1$,T$_2$,...  
* Pour chaque entité A, on maintient plusieurs versions: A$_C^R$:
    + **C** estampille de la transaction qui a créé la version
    + **R** estampille de la transaction la plus récente qui a lu cette version
* Lors d'une lecture d'i,e entité A par la transaction T$_H$:  
  * La transaction lit la version A$_C^R$ où C = max(${c_i\ | A_{C_i}^{R_i} \in BD\ et\ c_i \le H}$).  
  (la version la plus récente pour la transaction T$_M$)
  * On met à jour l'indicateur de lecture A$^R_C \leftarrow$A$^{\max(R,M)}_C$.  
* Lors de l'écriture d'une entité A par la transaction T$_H$:
  * La transaction utilise la version A$^R_C$ où c=max(${c_i\ | A_{C_i}^{R_i} \in BD\ et\ c_i \le H}$)
  * 3 cas:
    * c = R = H: Aucune autre transaction n'a lu cette cette version produite par H.  
    $\rightarrow$ La valeur de A$^R_C$ est remplacée par la valeur écrite. (pas de création de nouvelle version).
    * c = R $\lt$ H ou c = R $\le$ H: Une version A$^H_H$ est crée (avec la valeur écrite)
    * c $\le$ H $\lt$ R: La transaction T$_R$, plus récente que T$_H$, a déjà lu la donnée.  
    $\rightarrow$ T$_H$ ne doit pas modifier A$^R_C$ afin de garantir l'isolation de T$_R$ $\rArr$ T$_H$ est avortée.

## Exercice

Soit l'ordonnancement suivant:  
(T$_1$, R, A),(T$_1$, W, A),(T$_2$, R, A),(T$_2$, W, A),(T$_1$, R, B),(T$_1$, W, B),(T$_2$, R, B),(T$_2$, W, A)  

1. Quelles sont les paires conflictuelles ?  
> Les paires conflictuelles sont les opérations <O$_1$, O$_2$> de transactions différentes pouvant présenter un résultat différent si leur ordre est inversé.
>Ici, les paires conflictuelles sont:  
><1,4> <2,3> <2,4> <5,8> <6,7> <6,8>

2. Graph de dépendance

>En utilisant les paires conflictuelles, on obtient le graph de dépendance suivant:  
>$$T_1 \rightarrow T_2$$
>On obtient ce résultat en vérifiant l'ordre créé par toutes les paires conflictuelles.

3. L'ordonnancement est-il sérialisable ?

> Grâce au graph obtenu dans la question précédente, on peut constater qu'il n'y a pas de cycle. Donc il est sérialisable.

4. Est-il accepté par 2PL ?

`|   #   | T$_1$ | T$_2$ | Action |`
`| :---: | :---: | :---: | :----: | `
`|   1   | (R,A) |       | LOCK(A,W)`
`|   2   | (W,A) |       | UNLOCK(A)`
`|   3   |       | (R,A) | LOCK(A,W)`
`|   4   |       | (W,A) | UNLOCK(A)`
`|   5   | (R,B) |       |`
`|   6   | (W,B) |       |`
`|   7   |       | (R,B) |`
`|   8   |       | (W,B) |`

5. 2PL strict ?

> Non, car il y a un UNLOCK au milieu qui ne peut pas être déplacé.

6. Est-il accepté par estampillage ?

>|  Transaction  | Modification Estampillage |
>| :-----------: | :-----------------------: |
>| (T$_1$, R, A) |        RTM(A) = 1         |
>| (T$_1$, W, A) |        WTM(A) = 1         |
>| (T$_2$, R, A) |        RTM(A) = 2         |
>| (T$_2$, W, A) |        WTM(A) = 2         |
>| (T$_1$, R, B) |        RTM(B) = 1         |
>| (T$_1$, W, B) |        WTM(B) = 1         |
>| (T$_2$, R, B) |        RTM(B) = 2         |
>| (T$_2$, W, B) |        WTM(B) = 2         |
>
>*On tient compte des estampillage ainsi:*  
>
>| Est*  |    A    |    B    |
>| :---: | :-----: | :-----: |
>|  RTM  | ~~1~~ 2 | ~~1~~ 2 |
>|  WTM  | ~~1~~ 2 | ~~1~~ 2 |

7. Par MVC ?

> On suppose qu'on a une version 0 de toutes les bases.
>|   #   |                    Versions                     |
>| :---: | :---------------------------------------------: |
>|   0   |                 $A^0_0$ $B^0_0$                 |
>|   1   |                 $A^1_0$ $B^0_0$                 |
>|   2   |             $A^1_0$ $A^1_1$ $B^0_0$             |
>|   3   |             $A^1_0$ $A^2_1$ $B^0_0$             |
>|   4   |         $A^1_0$ $A^2_1$ $A^2_2$ $B^0_0$         |
>|   5   |         $A^1_0$ $A^2_1$ $A^2_2$ $B^1_0$         |
>|   6   |     $A^1_0$ $A^2_1$ $A^2_2$ $B^1_0$ $B^1_1$     |
>|   7   |     $A^1_0$ $A^2_1$ $A^2_2$ $B^1_0$ $B^2_1$     |
>|   8   | $A^1_0$ $A^2_1$ $A^2_2$ $B^1_0$ $B^2_1$ $B^2_2$ |
> OK