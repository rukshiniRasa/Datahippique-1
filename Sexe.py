import xml.etree.ElementTree as ET
from datetime import datetime

# Chemin du fichier XML
xml_file_path = 'C:/Users/ruksh/Downloads/bouchon_reunion_20210529-SON.xml'
# Chemin du fichier de sortie pour les requêtes SQL
output_file_path = 'C:/Users/ruksh/Documents/M2-BIA/PMU/sexe_queries.sql'

# Parsing du fichier XML
tree = ET.parse(xml_file_path)
root = tree.getroot()

# Ouverture du fichier de sortie en mode écriture
with open(output_file_path, 'w') as file:
    for race_item in root.findall('.//races/item'):
        race_id = race_item.find('./id').text
        race_name = race_item.find('./name').text
        race_time = race_item.find('./time').text
        race_date = root.find('./date').text
        
        # Convertir la date et l'heure au format MySQL 'YYYY-MM-DD HH:MM:SS'
        datetime_format = '%d/%m/%Y %H:%M:%S'
        mysql_format = '%Y-%m-%d %H:%M:%S'
        datetime_object = datetime.strptime(f"{race_date} {race_time}", datetime_format)
        mysql_datetime = datetime_object.strftime(mysql_format)

        for horse_item in race_item.findall('./results/item'):
            sex = horse_item.find('./sex').text
            castrado = horse_item.find('./castrado').text

            values = f"('{sex}', '{castrado}', '{mysql_datetime}', '{mysql_datetime}', 'active')"

            sql_insert = f'''
                INSERT INTO sexe (code_sexe_interne, libelle, created, updated, status)
                VALUES {values}
                ON DUPLICATE KEY UPDATE
                libelle = VALUES(libelle), 
                created = VALUES(created), 
                updated = VALUES(updated), 
                status = VALUES(status);
                '''
            # Écrire la requête dans le fichier
            file.write(sql_insert + "\n")

# Confirmation que les requêtes SQL ont été écrites
print(f"Les requêtes SQL ont été enregistrées dans {output_file_path}")
