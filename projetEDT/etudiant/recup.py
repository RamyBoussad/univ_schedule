
import pandas



def query2list(query):
    '''recupère le resultat d'un Objects.all() et le stock dans une liste de dictionnaires, by Ramy'''
    list=query.tolist()
    result=[{}]
    for row in list:
        for attrib in row.keys():
            setattr(ligne,attrib,getattr(row,attrib,None))
        result.append(ligne)
    
    return result

def gquery2list(query):
    '''recupère le resultat d'un Objects.all() et le stock dans une liste de dictionnaires, by Ramy, révisé par GeminiAi ._.'''
    result = []
    for row in query:
        row_dict = {}
        for field_name in row._meta.get_fields():
            if field_name.is_relational:
                # Handle relational fields (ForeignKey, OneToOne, etc.)
                related_value = getattr(row, field_name.attname)
                if related_value:
                    row_dict[field_name.attname] = related_value.id
            else:
                # Handle non-relational fields (CharField, IntegerField, etc.)
                row_dict[field_name.attname] = getattr(row, field_name.attname)
        result.append(row_dict)
    return result

def combi_seance(horaires_hebdomadaires,salles,seances_a_programmer,enseignements):
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

    return all_seances

