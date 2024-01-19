import xml.etree.ElementTree as ET

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

        for horse_item in race_item.findall('./results/item'):
            sex = horse_item.find('./sex').text
            castrado = horse_item.find('./castrado').text

            if castrado == 'Y':
                sex = 'H'

            if sex == 'M':
                label_fr = 'Mâle'
                label_en = 'Male'
                label_es = 'Macho'
            elif sex == 'F':
                label_fr = 'Femelle'
                label_en = 'Female'
                label_es = 'Hembra'
            elif sex == 'H':
                label_fr = 'Hongre'
                label_en = 'Gelding'
                label_es = 'Castrado'

            created_updated = f"{race_date} {race_time}"

            values = f"('{sex}', '[{{\"language\": \"fr\", \"label\": \"{label_fr}\"}}, {{\"language\": \"en\", \"label\": \"{label_en}\"}},{{\"language\": \"es\", \"label\": \"{label_es}\"}}]', '{created_updated}', '{created_updated}', 'active')"

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

# Confirmation que les requêtes ont été écrites
print(f"Les requêtes SQL ont été enregistrées dans {output_file_path}")
