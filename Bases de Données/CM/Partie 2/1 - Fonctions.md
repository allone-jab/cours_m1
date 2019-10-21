# Les Fonctions

## Étendre SQL

PostgreSQL est un SGBD extensible.

## Types de Données

Séquences? Vues?  
Plusieurs familles de types: numériques, caractères, binaires...

## Déclarations

```sql
nom [ CONSTANT ] type [ NOT NULL ] [ DEFAULT expr ];

id_utilisateur INTEGER;
quantite NUMERIC(5);
url VARCHAR;
ma_ligne nom_table%ROWTYPE;
mon_champ nom_table.nom_colonne%TYPE
une_ligne RECORD;
```

S'il n'y a pas de valeur par défaut, alvariable est assignée à la valeur NULL.

## Instructions de base

### Affectation

`variable := expression ;`

### Requête avec résultat

`SELECT expressions_select INTO [STRICT] cible FROM ...;`  
`INSERT ... RETURNING expressions INTO [STRICT] cible`  
`UPDATE ... RETURNING expressions INTO [STRICT] cible`  
`DELETE ... RETURNING expressions INTO [STRICT] cible`

où cible peut être une variable de type RECORD, ROW ou une liste de variables ou de champs de RECORD/ROW séparées par des virgules.

```sql
select * into monrec from emp where nom = mon_nom;
select * into strict monrec from emp where nom = mon_nom;
```

Si l'option `strict` est indiquée, la requête doit retourner exactement une ligne. Dans le cas contraire, une erreur sera rapportée à l'exécution.

Si `strict` n'es pas spécifié dans la clause `INTO`, alors cible sera configuré avec la première ligne retournée par la requête ou à NULL si la requête n'a retourné aucune ligne.

Notez que la "première ligne" n'est bien définie que si vous avez utilisé `ORDER BY`.  
Vous pouvez vérifier la valeur de la variable spéciale `FOUND` pour déterminer si une ligne a été retournée:

```sql
select * into monrec from emp where nom = mon_nom;
if not found then
    raise exception 'employe introuvable'
end if;
```

### Requête sans résultat

`PERFORM requête;`  

### Instructions dynamiques

`EXECUTE chaîne [ INTO [STRICT] cible ] USING exp, ... ];`

Les expressions USING fournoissent des valeurs à insérer dans l'instruction.

```sql
execute
'select * from adherent where prix < $1 and date < $2'
into resultat
using max_prix, max_date;
```

Si on veut utiliser un des noms de tables ou colonnes d"terminés dynamiquement, on doit les insérer dans la chaîne.

```sql
execute 'select * from '
nomtable::regclass
'where prix < $1 and date < $2'
into resultat
using max_prix, max_date;
```

### Obtention du statut du résultat

La prmeière méthode pour déterminer l'effet d'une instruction est d'utiliser les `GET DIAGNOSTICS`

`GET [ CURRENT ] DIAGNOSTICS variables = élément, ... ;`

Les éléments d'état actuellement disponibles sont:

* ROW_COUNT: le nombre de lignes traitées par la dernière instruction
* RESULT_OID, l'OID de la dernière ligne insérée par l'instruction SQL la plus récente

### La variable FOUND

Elle est initialisée à False au début de chaque instruction PL/pgSQL, ensuite:

* SELECT INTO, PERFORM et FETCH: true si au moins une ligne retournée
* UPDATE, INSERT et DELETE: true si au moins une ligne affectée
* MOVE: true si repositionne le curseur avec succès
* FOR et FOREACH: true s'il y a au moins une itération. FOUND n'est pas modifié à l'intérieur de la boucle, bien qu'il pourrait être modifié par l'exécution d'autres requêtes dans la boucle.
* RETURN QUERY et RETURN QUERY EXECUTE: true si au moins une logne retournée

