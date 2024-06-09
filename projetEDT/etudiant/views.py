from audioop import reverse
from django.shortcuts import *
from .models import *
from django.contrib.auth import *
from django import forms
from django.contrib.auth.forms import AuthenticationForm
from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Admin, Enseignant, Etudiant

### Récupérer la liste des étudiants
def etudiant_page(request):
    Etudiants = Etudiant.objects.all()
    return render(request, 'listetudiant.html', {'etudiants': Etudiants})

### Récupérer la liste des admins
def admins_page(request):
    Admins = Admin.objects.all()
    return render(request, 'listadmins.html', {'Admins': Admins})

def EDT_page(request):
    Admins = Admin.objects.all()
    return render(request, 'EDT.html', {'Admins': Admins})

### Récupérer la liste des modules
def module_page(request):
    module = Module.objects.all()
    return render(request, 'Modules.html', {'modules': module})

### Récupérer la liste des Enseignants
def enseignant_page(request):
    Enseignants = Enseignant.objects.all()
    return render(request, 'listprof.html', {'enseignants': Enseignants})

### Récupérer la liste des salles
def salles_page(request):
    Salles = Salle.objects.all()
    return render(request, 'Salles.html', {'salles': Salles})

### Récupérer la liste des Division
def specialite_page(request):
    Specialites = Division.objects.all()
    return render(request, 'Spécialités.html', {'specialites': Specialites})

### Dashboard Admin
def index(request):
    return render(request, 'index.html')

### Dashboard Enseignant
def index_e(request):
    return render(request, 'Enseignants.html')

def enseignant_dashboard(request):
    user_id = request.session.get('idEnseignant')
    user_type = request.session.get('user_type')

    if user_id and user_type == 'Enseignant':
        enseignant = Enseignant.objects.get(id=user_id)
        context = {
            'enseignant': enseignant
        }
        return render(request, 'Enseignants.html', context)
    else:
        return redirect('signin')  # Rediriger vers la page de connexion si l'utilisateur n'est pas authentifié


### Authentification
from django.contrib.auth import authenticate, login

def signin(request):
    if request.method == 'POST':
        stype = request.POST.get('stype')
        email = request.POST.get('email')
        password = request.POST.get('password')

        user = None

        if stype == 'Admin':
            user = Admin.objects.filter(mail=email, mdp=password).first()
        elif stype == 'Enseignant':
            user = Enseignant.objects.filter(mail=email, mdp=password).first()
        elif stype == 'Etudiant':
            user = Etudiant.objects.filter(mail=email, mdp=password).first()

        if user is not None:
            # Rediriger l'utilisateur vers la page appropriée
            if stype == 'Admin':
                return redirect('admin_dashboard')
            elif stype == 'Enseignant':
                return redirect('enseignant_dashboard')
            elif stype == 'Etudiant':
                return redirect('etudiant_dashboard')
        else:
            # Afficher un message d'erreur
            messages.error(request, "Erreur d'authentification. Veuillez vérifier vos informations.")

    # Renvoyer le modèle signin.html pour afficher le formulaire de connexion
    return render(request, 'signin.html')

### Ajouter un admin
def ajoutAdmin(request):

        if request.method == 'POST':
            mail = request.POST.get('email')
            mdp = request.POST.get('mdp')
            
            admin = Admin.objects.create(mail=mail, mdp=mdp)
            admin.save()
            
            return redirect('admins_page')
            
            #return redirect('signup_success')  # Rediriger vers une page de succès
        return render(request, 'listadmins.html')

### Ajouter un module
def ajoutModule(request):
    
        if request.method == 'POST':
            lib = request.POST.get('libele')
            module = Module.objects.create(libélé=lib)
            module.save()
            
            return redirect('module_page')  # Remplacez 'liste_enseignants' par le nom de votre vue de liste d'enseignants

    # Si la méthode HTTP n'est pas POST, afficher la page d'ajout d'enseignant
        return render(request, 'Modules.html')
    
### Affecter un module
def affecterModule(request):
    
        if request.method == 'POST':
            type = request.POST.get('type')
            nom = request.POST.get('nom')
            prenom = request.POST.get('prenom')
            module = request.POST.get('module')
            
            enseignant = Enseignant.objects.get(nom=nom, prenom=prenom)
            module = Module.objects.get(libélé=module)
            
            affect_mod = EnseignerModule(idEnseignant=enseignant, idModule=module, typeEnseignement=type)
            affect_mod.save()
            
            return redirect('module_page')
        
        return render(request, 'Modules.html')
    
