/*  */

/* Date d'un article donné par son identifiant */
SELECT date_debut_etat 
FROM article NATURAL JOIN histo_article
WHERE id_article = getDate.id_article