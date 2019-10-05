# Rappels

## Ensembles

* Un ensemble désigne *intuitivement* une collection d'objets
* l'inclusion désigne pour deux ensembles E et F ***
* E = F si et seulement si E est inclu à F et F est inclu à E
* Le complémentaire de A inclu à E est l'ensemble des x appartient à E mais pas à A.
* L'union de A et B est l'ensemble des x appartenant à A et B.
* l'intersection est l'ensemble des x appartenant à A et à B.

## Automates

Un **automate fini déterministe** est défini par $A = (E, \Sigma, \delta,e_0, F)$ où:

  + $E$ est un ensemble fini d'**états**
  + $\Sigma$ est ensemble fini de **symboles d'entrée**
  + $\delta : E \times \Sigma \rightarrow E$ est une **fonction de transition**
  + $e_0$ est un **état de départ**
  + $F \subseteq E$ est l'ensemble des **états d'acceptation**

Un **automate fini non déterministe** (AFN) est défini par $A = (E, \Sigma, \delta, e_0, F)$ où:  
+ E est un ensemble fini d’**états**
+ $\Sigma$ est un ensemble fini de **symboles d’entrée**
+ $\delta \subseteq (E \times \Sigma) \times E$ est une **relation de transition**
+ $e_0$ est un **état de départ**
+ $F ⊆ E$ est l’ensemble des **états d’acceptation**