###Etudier Module
def etudiermodule(request):
    
        if request.method == 'POST':
            type = request.POST.get('type')
            division = request.POST.get('division')
            module = request.POST.get('module')
            
            m = Module.objects.get(Module.libele)
            
            division = Division.objects.get(libele=division)
            module = Module.objects.get(libélé=module)
            
            etd_mod = EtudierModule(idDivision=division, idModule=module, typeEtude=type)
            etd_mod.save()
            
            return redirect('module_page')
        
        return render(request, 'Modules.html')

    
from django.shortcuts import render, redirect
from .models import Enseignant

### Ajouter un Enseignant
def ajoutEnseignant(request):
    if request.method == 'POST':
        nom = request.POST.get('nom')
        prenom = request.POST.get('prenom')
        grade = request.POST.get('grade')
        email = request.POST.get('email')
        password = request.POST.get('password')

        # Créer un nouvel enseignant dans la base de données
        enseignant = Enseignant.objects.create(
            nom=nom,
            prenom=prenom,
            grade=grade,
            mail=email,
            mdp=password
        )
        # Enregistrer l'enseignant
        enseignant.save()

        # Rediriger vers une page de succès ou une autre vue
        return redirect('prof_page')  # Remplacez 'liste_enseignants' par le nom de votre vue de liste d'enseignants

    # Si la méthode HTTP n'est pas POST, afficher la page d'ajout d'enseignant
    return render(request, 'listprof.html')  # Remplacez 'ajout_enseignant.html' par le nom de votre template d'ajout d'enseignant

### Ajouter une Division
def ajout_specialite(request):
    if request.method == 'POST':
        type_d = request.POST.get('type')
        libele = request.POST.get('libele')
        nbr_eleves = request.POST.get('nombre')
        sur_div = request.POST.get('surtype')
        
        div = Division.objects.get(libele=sur_div)
        
        division= Division.objects.create(
            typeDivision=type_d,
            libele=libele,
            nbrEtudiant=nbr_eleves,
            surDivision=div
        )
    
        division.save()
        
        return redirect('specialite_page')  # Redirection vers la page de liste des spécialités après l'ajout
    
    return render(request, 'Spécialités.html')

### Ajouter un Etudiant
def ajout_etudiant(request):
    if request.method == 'POST':
        n = request.POST.get('nom')
        p = request.POST.get('prenom')
        e = request.POST.get('email')
        m = request.POST.get('mdp')
        sur_div = request.POST.get('surtype')
        
        
            # Récupérer l'ID de la division en fonction du libele
        div = Division.objects.get(libele=sur_div)
            
            # Créer une nouvelle spécialité avec les données fournies
        nouveau_etudiant = Etudiant(nom=n, prenom=p, mail=e, mdp=m, idDivision=div)
        nouveau_etudiant.save()
            
        return redirect('etudiant_page')  # Redirection vers la page de liste des étudiants après l'ajout
        
    
    return render(request, 'listetudiant.html')


### Ajouter une Salle
def ajout_salle(request):
    if request.method == 'POST':
        l = request.POST.get('libele')
        c = request.POST.get('capacite')
        tp = request.POST.get('tp')
        
        # Créer une nouvelle spécialité avec les données fournies
        nouvelle_salle = Salle(libelle=l, capacite=c, tp=tp)
        nouvelle_salle.save()
        
        return redirect('salle_page')  # Redirection vers la page de liste des spécialités après l'ajout
    
    return render(request, 'listsalles.html')
 
### Supprimer un étudiant
def supprimer_ligne_etudiant(request, user_id):
    if request.method == 'POST':
        try:
            # Chercher l'étudiant par son idEtudiant
            etudiant = Etudiant.objects.get(idEtudiant=user_id)
            # Supprimer l'étudiant de la base de données
            etudiant.delete()
            # Rediriger vers la même page après la suppression
            return redirect('etudiant_page')
        except Etudiant.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
            pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')$
    
### Supprimer un admin
def supprimer_ligne_admin(request, user_id):
    if request.method == 'POST':
        try:
            # Chercher l'étudiant par son idEtudiant
            admin = Admin.objects.get(idAdmin=user_id)
            # Supprimer l'étudiant de la base de données
            admin.delete()
            # Rediriger vers la même page après la suppression
            return redirect('admins_page')
        except Admin.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
            pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')$
    
### Supprimer un module
def supprimer_ligne_module(request, user_id):
    if request.method == 'POST':
        try:
            # Chercher l'étudiant par son idEtudiant
            module = Module.objects.get(idModule=user_id)
            # Supprimer l'étudiant de la base de données
            module.delete()
            # Rediriger vers la même page après la suppression
            return redirect('module_page')
        except Module.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
            pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')
 
