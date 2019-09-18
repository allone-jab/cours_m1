# Calculabilité

*Que peut-on calculer avec un ordinateur?*  
Des opérations arithmétiques, des opérations logiques...  
Les programmes utilisés au quotiedien effetue des calculs à tout moment pour correspondre à nos attentes.

## Introduction

### Calculabilité-pratique

On prend en compte les ressources (espace mémoire et temps de calcul) nécessaires pour exécuter un programme. C'est ce qui définit si un programme peut être exécuter avec le matériel à disposition.

    On parle ici des algorithmiques polynomiales: O(n), O(log(n)), O(n²) etc.

### Calculabilité-théorique

On suppose disposer d'un ordinateur *idéal* ayant une capacité mémoire et une fréquence d'horloge finies mais arbitrairement grandes.



### Exemple: Calcul de l'ensemble des parties d'un ensemble à n éléments.

```pseudo-code
def powerSet(n):
    if n==0
        return [[]]
    else
        l = powerSet(n-1)
        return l.addToEach(n,l)

def addToEach(n,l):
    res = []
    for elt in l
        res.append(elt+[n])
    return res
```
Cet algorithme est en théorie utilisable. Il est en revanche inutilisable en pratique dès que n dépasse une certaine valeur.  
Le souci vient du problème de base qui est lui même **probablement intraitable**.

On retrouve les problèmes NP-difficile. (les problèmes auxquels se réduisent les problèmes que l'on sait résoudre en temps polynomial avec une machine *idéale* non déterministe).

`RAPPELS DE LOGIQUE L3`

### Notion d'équipotence

**Deux ensembles sont équipotents, notés E ~ F, si et seulement s'il existe une bijection entre E et F.**

**Proposition**  
La relation *~* est réflexive, symétrique et transitive.

**Preuve**
* réflexive: $id_E : E \rightarrow E$ est une bijection
* symétrique: si $E $\sim$ F$
* `VOIR SLIDES`

### Comparaison des cardinaux

* **On dit qu'un ensemble F domine un ensemble E, noté E $\preceq$ F, si et seulement si, il existe une injection de E dans F (ou de façon équivalent, une surjection de F dans E).**
* **Soient $c_1$ et $c_2$ deux cardinaux tq $c_1$ = Card(F) et $c_2$ = Card(F), on note $c_1 \leq c_2$ si, et seulement si, E $\preceq$ F.**  
 
On peut montrer que les choix faits de E et F n'ont pas d'importance et donc que la définition 2 fait sens.

### Théorème de Cantor-Schröder-Bernstein

* $\preceq$ est réflexive et transitive.
* $\leq$ est réflexive et transitive.

**Théorème**  
$\leq$ est antisymétrique. On a donc, si E $\preceq$ et F $\preceq$ E, alors E $\sim$ F.

**Proposition**
$\leq$ est totale. Si $c_1$ et $c_2$ sont des cardinaux, on a $c_1 \leq c_2$ ou $c_2 \leq c_1$.

### Arithmétique des Cardinaux

**Soient E et F deux ensembles disjoints. On pose:**
* **Card(E) + Card(F) = Card(E$\cup$F)**
* **Card(E) $\times$ Card(F) = Card(E$\times$F)**
* **Card(E$^{Card(F)}$) = Card(E$^F$) = ${f: F \rightarrow E}$**

**Proposition**  
$+$ et $\times$ sont associatives et commutatives.

**Proposition**  
Si $c_1 \leq c_2$ alors $c_1 + c_3 \leq c_2 + c_3$.

**Preuve**  

`SLIDES`

### Cardinaux Finis

Ce sont les **entiers naturels**.  

On définit:  
    0 = Card($\empty$)  
    1 = Card({$\empty$})  
    2 = Card({$\empty$, {$\empty$}}) = Card({0,1})  
    ...

### Cardinaux infinis

Par exemple, soir E = $N \cup$ {a}, avec a $\notin N$. Soif $f$ l'application de E dans $N$ définie par:  
$\forall e \in E$ si e = a alors $f(e) =0$  
si $e \neq a$ alors $f(e) = e+1$ 