# La Gestion des Transactions

Le système de gestion de transactions est une partie importante d'un SGBD. C'est lui qui assure que les données restent cohérentes quelsque soient les événements qui surviennent.
En effet, lorsque l'on effectue un traitement sur les bases de données et  qu'une panne intervient (panne matérielle, erreur logicielle...), cela peut compromettre gravement l'intégrité de la base.
    
### Exemple: Le cas d'une transaction bancaire d'un compte A vers un compte B

    Elle ne peut avoir lieu que par mise à jour successive des enregistrements correspondants.

```sql
UPDATE Compte
SET solde = solde - S
WHERE nom_compte = A;
UPDATE Compte
SET solde = solde + S
WHERE nom_compte = B;
```
    Si une panne intervient pendant ce traitement, on a généralement aucun moyen de savoir exactement à quel moment la panne a eu lieu et donc le traitement à apporter.

    Si la première instruction a eu lieu mais pas la seconde, la base se retrouve dans un état incohérent.

Deux objectifs:

* Conserver la cohérence de la base
* Ne pas perdre de transaction

**Une transaction est une unité de traitement séquentiel constitué d'une suite d'instructions à réaliser sur la base de données et qui, appliquée à une base cohérente, restitue une base cohérente.**

Propriétés ACID:

* Atomicité: Soit l'ensemble des instructions sont effectuées soit aucune.
* Cohérence: Une transaction renvoie une base cohérente.
* Isolation: Chaque transaction s'effectue indépendemment. 
* Durabilité: Les modifications sont durbles et permanentes.

### Syntaxe SQL

```sql
    # Validation
    BEGIN [TRANSACTION][mode];
    [INSTRUCTIONS]
    COMMIT[TRANSACTION];

    # Abandon
    BEGIN [TRANSACTION][mode];
    [INSTRUCTIONS]
    ROLLBACK[TRANSACTION];
```

### Trois scénarios possibles

```sql
    # Succès
    BEGIN;
        |
    COMMIT;

    # Abandon Explicite
    BEGIN;
        |
    ROLLBACK;

    # Abandon après erreur
    BEGIN;
        |
    <erreur>
        |
    COMMIT; # Le SGBD fait un ROLLBACK à cause de l'erreur.
```

```sql
# EXEMPLE
    BEGIN;                                                  # BEGIN
    SELECT couleur FROM produit WHERE id_produit=474;       # bleu
    UPDATE produit SET couleur='rouge' WHERE id_produit=474 # Update 1
    ROLLBACK;                                               # ROLLBACK
    SELECT couleur FROM produit WHERE id_produit=474        # bleu
```

Points de sauvegarde: 
* SAVEPOINT \<nom>
* ROLLBACK TO SAVEPOINT \<nom>
* RELEASE SAVEPOINT \<nom>

## Problèmes posés par la concurrence d'accès aux données.

```
T1: VIREMENT(B -> A, 100)
    LIRE A
    ECRIRE A + 100
    LIRE B
    ECRIRE B - 100

T2: VIREMENT(B -> A, 200)
    LIRE A
    ECRIRE A + 200
    LIRE B
    ECRIRE B - 200
```

### Execution en série
|_|A|B|  
|:-:|:-:|:-:|
. | 1200 | 3000
T1 | 1300 | 2900
T2 | 1500 | 2700

### Execution en simultanée
|_|A|B|  
|:-:|:-:|:-:|
. | 1200 | 3000
T1 | 1300 | 2900
T2 | 1400 | 2800

*T2 a lu la valeur de A et B avant que T1 soit appliquée. La mise à jour est perdue.*

## Ordonnancement de Transactions

On veut garantir de bonnes performances (parellèlisme des transactions) et la cohérence des données.

Problème:
* Base = {E1, ..., En} un ensemble d'entités.
* Transactions = {T1,..., Tn}
* Chaque transaction est une séquence d'opérations de la forme (Ti, R, Ej) ou (Ti, W, Ej)  

*Quels ordonnancements des transactions ne posent pas de problème ?*

On va faire un ordonnancement sériel (chaque instruction s'exécute à la suite). Garantit la cohérence mais aucun parallélisme.
Ordonnances sérialisables: un ordonnancement qui est équivalent à un ordonnancement sériel.

**Deux ordonnancements sont équivalents s'ils ont le même effet sur la base.**

*Comment savoir si un ordonnancement est sérialisable ?*

Exemple:  
T1: (T1,R,A), (T1,W,A), (T1,R,B), (T1,W,B)  
T2: (T2,R,A), (T2,W,A)

O1: (T1,R,A), (T1,W,A), (T1,R,B), (T1,W,B), (T2,R,A), (T2,W,A) -> *seriel*  
O2: (T1,R,A), (T1,W,A), (T2,R,A), (T2,W,A), (T1,R,B), (T1,W,B) -> *serialisable*  
O3: (T1,R,A), **(T2,R,A), (T2,W,A)**, (T1,W,A), (T1,R,B), (T1,W,B) -> *On doit bouger la partie surlignée au début ou à la fin. Pas sérialisable.*

**Deux opérations de deux transactions différentes (O1 de T1 et P2 de T2) sont conflictuelles si l'exécution des deux séquences \<O1,O2>
 et \<O2,O1> est susceptible de produire des résultats différents.**

 Comme ici on n'utilise que les instructions R et W, on a des opérations conflictuelles que si elles accèdent à la même entité et qu'au moins un des deux accès est une écriture.  
 \<O1,O2> est appelé une liste séquentielle.

** Méthode pour détecter les ordonnancements sérialisables:**  
_Proposition:_ Un ordonnancement est sérialisable si et seulement s'il peut peut être transformé en un ordonnancement sériel par permutations successives d'opérations ne constituant pas une paire conflictuelle.

**Autre Méthode: Graphe de dépendances**  
Les noeuds du graphe sont les transactions.  
Les arcs sont tracés en fonction des paires conflictuelles. 

Un ordonnancement est sérialisable si et seulement si le graphe de dépendances est acyclique.