###Supprimer un enseignant   
def supprimer_ligne_enseignant(request, user_id):
        if request.method == 'POST':
            try:
            # Chercher l'étudiant par son idEtudiant
                enseignant = Enseignant.objects.get(idEnseignant=user_id)
            # Supprimer l'étudiant de la base de données
                enseignant.delete()
            # Rediriger vers la même page après la suppression
                return redirect('prof_page')
            except Enseignant.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
                pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')

###Supprimer une salle    
def supprimer_ligne_salle(request, user_id):
        if request.method == 'POST':
            try:
            # Chercher l'étudiant par son idEtudiant
                salle = Salle.objects.get(idSalles=user_id)
            # Supprimer l'étudiant de la base de données
                salle.delete()
            # Rediriger vers la même page après la suppression
                return redirect('salle_page')
            except Enseignant.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
                pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')
 
### Supprimer une Spécilaité   
def supprimer_ligne_specialite(request, user_id):
        if request.method == 'POST':
            try:
            # Chercher l'étudiant par son idEtudiant
                specialites = Division.objects.get(idDivision=user_id)
            # Supprimer l'étudiant de la base de données
                specialites.delete()
            # Rediriger vers la même page après la suppression
                return redirect('specialite_page')
            except Division.DoesNotExist:
            # Gérer le cas où l'étudiant n'existe pas
            # Peut-être rediriger vers une page d'erreur
                pass
    # Gérer le cas où la méthode de requête n'est pas POST
    # Peut-être rediriger vers une page d'erreur ou renvoyer un message
    # return redirect('etudiant_page') ou render(request, 'error.html')
    
### Modifier un Enseignant 
def modifier_enseignant(request, enseignant_id):
        # Récupérer l'enseignant spécifique en filtrant par son ID
    try:
        enseignant = Enseignant.objects.get(idEnseignant=enseignant_id)
    except Enseignant.DoesNotExist:
        # Gérer le cas où l'enseignant n'existe pas
        return redirect('page_404')  # Rediriger vers une page d'erreur 404 par exemple
        
    if request.method == 'POST':
        # Traitement du formulaire si la requête est de type POST
        enseignant.nom = request.POST.get('m_nom')
        enseignant.prenom = request.POST.get('m_prenom')
        enseignant.grade = request.POST.get('m_grade')
        enseignant.mail = request.POST.get('m_mail')
       
        # Mettez à jour les autres champs si nécessaire
        
        # Enregistrez les modifications dans la base de données
        enseignant.save()
        
        # Redirigez l'utilisateur vers une autre vue ou une autre URL après la modification
        return redirect('prof_page')  # Rediriger vers une page de succès de modification par exemple
    else:
        # Si la méthode HTTP est GET, afficher le formulaire avec les données de l'enseignant
        context = {
            'enseignant': enseignant
        }
        return render(request, 'listprof.html', context)
    

### Modifier un Admin
def modifier_admin(request, admin_id):
        # Récupérer l'enseignant spécifique en filtrant par son ID
    try:
        admin = Admin.objects.get(idAdmin=admin_id)
    except Admin.DoesNotExist:
        # Gérer le cas où l'enseignant n'existe pas
        return redirect('page_404')  # Rediriger vers une page d'erreur 404 par exemple
        
    if request.method == 'POST':
        # Traitement du formulaire si la requête est de type POST
        admin.mail = request.POST.get('m_mail')
        admin.mdp = request.POST.get('m_mdp')
       
        # Mettez à jour les autres champs si nécessaire
        
        # Enregistrez les modifications dans la base de données
        admin.save()
        
        # Redirigez l'utilisateur vers une autre vue ou une autre URL après la modification
        return redirect('admins_page')  # Rediriger vers une page de succès de modification par exemple
    else:
        # Si la méthode HTTP est GET, afficher le formulaire avec les données de l'enseignant
        context = {
            'admin': admin
        }
        return render(request, 'listadmins.html', context)
    
### Modifier un Module
def modifier_module(request, module_id):
        # Récupérer l'enseignant spécifique en filtrant par son ID
    try:
        module = Module.objects.get(idModule=module_id)
    except Module.DoesNotExist:
        # Gérer le cas où l'enseignant n'existe pas
        return redirect('page_404')  # Rediriger vers une page d'erreur 404 par exemple
        
    if request.method == 'POST':
        # Traitement du formulaire si la requête est de type POST
        module.libélé = request.POST.get('m_libele')
       
        # Mettez à jour les autres champs si nécessaire
        
        # Enregistrez les modifications dans la base de données
        module.save()
        
        # Redirigez l'utilisateur vers une autre vue ou une autre URL après la modification
        return redirect('module_page')  # Rediriger vers une page de succès de modification par exemple
    else:
        # Si la méthode HTTP est GET, afficher le formulaire avec les données de l'enseignant
        context = {
            'module': module
        }
        return render(request, 'Modules.html', context)
    
