
SELECT habitation.id, COUNT(habitation_item.item_id) AS ItemsCount
FROM habitation, habitation_item
WHERE habitation.id = habitation_item.habitation_id
GROUP BY habitation.id

SELECT habitation.id, COUNT(habitation_optionpayante.optionpayante_id) AS OptionsPayantesCount
FROM habitation, habitation_optionpayante
WHERE habitation.id = habitation_optionpayante.habitation_id
GROUP BY habitation.id








SELECT *
FROM habitation
LEFT JOIN 
    (SELECT habitation.id, COUNT(habitation_item.item_id) AS ItemsCount
    FROM habitation, habitation_item
    WHERE habitation.id = habitation_item.habitation_id
    GROUP BY habitation.id) AS ItemsCount
ON habitation.id = ItemsCount.id



CREATE VIEW habitation_itemscount_optionpayantecount
AS
SELECT *
FROM habitation
LEFT JOIN (
		SELECT habitation.id as itemhabitationid, COUNT(habitation_item.item_id) AS ItemsCount
    FROM habitation, habitation_item
    WHERE habitation.id = habitation_item.habitation_id
    GROUP BY habitation.id) AS itemsCount
ON habitation.id = itemsCount.itemhabitationid
LEFT JOIN (
		SELECT habitation.id AS optionhabitationid, COUNT(habitation_optionpayante.optionpayante_id) AS OptionsPayantesCount
		FROM habitation, habitation_optionpayante
		WHERE habitation.id = habitation_optionpayante.habitation_id
		GROUP BY habitation.id) AS optionsPayantesCount
ON habitation.id = optionsPayantesCount.optionhabitationid



SELECT id,typehabitat_id,libelle,description,adresse,id_ville,image,habitantsmax,chambres,lits,sdb,superficie,prixmois
FROM habitation_itemscount_optionpayantecount
order by ItemsCount DESC, OptionsPayantesCount DESC
limit 0,10



CREATE OR REPLACE VIEW habitation_itemscount_optionpayantecount
AS
SELECT * 
FROM habitation
LEFT JOIN (
		SELECT habitation.id as itemhabitationid, COUNT(habitation_item.item_id) AS ItemsCount
    FROM habitation, habitation_item
    WHERE habitation.id = habitation_item.habitation_id
    GROUP BY habitation.id) AS itemsCount
ON habitation.id = itemsCount.itemhabitationid
LEFT JOIN (
		SELECT habitation.id AS optionhabitationid, COUNT(habitation_optionpayante.optionpayante_id) AS OptionsPayantesCount
		FROM habitation, habitation_optionpayante
		WHERE habitation.id = habitation_optionpayante.habitation_id
		GROUP BY habitation.id) AS optionsPayantesCount
ON habitation.id = optionsPayantesCount.optionhabitationid
ORDER BY ItemsCount DESC, OptionsPayantesCount DESC
LIMIT 0,10
