"""
URL configuration for projetEDT project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from etudiant import views

urlpatterns = [
    
    path('', views.signin, name='signin'),
    path('signup/', views.ajoutAdmin, name='signup'),
    path('admin/', views.index, name='admin_dashboard'),
    path('admin/index.html', views.index, name='admin_dashboard'),
    path('admin/index/index.html', views.index, name='admin_dashboard'),
    path('admin/index/listprof.html', views.enseignant_page, name='enseignant_page'),
    path('admin/index/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/index/listsalles.html', views.salles_page, name='salles_page'),
    path('admin/index/Salles.html', views.salles_page, name='salles_page'),
    path('admin/index/Salles.html.html', views.salles_page, name='salles_page'),
    path('admin/index/listsalles.html.html', views.salles_page, name='salles_page'),
    path('admin/index/Spécialités.html', views.specialite_page, name='specialite_page'),
    path('admin/index/Modules.html', views.module_page, name='module_page'),
    path('admin/index/listadmins.html', views.admins_page, name='admins_page'),
    path('admin/index/EDT.html', views.EDT_page, name='admins_page'),
    
    path('Enseignant/dashboard', views.enseignant_dashboard, name='enseignant_dashboard'),
    
    path('listetudiant/', views.etudiant_page, name='etudiant_page'),
    path('listetudiant/ajouter', views.ajout_etudiant, name='ajoutetudiant'),
    path('listetudiant/supprimer/<int:user_id>/', views.supprimer_ligne_etudiant, name='supprimer_ligne_etudiant'),
    path('listetudiant/modifier/<int:etudiant_id>/', views.modifier_etudiant, name='modifier_etudiant'),
    path('admin/listetudiant.html/', views.etudiant_page, name='etudiant_page'),
    path('admin/listetudiant.html/index.html', views.index, name='index'),
    path('admin/listetudiant.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/listetudiant.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/listetudiant.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/listetudiant.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listetudiant.html/Spécialités.html.html', views.specialite_page, name='salle_page'),
    path('admin/listetudiant.html/Modules.html', views.module_page, name='module_page'),
    path('admin/listetudiant.html/listadmins.html', views.admins_page, name='admins_page'),
    
    path('listprof/', views.enseignant_page, name='prof_page'),
    path('listprof/ajouter', views.ajoutEnseignant, name='ajoutProf'),
    path('listprof/supprimer/<int:user_id>/', views.supprimer_ligne_enseignant, name='supprimer_ligne_prof'),
    path('listprof/modifier/<int:enseignant_id>/', views.modifier_enseignant, name='modifier_enseignant'),
    path('admin/listprof.html/', views.enseignant_page, name='prof_page'),
    path('admin/listprof.html/index.html', views.index, name='index'),
    path('admin/listprof.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/listprof.html/listetudiant.html', views.etudiant_page, name='prof_page'),
    path('admin/listprof.html/Etudiant.html', views.etudiant_page, name='prof_page'),
    path('admin/listprof.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/listprof.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listprof.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/listprof.html/Enseignats.html', views.enseignant_page, name='salle_page'),
    path('admin/listprof.html/Spécialités.html', views.specialite_page, name='salle_page'),
    path('admin/listprof.html/Modules.html', views.module_page, name='module_page'),
    path('admin/listprof.html/listadmins.html', views.admins_page, name='admins_page'),
    
    path('salles/', views.salles_page, name='salle_page'),
    path('salles/ajouter', views.ajout_salle, name='ajoutSalle'),
    path('salles/supprimer/<int:user_id>/', views.supprimer_ligne_salle, name='supprimer_ligne_salle'),
    path('salles/modifier/<int:salle_id>/', views.modifier_salle, name='modifier_salle'),
    path('admin/listsalles.html/', views.salles_page, name='salle_page'),
    path('admin/listsalles.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listsalles.html/index.html', views.index, name='index'),
    path('admin/listsalles.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/listsalles.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listsalles.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/listsalles.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/listsalles.html/Spécialités.html', views.specialite_page, name='prof_page'),
    path('admin/listsalles.html/Modules.html', views.module_page, name='module_page'),
    path('admin/listsalles.html/listadmins.html', views.admins_page, name='admins_page'),
    
    path('specialite/', views.specialite_page, name='specialite_page'),
    path('specialite/ajouter', views.ajout_specialite, name='ajoutSpec'),
    path('specialite/supprimer/<int:user_id>/', views.supprimer_ligne_specialite, name='supprimer_ligne_specialite'),
    path('specialite/modifier/<int:division_id>/', views.modifier_division, name='modifier_division'),
    path('admin/Spécialités.html/', views.specialite_page, name='specialite_page'),
    path('admin/Spécialités.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/Spécialités.html/index.html', views.index, name='index'),
    path('admin/Spécialités.html/Spécialités.html', views.specialite_page, name='index'),
    path('admin/Spécialités.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/Spécialités.html/Salles.html', views.salles_page, name='salle_page'),
    path('admin/Spécialités.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/Spécialités.html/Salles.html.html', views.salles_page, name='salle_page'),
    path('admin/Spécialités.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/Spécialités.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/Spécialités.html/Modules.html', views.module_page, name='module_page'),
    path('admin/Spécialités.html/listadmins.html', views.admins_page, name='admins_page'),
    
    path('Modules/', views.module_page, name='module_page'),
    path('Modules/ajouter', views.ajoutModule, name='ajoutModule'),
    path('Modules/affecter', views.affecterModule, name='affecterModule'),
    path('Modules/etd', views.etudiermodule, name='etudiermodule'),
    path('Modules/supprimer/<int:user_id>/', views.supprimer_ligne_module, name='supprimer_ligne_module'),
    path('Modules/modifier/<int:module_id>/', views.modifier_module, name='modifier_module'),
    path('admin/Modules.html/', views.module_page, name='module_page'),
    path('admin/Modules.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/Modules.html/index.html', views.index, name='index'),
    path('admin/Modules.html/Modules.html', views.module_page, name='module_page'),
    path('admin/Modules.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/Modules.html/Salles.html', views.salles_page, name='salle_page'),
    path('admin/Modules.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/Modules.html/Salles.html.html', views.salles_page, name='salle_page'),
    path('admin/Modules.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/Modules.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/Modules.html/Spécialités.html', views.specialite_page, name='specialite_page'),
    path('admin/Modules.html/listadmins.html', views.admins_page, name='admins_page'),
    
    path('listadmins/', views.admins_page, name='admins_page'),
    path('listadmins/ajouter', views.ajoutAdmin, name='ajoutAdmin'),
    path('listadmins/supprimer/<int:user_id>/', views.supprimer_ligne_admin, name='supprimer_ligne_admin'),
    path('listadmins/modifier/<int:admin_id>/', views.modifier_admin, name='modifier_admin'),
    path('admin/listadmins.html/', views.admins_page, name='admins_page'),
    path('admin/listadmins.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listadmins.html/index.html', views.index, name='index'),
    path('admin/listadmins.html/listadmins.html', views.admins_page, name='admins_page'),
    path('admin/listadmins.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/listadmins.html/Salles.html', views.salles_page, name='salle_page'),
    path('admin/listadmins.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/listadmins.html/Salles.html.html', views.salles_page, name='salle_page'),
    path('admin/listadmins.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/listadmins.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/listadmins.html/Spécialités.html', views.specialite_page, name='specialite_page'),
    path('admin/listadmins.html/Modules.html', views.module_page, name='module_page'),
    
    path('EDT/', views.admins_page, name='admins_page'),
    path('admin/EDT.html/', views.admins_page, name='admins_page'),
    path('admin/EDT.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/EDT.html/index.html', views.index, name='index'),
    path('admin/EDT.html/EDT.html', views.admins_page, name='admins_page'),
    path('admin/EDT.html/listsalles.html', views.salles_page, name='salle_page'),
    path('admin/EDT.html/Salles.html', views.salles_page, name='salle_page'),
    path('admin/EDT.html/listsalles.html.html', views.salles_page, name='salle_page'),
    path('admin/EDT.html/Salles.html.html', views.salles_page, name='salle_page'),
    path('admin/EDT.html/listetudiant.html', views.etudiant_page, name='etudiant_page'),
    path('admin/EDT.html/listprof.html', views.enseignant_page, name='prof_page'),
    path('admin/EDT.html/Spécialités.html', views.specialite_page, name='specialite_page'),
    path('admin/EDT.html/Modules.html', views.module_page, name='module_page'),
    path('admin/EDT.html/listadmins.html', views.admins_page, name='admins_page'),
    
    
    
    
    
    

]


