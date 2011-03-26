# get link of Activite and Compte
select a.*, b.FK_Compte, c.FK_Projet from dbo.Activite___ a, dbo.Rubrique___ c, dbo.Projet_____ b where c.Id=a.FK_Rubrique AND c.FK_Projet=b.Id