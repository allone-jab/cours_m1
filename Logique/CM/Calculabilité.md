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
    $\forall n \ge 1 = Card({0,1,...,n-1})$

### Cardinaux infinis

Par exemple, soir E = $N \cup$ {a}, avec a $\notin N$. Soif $f$ l'application de E dans $N$ définie par:  
$\forall e \in E$ si e = a alors $f(e) =0$  
si $e \neq a$ alors $f(e) = e+1$ 

On a $Card(E)=Card(\natnums)+1$  
$\natnums$ est équivalent a une de ses parties parties propres, ce qui caractérise des **ensembles infinis**.  

Un ensemble est **dénombrable** quand il est équipotent à une partie finie ou non de $\natnums$.  
Un ensemble est **indénombrable** quanf il est équipotent à $\natnums$.  

Par définition, on a qu'un ensemble E est:
* dénombrable quand $Card(E) \le Card(\natnums)$
* Infini dénombrable quand $Card(E) = Card(\natnums)$  


> $Card(\natnums)$ est le plus petit cardinal transfini.

**Proposition:**
+ $\forall n\in\natnums, n \lt Card(\natnums)$
+ E est infini si, et seulement si, $Card(\natnums) \le Card(E)$

Il existe une infinit de cardinaux transfinis plus grands que $Card(\natnums)$. Ceci est une conséquence du théorème de Cantor suivant:  

**Théorème**: Pour tout ensemble E, on a:

$$Card(E) \lt Card(\mathscr{P}(E))$$

### Ensembles Infinis Dénombrables

On a $\natnums\times\natnums$ est indéfini dénombrable, donc $Card(\natnums)\times Card(\natnums)=Card(\natnums)$. De façon générale, *tout produit cartésioen d'une famille finie d'ensemble dénombrable est dénombrable*.

$\mathbb{Z}$ est infini dénombrable.  
Montrer qu'on a une bijection entre $\mathbb{Z}$ et $\natnums$. A-t-on $Card(\mathbb{Z}) = Card(\natnums)$ ?

$f:\mathbb{Z}\rightarrow \natnums$  
$n \rightarrow \text{si } n \le 0, -2n$
$\text{si } n \gt 0, 2n-1$  
est une bijection.  
$\mathbb{Z}\cup\natnums\times\natnums$ est infini dénombrable, plus généralement:  
*la réunion débrable d'ensembles dénombrables est dénombrable.*

**Propriétés**:  
* si A $\subseteq$ B avec B dénombrable, alors A l'est aussi.
* si le domaine d'une fonction est dénombrable, alors son image l'est aussi.

### Puissance du continu

Cantor a prouvé que:  
**Théorème**: Pour tout ensemble E, on a:
$$Card(\mathscr{P}(E)) = 2^{Card(E)}$$

Il a également prouvé que:  
$$Card(\reals) = Card(\mathscr{P}(\natnums))$$

>**$\reals$ est-il dénombrable ?**
>
> On considère $]0,1[\ \subseteq \reals$
>
> Chaque $r\in\ ]0,1[\ \subseteq \reals$ peut s'écrire selon son développement décimal, donc sous la forme $r = 0,r^1r^2...$