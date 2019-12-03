# SQL

**SQL:** Plusieurs problèmes surviennent lors des accès concurrents aux données. On peut avoir des:
+ lectures sales: une transaction lit une donnée écrite par une transaction concurrente non-validée (ce qui pose problème si cette transaction n'est jamais validée)
+ lectures non-reproductibles: une transaction relit des données et obtient des données modifiées (à cause d'une transaction concurrente validée)
+ lectures d'enregistrements fantômes: une transaction lit un certain nombre d'enregistrements, puis une transaction concurrente ajoute ou enlève des enregistrements.

SQL définit quatre niveaux d'isolation des transactions:

| Niveau d'isolation | Lecture sale | Lecture non-reproductible | Lecture fantôme |
| :----------------: | :----------: | :-----------------------: | :-------------: |
|  READ UNCOMMITTED  |   POSSIBLE   |         POSSIBLE          |    POSSIBLE     |
|   READ COMMITTED   |  `INTERDIT`  |         POSSIBLE          |    POSSIBLE     |
|  REPEATABLE READ   |  `INTERDIT`  |        `INTERDIT`         |    POSSIBLE     |
|    SERIALIZABLE    |  `INTERDIT`  |        `INTERDIT`         |   `INTERDIT`    |

Il s'agit des modes possibles d'exécution des transactions. 

Syntaxe: 
```sql
BEGIN [TRANSACTION][mode] /*mode: ISOLATION LEVEL*/
```

Ces niveaux d'isolation sont assurés par la pose de verrous au niveau des tables.

## Verrouillage explicite

On peut demander explicitement le verrouillage d'une table pour une transaction.
**Syntaxe:** 
```sql
LOCK [TABLE] <nom> IN <mode> MODE [NO WAIT];
```
Les différents modes sont indiqués sur la `feuille photocopiée`.

|         MODE         |        OPÉRATION        |
| :------------------: | :---------------------: |
|   **ACCESS SHARE**   |         SELECT          |
|  **RAW EXCLUSIVE**   | UPDATE, DELETE, INSERT  |
|      **SHARE**       |      CREATE, INDEX      |
| **ACCESS EXCLUSIVE** | ALTER TABLE, DROP TABLE |

`NO WAIT` indique que si le verrou n'est pas disponible la transaction sera avortée (par défaut - sans le `NO WAIT` - elle attendra la libération de ce verrou)  
Il n'y a pas d'instruction `UNLOCK`, la libération des verrous d'effectue en fin de transaction.  

## Reprise après panne

Plusieurs types de pannes possibles dans un SGBD:

+ "Panne" d'une transaction: une transaction ne peut pas continuer suite à une erreur, un blocage, etc. Il faut alors défaire cette transaction, assuré par le gestionnaire de transaction.
+ Panne système: ce type de panne nécessite l'arrêt du système et son redémarrage $\rightarrow$ reprise à chaud.
+ Panne de mémoire secondaire: Panne matérielle. une partie de la mémoire secondaire est perdue $\rightarrow$ reprise à froid 

Lors s'une panne, le SGBD doit s'assurer de retrouver une base dans un état cohérent. Il y a deux priorités:
- garder la cohérence de la base
- si possible, ne pas perdre de transaction.

Suite à une panne, on doit veiller à deux choses:
- les modifications de toutes les transactions validée avant la panne soit bien prises en compte dans la base de données.
- les modifications non validées au moment de la panne sont bien effacées de la base de données.  

Exemple: 
![SCH5](./Schemas/SCH5.jpg)

Journal des images avant: On enregistre dans un fichier système:
+ images (valeurs) avant modification des données mises à jours (+ identité dans la transaction)
+ début des transactions
+ validation (ou l'annulation) des transactions

Ce journal est utilisé pour défaire (UNDO) les Mise à jours effectuées par une transaction.

Journal des images après:
+ images après modification des données mises à jour
+ début des transactions
+ validation (ou annulation) des transactions

Ce journal est utilisé pour rejouer (REDO) les mises à jours effectuées par une transaction

Souvent, ces deux journaux sont stockés dans un même fichier. Pour chaque mise à jour on stocke l'image avant et après.  

`/!\` Pour être utile, il faut que l'écriture dans le journal soit effectuée avant la modification de la BD.

Sauvegarde du journal:  
À chaque mise à jour, il faut enregistrer une image avant et une image après. Afin d'améliorer les performances, les enregistrements du journal sont généralement gardés en mémoire tampon et écrites sur le disque lorsque le tampon est plein ou lorsqu'un délai maximal est atteint.  

Il faut alors bloquer les transactions "validées" concernées et ne les écrire sur le disque qu'à ce moment là.  
Il est également nécessaire de gérer la purge du journal pour éviter d'avoir un journal de taille trop importante.

Validation des transactions:  
Plusieurs techniques de validation des transactions. Deux principales.

### Modification immédiate

+ début de transaction: enregistrement dans le journal
+ mise à jour: 
  + enregistrement écriture dans le journal
  + modification en mémoire
+ fin de transaction: enregistrement dans le journal

Pour assurer l'isolation, les modifications apportée par une transaction sont verrouillées jusqu'à ce que la transaction soit validée.  

**En cas de panne** reprise à chaud:  
> Protocole UNDO-REDO  
> On part du dernier point de reprise et on identifie dans le journal les transactions validées et les transactions actives. On part de la fin du journal et on défait toutes les modifications effectuées puis on refait toutes les modifications effectuées par les transactions validées.

Exemple: dernier point de sauvegarde A=10, B=300, C=4
> Journal:
> 1. <T$_1$, DEBUT>
> 2. <T$_2$, DEBUT>
> 3. <T$_1$, B, 200, 220>
> 4. <T$_2$, A, 10, 11>
> 5. <T$_3$, DEBUT>
> 6. <T$_3$, C, 4, 7>
> 7. <T$_1$, COMMIT>  
> `PANNE`

|   #   |        UNDO        |   #   |        REDO        |
| :---: | :----------------: | :---: | :----------------: |
| **7** |                    | **1** |                    |
| **6** |  C $\leftarrow$ 4  | **2** | B $\leftarrow$ 220 |
| **5** |                    | **3** |                    |
| **4** | A $\leftarrow$ 10  | **4** |                    |
| **3** | B $\leftarrow$ 200 | **5** |                    |
| **2** |                    | **6** |                    |
| **1** |                    | **7** |                    |

### Modification à la validation

+ début de transaction: enregistrement début dans le journal
+ Mise à jour: enregistement écrits dans le journal (BD non modifiée - pas nécessaire de stocker les images avant)
+ fin de la transaction:
  + enregistrement fin dans le journal
  + (si commit) mises à jour effectuées sur la base en utilisant les enregistrements du journal

Reprise à chaud:

> On lit le journal pour identifier les transactions actives et les transactions validées. Puis onrelit le journal à partir du dernier point de reprise en rejouant toutes les modifications des transactions validées.

Exemple: `SCH 7`

## Exercice

|   #   |    Transaction    |      État T.      |
| :---: | :---------------: | :---------------: |
|   1   |  <T$_1$, DEBUT>   |   T$_1$ Active    |
|   2   | <T$_1$, A, 0, 1>  |                   |
|   3   |  <T$_2$, DEBUT>   |   T$_2$ Active    |
|   4   | <T$_2$, B, 5, 3>  |                   |
|   5   | <T$_1$, C, 2, 4>  |                   |
|   6   |  <T$_1$, COMMIT>  | **T$_1$ Validée** |
|   7   | <T$_2$, C, 4, 6>  |                   |
|   8   |  <T$_3$, DEBUT>   |                   |
|   9   | <T$_3$, A, 1, 3>  |                   |
|  10   | <T$_2$, ROLLBACK> | **T$_2$ Avortée** |
|  11   | <T$_3$, B, 5, 6>  |                   |
|  12   |  <T$_3$, COMMIT>  | **T$_3$ Validée** |
|  13   |  <T$_5$, DEBUT>   | **T$_5$ Active**  |
|  14   | <T$_5$, A, 3, 7>  |                   |

1. Transactions actives et validées?
> T$_1$ validée, T$_3$ validée, T$_5$ active.

2. UNDO-REDO

|   #    |       UNDO       |   #    |       REDO       |
| :----: | :--------------: | :----: | :--------------: |
| **14** | A $\leftarrow$ 3 | **1**  |                  |
| **13** |                  | **2**  | A $\leftarrow$ 1 |
| **12** |                  | **3**  |                  |
| **11** | B $\leftarrow$ 5 | **4**  |                  |
| **10** |                  | **5**  | C $\leftarrow$ 4 |
| **9**  | A $\leftarrow$ 1 | **6**  |                  |
| **8**  |                  | **7**  |                  |
| **7**  | C $\leftarrow$ 4 | **8**  |                  |
| **6**  |                  | **9**  | A $\leftarrow$ 3 |
| **5**  | C $\leftarrow$ 2 | **10** |                  |
| **4**  | B $\leftarrow$ 5 | **11** | B $\leftarrow$ 6 |
| **3**  |                  | **12** |                  |
| **2**  | A $\leftarrow$ 0 | **13** |                  |
| **1**  |                  | **14** | A $\leftarrow$ 7 |

3. Valeurs à la fin de la reprise à chaud ?

| Variable | Value |
| :------: | :---: |
|    A     |   3   |
|    B     |   5   |
|    C     |   4   |
4. No UNDO-REDO

|   #    |       REDO       |
| :----: | :--------------: |
| **1**  |                  |
| **2**  | A $\leftarrow$ 1 |
| **3**  |                  |
| **4**  |                  |
| **5**  | C $\leftarrow$ 4 |
| **6**  |                  |
| **7**  |                  |
| **8**  |                  |
| **9**  | A $\leftarrow$ 3 |
| **10** |                  |
| **11** | B $\leftarrow$ 6 |
| **12** |                  |
| **13** |                  |
| **14** | A $\leftarrow$ 7 |

## Transactions sur une base données distribuée

![SCH 8](../CM/Schemas/SCH8.jpg)

### Protocole de validation à deux commits (2PC)

Soient un site initiateur et n sites distants.  

#### Initiateur

+ Demander le verrou local `LOCK(X,W)`
+ Envoyer un message au sites distants `A-LOCK(X,W)`
+ Attendre la réponse des sites distants
+ Si tous les sites distants envoient `R-LOCK(X,W,OK)`:
  + Mise à jour locale avec `UPDATE(X), UNLOCK(X)`
  + Envoie d'un message de confirmation `C-UPDATE(X,V)`
+ Sinon :
  + Échec de la mise à jour, `UNLOCK(X)`
  + Annulation envoyée aux sites distants `ROLLBACK(X)`

#### Sites distants

+ Réception d'un `A-LOCK(X,W)`
    + vérification si `LOCK(X,W)`:
      + si oui: `LOCK(X,W)`, envoi de `R-LOCK(X,W,OK)`
      + si non `R-LOCK(X,W,NO)`
+ Réception d'un `C-UPDATE(X,V)`
  + `UPDATE(X)`
  + `UNLOCK(X)`
+ Réception d'un `ROLLBACK(X)`: `UNLOCK(X)`

#### Schema Exemple

![SCH9](../CM/Schemas/SCH9.jpg)

