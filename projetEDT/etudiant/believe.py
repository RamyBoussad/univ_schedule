

import time
####echantillon
salles = [
    {"numero": 101, "capacite": 40, "tp_possible": True},
    {"numero": 102, "capacite": 30, "tp_possible": False},
    {"numero": 103, "capacite": 50, "tp_possible": True},
    {"numero": 104, "capacite": 30, "tp_possible": False},
    {"numero": 105, "capacite": 50, "tp_possible": True},
    {"numero": 106, "capacite": 120, "tp_possible": False},
    {"numero": 107, "capacite": 50, "tp_possible": True},

    # Ajoutez d'autres salles ici
]

seances_a_programmer = [
    {"idEtude": 1,"idDiv": 1, "nb_etudiants": 111, "module": "POO", "type": "Cours"},
    {"idEtude": 2,"idDiv": 1, "nb_etudiants": 111, "module": "BDD", "type": "Cours"},
    {"idEtude": 3,"idDiv": 6, "nb_etudiants": 23, "module": "POO", "type": "TD"},
    {"idEtude": 4,"idDiv": 6, "nb_etudiants": 23, "module": "POO", "type": "TP"},
    {"idEtude": 5,"idDiv": 2, "nb_etudiants": 22, "module": "POO", "type": "TD"},
    {"idEtude": 6,"idDiv": 2, "nb_etudiants": 22, "module": "POO", "type": "TP"},
    {"idEtude": 7,"idDiv": 3, "nb_etudiants": 25, "module": "POO", "type": "TD"},
    {"idEtude": 8,"idDiv": 3, "nb_etudiants": 25, "module": "POO", "type": "TP"},
    {"idEtude": 9,"idDiv": 4, "nb_etudiants": 20, "module": "POO", "type": "TD"},
    {"idEtude": 10,"idDiv": 4, "nb_etudiants": 20, "module": "POO", "type": "TP"},
    {"idEtude": 11,"idDiv": 5, "nb_etudiants": 21, "module": "POO", "type": "TD"},
    {"idEtude": 12,"idDiv": 5, "nb_etudiants": 21, "module": "POO", "type": "TP"},
    {"idEtude": 13,"idDiv": 6, "nb_etudiants": 23, "module": "BDD", "type": "TD"},
    {"idEtude": 14,"idDiv": 6, "nb_etudiants": 23, "module": "BDD", "type": "TP"},
    {"idEtude": 15,"idDiv": 2, "nb_etudiants": 22, "module": "BDD", "type": "TD"},
    {"idEtude": 16,"idDiv": 2, "nb_etudiants": 22, "module": "BDD", "type": "TP"},
    {"idEtude": 17,"idDiv": 3, "nb_etudiants": 25, "module": "BDD", "type": "TD"},
    {"idEtude": 18,"idDiv": 3, "nb_etudiants": 25, "module": "BDD", "type": "TP"},
    {"idEtude": 19,"idDiv": 4, "nb_etudiants": 20, "module": "BDD", "type": "TD"},
    {"idEtude": 20,"idDiv": 4, "nb_etudiants": 20, "module": "BDD", "type": "TP"},
    {"idEtude": 21,"idDiv": 5, "nb_etudiants": 21, "module": "BDD", "type": "TD"},
    {"idEtude": 22,"idDiv": 5, "nb_etudiants": 21, "module": "BDD", "type": "TP"},
    # Ajoutez d'autres séances ici
]

enseignements = [
    {"id": 1, "idprof":1, "module": "BDD", "type": "Cours"},
    {"id": 2, "idprof":1, "module": "BDD", "type": "TP"},
    {"id": 7, "idprof":3, "module": "BDD", "type": "TD"},
    {"id": 8, "idprof":4, "module": "BDD", "type": "TP"},
    {"id": 3, "idprof":1, "module": "BDD", "type": "TD"},
    {"id": 4, "idprof":2, "module": "POO", "type": "Cours"},
    {"id": 5, "idprof":2, "module": "POO", "type": "TP"},
    {"id": 6, "idprof":2, "module": "POO", "type": "TD"},
    {"id": 9, "idprof":5, "module": "POO", "type": "TP"},
    {"id": 10, "idprof":6, "module": "POO", "type": "TD"},



    # Ajoutez d'autres enseignants ici
]

