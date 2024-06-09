from django.db import models
from django.db.models import CheckConstraint, Q

class Admin(models.Model):
    idAdmin = models.AutoField(primary_key=True)
    mail = models.CharField(max_length=45, unique=True)
    mdp = models.CharField(max_length=45)

    class Meta:
        db_table = 'admins'
    
##Les Division


class Division(models.Model):
    idDivision = models.AutoField(primary_key=True)
    DIV_CHOICES = [
        ('Niveau', 'Niveau'),
        ('Specialite', 'Specialite'),
        ('Section', 'Section'),
        ('Groupe', 'Groupe'),
    ]
    typeDivision = models.CharField(max_length=10, choices=DIV_CHOICES, null=False)
    surDivision = models.ForeignKey('self', on_delete=models.CASCADE, null=True, blank=True)
    libele = models.CharField(max_length=45, null=False)
    nbrEtudiant = models.IntegerField(null=True) 

    

    class Meta:
        db_table = 'divisions'




class Module(models.Model):
    idModule = models.AutoField(primary_key=True)
    libélé = models.CharField(max_length=90, unique=True)

    class Meta:
        db_table = 'modules'



class Enseignant(models.Model):
    idEnseignant = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=45, null=True)
    prenom = models.CharField(max_length=45, null=True)
    GRADE_CHOICES = [
        ('MCA', 'MCA'),
        ('MCB', 'MCB'),
        ('Pr', 'Pr'),
        ('MAA', 'MAA'),
        ('Vac', 'Vac'),
        ('Doc', 'Doc'),
    ]
    grade = models.CharField(max_length=3, choices=GRADE_CHOICES, null=True)
    mail = models.CharField(max_length=90, null=True)
    mdp = models.CharField(max_length=45, null=True)
    heureMax = models.TimeField(default='06:00:00')

    class Meta:
        db_table = 'enseignants'


class IndispoEnseignant(models.Model):
    idIndspo = models.AutoField(primary_key=True)
    idEnseignant = models.ForeignKey(Enseignant, on_delete=models.CASCADE)
    JOUR_CHOISES=[
        ('Dim','Dim'),
        ('Lun','Lun'),
        ('Mar','Mar'),
        ('Mer','Mer'),
        ('Jeu','Jeu'),
    ]
    jour = models.CharField(max_length=3, choices=JOUR_CHOISES, null=True)
    start = models.TimeField()
    end = models.TimeField()

    class Meta:
        db_table = 'indispoenseignant'
        constraints = [
             models.CheckConstraint(check=models.Q(start__lt=models.F('end')), name='start_lt_end'),
        ]
        


class Salle(models.Model):
    idSalles = models.AutoField(primary_key=True)
    libelle = models.CharField(max_length=45, null=False, unique=True)
    capacite = models.IntegerField(null=False)
    tp = models.BooleanField(default=False)


    class Meta:
        db_table = 'salles'




class Etudiant(models.Model):
    idEtudiant = models.AutoField(primary_key=True)
    nom = models.CharField(max_length=45, null=False)
    prenom = models.CharField(max_length=45, null=False)
    mail = models.EmailField(unique=True, null=False)
    mdp = models.CharField(max_length=45, null=False)
    idDivision = models.ForeignKey(Division, on_delete=models.SET_NULL, null=True) #check que c'est un type Groupe

    class Meta:
        db_table = 'etudiants'


class EtudierModule(models.Model):
    idEtudierModule = models.AutoField(primary_key=True)
    idDivision = models.ForeignKey(Division, null=False,  on_delete=models.CASCADE)  #e# #check cours==Specialité ; check TD,TP==Groupe
    idModule = models.ForeignKey(Module, null=False, on_delete=models.CASCADE) #e#
    TYPE_ETUDE_CHOISES=[
        ('COURS','COURS'),
        ('TD','TD'),
        ('TP','TP'),
    ]
    typeEtude = models.CharField(max_length=5, choices=TYPE_ETUDE_CHOISES, null=False)

    ##nbrEtudiant


    class Meta:
        db_table = 'etudiermodules'

class EnseignerModule(models.Model):
    idEnseignerModule = models.AutoField(primary_key=True)
    idEnseignant = models.ForeignKey(Enseignant, null=False, on_delete=models.CASCADE) #e#
    idModule = models.ForeignKey(Module, null=False, on_delete=models.CASCADE)  #e#
    TYPE_ENSEIGNEMENT_CHOISES=[
        ('COURS','COURS'),
        ('TD','TD'),
        ('TP','TP'),
    ]
    typeEnseignement = models.CharField(max_length=5, choices=TYPE_ENSEIGNEMENT_CHOISES, null=False)

    class Meta:
        db_table = 'enseignermodules'


class Horaire(models.Model):
    idHoraire = models.AutoField(primary_key=True)
    JOUR_CHOISES=[
        ('Dim','Dim'),
        ('Lun','Lun'),
        ('Mar','Mar'),
        ('Mer','Mer'),
        ('Jeu','Jeu'),
    ]
    jour = models.CharField(max_length=3, choices=JOUR_CHOISES, null=True)
    HEURED_CHOISES=[
        ('08h00','08h00'),
        ('09h40','09h40'),
        ('11h20','11h20'),
        ('13h00','13h00'),
        ('14h40','14h40'),
        ('16h20','16h20'),
    ]
    heureD = models.CharField(max_length=5, choices=HEURED_CHOISES, null=True)
    HEUREF_CHOISES=[
        ('09h30','09h30'),
        ('11h10','11h10'),
        ('12h50','12h50'),
        ('14h30','14h30'),
        ('16h10','16h10'),
        ('17h50','17h50'),
    ]
    heureF = models.CharField(max_length=5, choices=HEUREF_CHOISES, null=True)

    class Meta:
        db_table = 'horaires'



class Programme(models.Model):
    idProgramme = models.AutoField(primary_key=True)
    horaire = models.ForeignKey(Horaire, null=False, on_delete=models.CASCADE)
    salle = models.ForeignKey(Salle, null=False, on_delete=models.CASCADE)
    enseignant = models.ForeignKey(Enseignant, null=False, on_delete=models.CASCADE)
    seance = models.ForeignKey(EtudierModule, null=False, on_delete=models.CASCADE)

    class Meta:
        db_table = 'programme'

