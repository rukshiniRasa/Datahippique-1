import xml.etree.ElementTree as ET
import uuid
from datetime import datetime

# Chemin du fichier XML
xml_file_path = 'C:/Users/ruksh/Downloads/bouchon_reunion_20210529-SON.xml'
# Chemin du fichier de sortie pour les requêtes SQL
output_file_path = 'C:/Users/ruksh/Documents/M2-BIA/PMU/cheval_queries.sql'

# Parsing du fichier XML
tree = ET.parse(xml_file_path)
root = tree.getroot()

# Ouverture du fichier de sortie en mode écriture
with open(output_file_path, 'w') as file:
    for race_item in root.findall('.//races/item'):
        race_date = root.find('./date').text
        race_time = race_item.find('./time').text
        
        # Convertir la date et l'heure au format MySQL 'YYYY-MM-DD HH:MM:SS'
        datetime_format = '%d/%m/%Y %H:%M:%S'
        mysql_format = '%Y-%m-%d %H:%M:%S'
        datetime_object = datetime.strptime(f"{race_date} {race_time}", datetime_format)
        mysql_datetime = datetime_object.strftime(mysql_format)

        for horse_item in race_item.findall('./results/item'):
            # Extraction des données
            horse_name = horse_item.find('./horse').text
            born_year = horse_item.find('./bornDate').text
            colour = horse_item.find('./colour').text
            bred = horse_item.find('./bred').text
            sex = horse_item.find('./sex').text
            castrado = horse_item.find('./castrado').text if horse_item.find('./castrado') is not None else 'N'

            # Générer un UUID pour chaque cheval
            cheval_id = str(uuid.uuid4())


            # Création de la requête SQL
            sql_insert = f'''
                INSERT INTO cheval (
                    id, 
                    nom_cheval, 
                    origine_cheval, 
                    race_cheval, 
                    sexe_cheval, 
                    robe_cheval, 
                    annee_naissance_cheval, 
                    annee_castration_cheval,
                    created,
                    updated,
                    status
                ) VALUES (
                    '{cheval_id}', 
                    '{horse_name}', 
                    '{bred}', 
                    'Race non spécifiée', 
                    '{sex}', 
                    '{colour}', 
                    '{born_year}', 
                    'Castration année non spécifiée',
                    '{mysql_datetime}', 
                    '{mysql_datetime}', 
                    'active'
                );
            '''
            # Écrire la requête dans le fichier
            file.write(sql_insert + "\n")

# Confirmation que les requêtes ont été écrites
print(f"Les requêtes SQL ont été enregistrées dans {output_file_path}")
