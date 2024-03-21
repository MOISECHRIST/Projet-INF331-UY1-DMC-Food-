import sys

def read_File(path):
    dico={}
    i=1
    try:
        with open(path,"r") as file:
            i=1
            for line in file:
                line=line[:-1]
                if line not in dico.keys():
                    dico[line]=i
                    print(f"('name':'{line}' , 'id':{i}),",end=" ")
                    i+=1
                
    except:
        print("Impossible d'ouvrir le fichier {}".format(path))
    return dico
if __name__=="__main__":
    if len(sys.argv)==1:
        print("imput file error: Le dossier des article n'est pas donné en parametre\npython extract_text_elts.py <file path>")
        exit(1)
    path=sys.argv[-1]
    all_data=read_File(path)