### Modifier une Salle
def modifier_salle(request, salle_id):
        # Récupérer l'enseignant spécifique en filtrant par son ID
    try:
        salle = Salle.objects.get(idSalles=salle_id)
    except Salle.DoesNotExist:
        # Gérer le cas où l'enseignant n'existe pas
        return redirect('page_404')  # Rediriger vers une page d'erreur 404 par exemple
        
    if request.method == 'POST':
        # Traitement du formulaire si la requête est de type POST
        salle.libelle = request.POST.get('m_libele')
        salle.capacite = request.POST.get('m_capacite')
        salle.tp = request.POST.get('m_tp')
       
        # Mettez à jour les autres champs si nécessaire
        
        # Enregistrez les modifications dans la base de données
        salle.save()
        
        # Redirigez l'utilisateur vers une autre vue ou une autre URL après la modification
        return redirect('salle_page')  # Rediriger vers une page de succès de modification par exemple
    else:
        # Si la méthode HTTP est GET, afficher le formulaire avec les données de l'enseignant
        context = {
            'salle': salle
        }
        return render(request, 'listsalles.html', context)
    
### Modifier une division
def modifier_division(request, division_id):
    try:
        division = Division.objects.get(idDivision=division_id)
    except Division.DoesNotExist:
        return redirect('page_404')
        
    if request.method == 'POST':
        division.typeDivision = request.POST.get('m_type')
        division.libele = request.POST.get('m_libele')
        division.nbrEtudiant = request.POST.get('m_nbr')

        surdivision_libele = request.POST.get('m_surtype')
        if surdivision_libele:
            try:
                surdivision = Division.objects.get(libele=surdivision_libele)
            except Division.DoesNotExist:
                surdivision = None
        else:
            surdivision = None

        division.surDivision = surdivision
        
        division.save()
        
        return redirect('specialite_page')
    else:
        context = {
            'division': division,
        }
        return render(request, 'Spécialités.html', context)
    
### Modifier Etudiant
from django.shortcuts import render, redirect, get_object_or_404
from .models import Etudiant, Division

def modifier_etudiant(request, etudiant_id):
    etudiant = get_object_or_404(Etudiant, idEtudiant=etudiant_id)

    if request.method == 'POST':
        print("POST data received:", request.POST)
        etudiant.nom = request.POST.get('m_nom')
        etudiant.prenom = request.POST.get('m_prenom')
        etudiant.mail = request.POST.get('m_mail')
        etudiant.mdp = request.POST.get('m_mdp')
        
        surdivision_libele = request.POST.get('m_surtype')
        print("Surdivision libele received:", surdivision_libele)
        
        if surdivision_libele:
            try:
                surdivision = Division.objects.get(libele=surdivision_libele)
                etudiant.idDivision = surdivision
                print("Surdivision found:", surdivision)
            except Division.DoesNotExist:
                print("Surdivision does not exist")
                context = {
                    'etudiant': etudiant,
                    'error_message': 'La division spécifiée n\'existe pas.'
                }
                return render(request, 'listetudiant.html', context)
        else:
            etudiant.idDivision = None

        etudiant.save()
        print("Etudiant saved:", etudiant)
        
        return redirect('etudiant_page')

    context = {
        'etudiant': etudiant,
    }
    return render(request, 'listetudiant.html', context)





##########################################################
'''objectif : récuprer une liste des créneaux, des salles, des enseignants (EnseignerModule), des séances (EtudierModule), puis associer à chaque combinaison possible un coût'''
from .models import Horaire, EnseignerModule, Salle, EtudierModule,Programme
from .recup import gquery2list as q2l 
from .recup import combi_seance as cs
from .optimisation import optimisation as opti
def build_programme():
    try:
        ###la recup
        horaires = q2l(Horaire.Objects.all())
        salles = q2l(Salle.Objects.all())
        enseignements = q2l(EnseignerModule.Objects.all())
        seances = q2l(EtudierModule.Objects.all())
        
        ###les combinaisons
        combi=cs(horaires,salles,seances,enseignements)

        ###la soluce stocké dans la classe Programme
        opti(combi,Programme)



    except:
        print("unexpected error ._.")
        