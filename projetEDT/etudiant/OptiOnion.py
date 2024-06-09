'''pour l'instant l'algo de generation auto ne gère qu'une forme précise de structure
entrée: créneau  salle  enseignant  séance  coût'''

import io

import pandas as pd

import believe

from ortools.sat.python import cp_model



def main() -> None:
    # Data
    data_str = believe.all_seances

    data = pd.read_table(io.StringIO(data_str), sep=r"\s+")

    # Model
    model = cp_model.CpModel()

    # Variables
    x = model.new_bool_var_series(name="x", index=data.index)

    

    # Constraints

    # chaque couple (créneau,salle) est associé au max à une séance.
    for unused_name, séances in data.groupby(["créneau","salle"]):
        model.add_at_most_one(x[séances.index])

    # chaque séance est associée à exactement un créneau.
    for unused_name, créneaux in data.groupby("séance"):
        model.add_exactly_one(x[créneaux.index])

    # chaque séance est associée à exactement un enseignant.
    for unused_name, enseignants in data.groupby("séance"):
        model.add_exactly_one(x[enseignants.index])
        
    for enseignant, enseignants in data.groupby("enseignant"):
        for créneau, créneaux in enseignants.groupby("créneau"):
            model.add_at_most_one(x[créneaux.index])

    # chaque séance est associée à exactement un salle.
    for unused_name, salles in data.groupby("séance"):
        model.add_exactly_one(x[salles.index])



    # Objective
    model.minimize(data.coût.dot(x))

    # Solve
    solver = cp_model.CpSolver()
    status = solver.solve(model)

    # Print solution.
    if status == cp_model.OPTIMAL or status == cp_model.FEASIBLE:
        tab=[]
        print(f"Total cost = {solver.objective_value}\n")
        selected = data.loc[solver.boolean_values(x).loc[lambda x: x].index]
        for unused_index, row in selected.iterrows():
            ##### ici sont sauvegardé chaque ligne de la bss du programme enregistré, si ça a fonctionné...
            tab.append({"horaire":row.créneau, "salle":row.salle, "enseignant":row.enseignant, "seance":row.séance})
            #p = Programme(horaire=row.créneau, salle = row.salle, enseignant=row.enseignant , seance = row.séance)
            #p.save()

            ##### affichange test dans le cmd
            print(f"seance {row.séance} est enseigne par enseignant {row.enseignant} a creneau {row.créneau} en salle {row.salle} pour une peine de {row.coût}")

        print(tab)
    elif status == cp_model.INFEASIBLE:
        print("Pas de Solution")
    else:
        print("Something is wrong, check the status and the log of the solve")


if __name__ == "__main__":
    main()



###Objectif: adapter l'algorithme à la problématique suivante :  

'''
types de données:

créneau salle enseignant séance coût
______________________________________

objectif : 

minimiser coût

______________________________________


Contraintes:

-exactement 1 salle par séance
-exactement 1 enseignant par séance
-exactement 1 créneau par séance
-au plus 1 séance par créneau salle

'''



"""
  créneau  salle  enseignant  séance  coût
      c1    s1    e1    se1    100
      c1    s1    e2    se2    90
      c1    s2    e1    se1    80
      c1    s2    e2    se2    70
      c2    s1    e1    se2    35
      c2    s1    e2    se1    85
      c2    s2    e1    se2    55
      c2    s2    e2    se1    65
      c3    s1    e1    se3    125
      c3    s1    e2    se2    95
      c3    s2    e1    se3    90
      c3    s2    e2    se2    95
      c4    s1    e1    se4    45
      c4    s1    e2    se3    110
      c4    s2    e1    se4    95
      c4    s2    e2    se3    115
      c5    s1    e1    se5    50
      c5    s1    e2    se4    110
      c5    s2    e1    se5    90
      c5    s2    e2    se4    100
  """