indispoenseignant = [
    {"idAbs": 1, "idprof": 1, "jour": "Dimanche", "de": "08h00", "a": "15h30"},
    {"idAbs": 2, "idprof": 2, "jour": "Lundi", "de": "10h00", "a": "12h30"},
    {"idAbs": 3, "idprof": 3, "jour": "Mercredi", "de": "14h00", "a": "17h00"},
    {"idAbs": 4, "idprof": 4, "jour": "Lundi", "de": "09h30", "a": "11h00"},
    {"idAbs": 5, "idprof": 5, "jour": "Mercredi", "de": "13h00", "a": "16h00"}
]


horaires_hebdomadaires = [
    {"jour": "Dimanche", "heureD": "08h00", "heureF": "09h30" },
    {"jour": "Dimanche", "heureD": "09h40", "heureF": "11h10"},
    {"jour": "Dimanche", "heureD": "11h20", "heureF": "12h50"},
    {"jour": "Dimanche", "heureD": "13h00", "heureF": "14h30"},
    {"jour": "Dimanche", "heureD": "14h40", "heureF": "16h10"},
    {"jour": "Dimanche", "heureD": "16h20", "heureF": "17h50"},
    {"jour": "Lundi", "heureD": "08h00", "heureF": "09h30" },
    {"jour": "Lundi", "heureD": "09h40", "heureF": "11h10"},
    {"jour": "Lundi", "heureD": "11h20", "heureF": "12h50"},
    {"jour": "Lundi", "heureD": "13h00", "heureF": "14h30"},
    {"jour": "Lundi", "heureD": "14h40", "heureF": "16h10"},
    {"jour": "Lundi", "heureD": "16h20", "heureF": "17h50"},
    {"jour": "Mardi", "heureD": "08h00", "heureF": "09h30" },
    {"jour": "Mardi", "heureD": "09h40", "heureF": "11h10"},
    {"jour": "Mardi", "heureD": "11h20", "heureF": "12h50"},
    {"jour": "Mardi", "heureD": "13h00", "heureF": "14h30"},
    {"jour": "Mardi", "heureD": "14h40", "heureF": "16h10"},
    {"jour": "Mardi", "heureD": "16h20", "heureF": "17h50"},
    {"jour": "Mercredi", "heureD": "08h00", "heureF": "09h30" },
    {"jour": "Mercredi", "heureD": "09h40", "heureF": "11h10"},
    {"jour": "Mercredi", "heureD": "11h20", "heureF": "12h50"},
    {"jour": "Mercredi", "heureD": "13h00", "heureF": "14h30"},
    {"jour": "Mercredi", "heureD": "14h40", "heureF": "16h10"},
    {"jour": "Mercredi", "heureD": "16h20", "heureF": "17h50"},
    {"jour": "Jeudi", "heureD": "08h00", "heureF": "09h30" },
    {"jour": "Jeudi", "heureD": "09h40", "heureF": "11h10"},
    {"jour": "Jeudi", "heureD": "11h20", "heureF": "12h50"},
    {"jour": "Jeudi", "heureD": "13h00", "heureF": "14h30"},
    {"jour": "Jeudi", "heureD": "14h40", "heureF": "16h10"},
    {"jour": "Jeudi", "heureD": "16h20", "heureF": "17h50"},
    # Ajoutez d'autres créneaux horaires ici
]


#toutes les séances possibles

all_seances = "créneau  salle  enseignant  séance  coût\n"
for H in horaires_hebdomadaires:
    for sal in salles:
        for seance in seances_a_programmer:
            for ensei in enseignements:
                if(((sal["tp_possible"]==True and seance["type"]==ensei["type"]=="TP")or(sal["tp_possible"]==False and seance["type"]==ensei["type"]!="TP")) and ensei["module"]==seance["module"] and seance["nb_etudiants"]<=sal["capacite"]):

                    #application des peines
                    peine = 0
                    ##jour
                    if H["jour"]=="Dimanche":
                        peine +=1
                    elif H["jour"]=="Jeudi":
                        peine +=2
                    
                    ##heure
                    if H["heureD"]=="08h00":
                        peine +=1
                    elif H["heureD"]=="14h40":
                        peine +=2
                    elif H["heureD"]=="16h20":
                        peine +=3
                    

                    ###dispo (à implémenter)
                    for ind in indispoenseignant:
                        if (H["heureD"]<=ind["de"]<=H["heureF"]) or (H["heureD"]<=ind["a"]<=H["heureF"]):
                            peine +=4

                    all_seances+=(f"{H["jour"]}_{H["heureD"]}    {sal["numero"]}    {ensei["idprof"]}    {seance["idEtude"]}    {peine}\n")
                    

"""                    
print(all_seances)

for s in all_seances:
    print(s,end="")
    time.sleep(0.001)"""





