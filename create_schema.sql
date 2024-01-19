drop table if exists participation cascade;
drop table if exists cheval cascade;
drop table if exists rapport_definitif cascade;
drop table if exists rapport_probable cascade;
drop table if exists course cascade;
drop table if exists reunion cascade;
drop table if exists homme cascade;

drop table if exists transco_allure;
drop table if exists allure;
drop table if exists transco_categorie_course;
drop table if exists categorie_course;
drop table if exists transco_corde;
drop table if exists corde;
drop table if exists transco_discipline;
drop table if exists discipline;
drop table if exists transco_ecart_precedent;
drop table if exists ecart_precedent;
drop table if exists transco_ferrure;
drop table if exists ferrure;
drop table if exists transco_hippodrome;
drop table if exists hippodrome;
drop table if exists transco_mode_depart;
drop table if exists mode_depart;
drop table if exists transco_oeillere;
drop table if exists oeillere;
drop table if exists transco_origine;
drop table if exists origine;
drop table if exists transco_parcours;
drop table if exists parcours;
drop table if exists transco_race;
drop table if exists race;
drop table if exists transco_robe;
drop table if exists robe;
drop table if exists transco_sexe;
drop table if exists sexe;
drop table if exists transco_specialite;
drop table if exists specialite;
drop table if exists transco_statut_course;
drop table if exists statut_course;
drop table if exists transco_statut_partant;
drop table if exists statut_partant;
drop table if exists transco_surcharge_monte;
drop table if exists surcharge_monte;
drop table if exists transco_temporalite;
drop table if exists temporalite;
drop table if exists transco_type_course;
drop table if exists type_course;
drop table if exists transco_type_piste;
drop table if exists type_piste;
drop table if exists transco_etat_terrain;
drop table if exists etat_terrain;
drop table if exists transco_pari;
drop table if exists pari;

CREATE TABLE allure
(
    code_allure_interne VARCHAR(50),
    libelle             VARCHAR(50),
    created             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status              VARCHAR(50),
    PRIMARY KEY (code_allure_interne)
);

CREATE TABLE transco_allure
(
    source              VARCHAR(50),
    code_allure         VARCHAR(50),
    code_allure_interne VARCHAR(50),
    created             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated             TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_allure),
    CONSTRAINT fk_code_allure_interne
        FOREIGN KEY (code_allure_interne)
            REFERENCES allure (code_allure_interne)
);

CREATE TABLE categorie_course
(
    code_categorie_course_interne VARCHAR(50),
    libelle                       VARCHAR(50),
    created                       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                        VARCHAR(50),
    PRIMARY KEY (code_categorie_course_interne)
);

CREATE TABLE transco_categorie_course
(
    source                        VARCHAR(50),
    code_categorie_course         VARCHAR(50),
    code_categorie_course_interne VARCHAR(50),
    created                       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_categorie_course),
    CONSTRAINT fk_code_categorie_course_interne
        FOREIGN KEY (code_categorie_course_interne)
            REFERENCES categorie_course (code_categorie_course_interne)
);

CREATE TABLE corde
(
    code_corde_interne VARCHAR(50),
    libelle            VARCHAR(50),
    created            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status             VARCHAR(50),
    PRIMARY KEY (code_corde_interne)
);
CREATE TABLE transco_corde
(
    source             VARCHAR(50),
    code_corde         VARCHAR(50),
    code_corde_interne VARCHAR(50),
    created            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated            TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_corde),
    CONSTRAINT fk_code_corde_interne
        FOREIGN KEY (code_corde_interne)
            REFERENCES corde (code_corde_interne)
);

CREATE TABLE discipline
(
    code_discipline_interne VARCHAR(50),
    libelle                 VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    PRIMARY KEY (code_discipline_interne)
);
CREATE TABLE transco_discipline
(
    source                  VARCHAR(50),
    code_discipline         VARCHAR(50),
    code_discipline_interne VARCHAR(50),
    code_allure_interne     VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_discipline),
    CONSTRAINT fk_code_discipline_interne
        FOREIGN KEY (code_discipline_interne)
            REFERENCES discipline (code_discipline_interne)
);

CREATE TABLE ecart_precedent
(
    code_ecart_precedent_interne VARCHAR(50),
    libelle                      VARCHAR(50),
    created                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                       VARCHAR(50),
    PRIMARY KEY (code_ecart_precedent_interne)
);
CREATE TABLE transco_ecart_precedent
(
    source                       VARCHAR(50),
    code_ecart_precedent         VARCHAR(50),
    code_ecart_precedent_interne VARCHAR(50),
    created                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_ecart_precedent),
    CONSTRAINT fk_code_ecart_precedent_interne
        FOREIGN KEY (code_ecart_precedent_interne)
            REFERENCES ecart_precedent (code_ecart_precedent_interne)
);

CREATE TABLE ferrure
(
    code_ferrure_interne VARCHAR(50),
    libelle              VARCHAR(50),
    created              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status               VARCHAR(50),
    PRIMARY KEY (code_ferrure_interne)
);
CREATE TABLE transco_ferrure
(
    source               VARCHAR(50),
    code_ferrure         VARCHAR(50),
    code_ferrure_interne VARCHAR(50),
    created              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_ferrure),
    CONSTRAINT fk_code_ferrure_interne
        FOREIGN KEY (code_ferrure_interne)
            REFERENCES ferrure (code_ferrure_interne)
);

CREATE TABLE hippodrome
(
    code_hippodrome_interne VARCHAR(50),
    libelle                 VARCHAR(50),
    code_pays               VARCHAR(50),
    libelle_long            VARCHAR(50),
    code_chrims             VARCHAR(50),
    hippodrome_connecte     VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    PRIMARY KEY (code_hippodrome_interne)
);
CREATE TABLE transco_hippodrome
(
    source                  VARCHAR(50),
    code_hippodrome         VARCHAR(50),
    code_hippodrome_interne VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_hippodrome),
    CONSTRAINT fk_code_hippodrome_interne
        FOREIGN KEY (code_hippodrome_interne)
            REFERENCES hippodrome (code_hippodrome_interne)
);

CREATE TABLE mode_depart
(
    code_mode_depart_interne VARCHAR(50),
    libelle                  VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                   VARCHAR(50),
    PRIMARY KEY (code_mode_depart_interne)
);
CREATE TABLE transco_mode_depart
(
    source                   VARCHAR(50),
    code_mode_depart         VARCHAR(50),
    code_mode_depart_interne VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_mode_depart),
    CONSTRAINT fk_code_mode_depart_interne
        FOREIGN KEY (code_mode_depart_interne)
            REFERENCES mode_depart (code_mode_depart_interne)
);

CREATE TABLE oeillere
(
    code_oeillere_interne VARCHAR(50),
    libelle               VARCHAR(50),
    created               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                VARCHAR(50),
    PRIMARY KEY (code_oeillere_interne)
);
CREATE TABLE transco_oeillere
(
    source                VARCHAR(50),
    code_oeillere         VARCHAR(50),
    code_oeillere_interne VARCHAR(50),
    created               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_oeillere),
    CONSTRAINT fk_code_oeillere_interne
        FOREIGN KEY (code_oeillere_interne)
            REFERENCES oeillere (code_oeillere_interne)
);

CREATE TABLE origine
(
    code_origine_interne VARCHAR(50),
    libelle              VARCHAR(50),
    iso                  BOOLEAN,
    created              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status               VARCHAR(50),
    PRIMARY KEY (code_origine_interne)
);
CREATE TABLE transco_origine
(
    source               VARCHAR(50),
    code_origine         VARCHAR(50),
    code_origine_interne VARCHAR(50),
    created              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated              TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_origine),
    CONSTRAINT fk_code_origine_interne
        FOREIGN KEY (code_origine_interne)
            REFERENCES origine (code_origine_interne)
);

CREATE TABLE parcours
(
    code_parcours_interne VARCHAR(50),
    libelle               VARCHAR(50),
    created               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                VARCHAR(50),
    PRIMARY KEY (code_parcours_interne)
);
CREATE TABLE transco_parcours
(
    source                VARCHAR(50),
    code_parcours         VARCHAR(50),
    code_parcours_interne VARCHAR(50),
    created               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated               TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_parcours),
    CONSTRAINT fk_code_parcours_interne
        FOREIGN KEY (code_parcours_interne)
            REFERENCES parcours (code_parcours_interne)
);

CREATE TABLE race
(
    code_race_interne VARCHAR(50),
    libelle           VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status            VARCHAR(50),
    PRIMARY KEY (code_race_interne)
);
CREATE TABLE transco_race
(
    source            VARCHAR(50),
    code_race         VARCHAR(50),
    code_race_interne VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_race),
    CONSTRAINT fk_code_race_interne
        FOREIGN KEY (code_race_interne)
            REFERENCES race (code_race_interne)
);

CREATE TABLE robe
(
    code_robe_interne VARCHAR(50),
    libelle           VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status            VARCHAR(50),
    PRIMARY KEY (code_robe_interne)
);
CREATE TABLE transco_robe
(
    source            VARCHAR(50),
    code_robe         VARCHAR(50),
    code_robe_interne VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_robe),
    CONSTRAINT fk_code_robe_interne
        FOREIGN KEY (code_robe_interne)
            REFERENCES robe (code_robe_interne)
);

CREATE TABLE sexe
(
    code_sexe_interne VARCHAR(50),
    libelle           VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status            VARCHAR(50),
    PRIMARY KEY (code_sexe_interne)
);
CREATE TABLE transco_sexe
(
    source            VARCHAR(50),
    code_sexe         VARCHAR(50),
    code_sexe_interne VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_sexe),
    CONSTRAINT fk_code_sexe_interne
        FOREIGN KEY (code_sexe_interne)
            REFERENCES sexe (code_sexe_interne)
);

CREATE TABLE specialite
(
    code_specialite_interne VARCHAR(50),
    libelle                 VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    PRIMARY KEY (code_specialite_interne)
);
CREATE TABLE transco_specialite
(
    source                  VARCHAR(50),
    code_specialite         VARCHAR(50),
    code_specialite_interne VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_specialite),
    CONSTRAINT fk_code_specialite_interne
        FOREIGN KEY (code_specialite_interne)
            REFERENCES specialite (code_specialite_interne)
);

CREATE TABLE statut_course
(
    code_statut_course_interne VARCHAR(50),
    libelle                    VARCHAR(50),
    created                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                     VARCHAR(50),
    PRIMARY KEY (code_statut_course_interne)
);
CREATE TABLE transco_statut_course
(
    source                     VARCHAR(50),
    code_statut_course         VARCHAR(50),
    code_statut_course_interne VARCHAR(50),
    created                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_statut_course),
    CONSTRAINT fk_code_statut_course_interne
        FOREIGN KEY (code_statut_course_interne)
            REFERENCES statut_course (code_statut_course_interne)
);

CREATE TABLE statut_partant
(
    code_statut_partant_interne VARCHAR(50),
    libelle                     VARCHAR(50),
    code_simplifie              VARCHAR(50),
    created                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                      VARCHAR(50),
    PRIMARY KEY (code_statut_partant_interne)
);
CREATE TABLE transco_statut_partant
(
    source                      VARCHAR(50),
    code_statut_partant         VARCHAR(50),
    code_statut_partant_interne VARCHAR(50),
    created                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_statut_partant),
    CONSTRAINT fk_code_statut_partant_interne
        FOREIGN KEY (code_statut_partant_interne)
            REFERENCES statut_partant (code_statut_partant_interne)
);

CREATE TABLE surcharge_monte
(
    code_surcharge_monte_interne VARCHAR(50),
    libelle                      VARCHAR(50),
    created                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                       VARCHAR(50),
    PRIMARY KEY (code_surcharge_monte_interne)
);
CREATE TABLE transco_surcharge_monte
(
    source                       VARCHAR(50),
    code_surcharge_monte         VARCHAR(50),
    code_surcharge_monte_interne VARCHAR(50),
    created                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_surcharge_monte),
    CONSTRAINT fk_code_surcharge_monte_interne
        FOREIGN KEY (code_surcharge_monte_interne)
            REFERENCES surcharge_monte (code_surcharge_monte_interne)
);

CREATE TABLE temporalite
(
    code_temporalite_interne VARCHAR(50),
    libelle                  VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                   VARCHAR(50),
    PRIMARY KEY (code_temporalite_interne)
);
CREATE TABLE transco_temporalite
(
    source                   VARCHAR(50),
    code_temporalite         VARCHAR(50),
    code_temporalite_interne VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_temporalite),
    CONSTRAINT fk_code_temporalite_interne
        FOREIGN KEY (code_temporalite_interne)
            REFERENCES temporalite (code_temporalite_interne)
);

CREATE TABLE type_course
(
    code_type_course_interne VARCHAR(50),
    libelle                  VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                   VARCHAR(50),
    PRIMARY KEY (code_type_course_interne)
);
CREATE TABLE transco_type_course
(
    source                   VARCHAR(50),
    code_type_course         VARCHAR(50),
    code_type_course_interne VARCHAR(50),
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_type_course),
    CONSTRAINT fk_code_type_course_interne
        FOREIGN KEY (code_type_course_interne)
            REFERENCES type_course (code_type_course_interne)
);

CREATE TABLE type_piste
(
    code_type_piste_interne VARCHAR(50),
    libelle                 VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    PRIMARY KEY (code_type_piste_interne)
);
CREATE TABLE transco_type_piste
(
    source                  VARCHAR(50),
    code_type_piste         VARCHAR(50),
    code_type_piste_interne VARCHAR(50),
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_type_piste),
    CONSTRAINT fk_code_type_piste_interne
        FOREIGN KEY (code_type_piste_interne)
            REFERENCES type_piste (code_type_piste_interne)
);

CREATE TABLE etat_terrain
(
    code_etat_terrain_interne VARCHAR(50),
    libelle                   VARCHAR(50),
    created                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                    VARCHAR(50),
    PRIMARY KEY (code_etat_terrain_interne)
);
CREATE TABLE transco_etat_terrain
(
    source                    VARCHAR(50),
    code_etat_terrain         VARCHAR(50),
    code_etat_terrain_interne VARCHAR(50),
    created                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_etat_terrain),
    CONSTRAINT fk_code_etat_terrain_interne
        FOREIGN KEY (code_etat_terrain_interne)
            REFERENCES etat_terrain (code_etat_terrain_interne)
);

CREATE TABLE pari
(
    code_pari_interne VARCHAR(50),
    type_pari         VARCHAR(50),
    libelle           VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status            VARCHAR(50),
    PRIMARY KEY (code_pari_interne)
);
CREATE TABLE transco_pari
(
    source            VARCHAR(50),
    code_pari         VARCHAR(50),
    code_pari_interne VARCHAR(50),
    created           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (source, code_pari),
    CONSTRAINT fk_code_pari_interne
        FOREIGN KEY (code_pari_interne)
            REFERENCES pari (code_pari_interne)
);

CREATE TABLE reunion
(
    id                        INT          NOT NULL,
    id_reunion                VARCHAR(50)   NULL,
    source_id                 VARCHAR(50)   NULL,
    master_source             VARCHAR(50)   NULL,
    code_hippodrome_interne   VARCHAR(50)   NULL,
    temporalite_reunion       VARCHAR(50)   NULL,
    numero_reunion            INT          NULL,
    devise_reunion            VARCHAR(50)   NULL,
    date_reunion              DATE          NULL,
    heure_reunion             VARCHAR(50)   NULL,
    nb_course_reunion         INT          NULL,
    statut                    VARCHAR(50)   NULL,
    numero_externe_reunion    INT          NULL,
    aud_internat_reunion      BOOLEAN       NULL,
    aud_nat_qp_reunion        BOOLEAN       NULL,
    aud_nat_reunion           BOOLEAN       NULL,
    aud_reg_reunion           BOOLEAN       NULL,
    aud_loc_reunion           BOOLEAN       NULL,
    specialite                VARCHAR(50)   NULL,
    valeur_penetrometre       NUMERIC(6, 2) NULL,
    heure_releve_penetrometre VARCHAR(50)   NULL,
    etat_terrain              VARCHAR(50)   NULL,
    csi                       BOOLEAN       NULL,
    trophee_vert              BOOLEAN       NULL,
    gti                       BOOLEAN       NULL,
    trk                       BOOLEAN       NULL,
    arjel                     BOOLEAN       NULL,
    pmu                       BOOLEAN       NULL,
    pmh                       BOOLEAN       NULL,
    created                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP     NULL,
    updated                   TIMESTAMP DEFAULT CURRENT_TIMESTAMP     NULL,
    status                    VARCHAR(50)   NULL,
    code_pays                 VARCHAR(50)   NULL,
    reunion_trackee           BOOLEAN       NULL,
    aud_nat_red_reunion       BOOLEAN       NULL,
    CONSTRAINT reunion_pkey PRIMARY KEY (id),
    CONSTRAINT fk_hippodrome_reunion
        FOREIGN KEY (code_hippodrome_interne)
            REFERENCES hippodrome (code_hippodrome_interne),
    CONSTRAINT fk_temporalite_reunion
        FOREIGN KEY (temporalite_reunion)
            REFERENCES temporalite (code_temporalite_interne),
    CONSTRAINT fk_specialite_reunion
        FOREIGN KEY (specialite)
            REFERENCES specialite (code_specialite_interne),
    CONSTRAINT fk_etat_terrain_reunion
        FOREIGN KEY (etat_terrain)
            REFERENCES etat_terrain (code_etat_terrain_interne)
);

CREATE TABLE course
(
    id                       INT           NOT NULL,
    id_course                VARCHAR(50)    NULL,
    source_id                VARCHAR(50)    NULL,
    id_reunion               INT           NULL,
    master_source            VARCHAR(50)    NULL,
    discipline               VARCHAR(50)    NULL,
    mode_depart              VARCHAR(50)    NULL,
    corde                    VARCHAR(50)    NULL,
    categorie                VARCHAR(50)    NULL,
    "type"                   VARCHAR(50)    NULL,
    numero_course            INT           NULL,
    libelle_course           VARCHAR(50)    NULL,
    heure_depart_course      VARCHAR(50)    NULL,
    heure_depart_reel_course VARCHAR(50)    NULL,
    heure_debut_operation    VARCHAR(50)    NULL,
    nb_declare_partants      INT           NULL,
    distance                 INT           NULL,
    peloton                  VARCHAR(50)    NULL,
    libelle_parcours         VARCHAR(50)    NULL,
    libelle_piste            VARCHAR(50)    NULL,
    code_parcours            VARCHAR(50)    NULL,
    date_course              DATE           NULL,
    reference_age            VARCHAR(50)    NULL,
    conditions               TEXT           NULL,
    conditions_race          VARCHAR(50)    NULL,
    conditions_age           VARCHAR(50)    NULL,
    conditions_sexe          VARCHAR(50)    NULL,
    conditions_monte         VARCHAR(50)    NULL,
    allocation_totale        NUMERIC(15, 2) NULL,
    allocation               VARCHAR(50)    NULL,
    meilleur_temps           VARCHAR(50)    NULL,
    etat_arrivee             VARCHAR(50)    NULL,
    libelle_court_course     VARCHAR(50)    NULL,
    piste                    VARCHAR(50)    NULL,
    heure_releve_penetr      VARCHAR(50)    NULL,
    valeur_penetr            NUMERIC(6, 2)  NULL,
    libelle_penetr           VARCHAR(50)    NULL,
    pmu_course               BOOLEAN        NULL,
    pmh_course               BOOLEAN        NULL,
    cei                      BOOLEAN        NULL,
    arjel_course             BOOLEAN        NULL,
    "national"               BOOLEAN        NULL,
    regional                 BOOLEAN        NULL,
    quintp                   BOOLEAN        NULL,
    csi                      BOOLEAN        NULL,
    course_trackee           BOOLEAN        NULL,
    canceled                 BOOLEAN        NULL,
    ranking                  VARCHAR(50)    NULL,
    nonrunners               VARCHAR(50)    NULL,
    created                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP      NULL,
    updated                  TIMESTAMP DEFAULT CURRENT_TIMESTAMP      NULL,
    status                   VARCHAR(50)    NULL,
    code_etat_terrain        VARCHAR(50)    NULL,
    mesure_penetrometre      VARCHAR(50)    NULL,
    statut_course            VARCHAR(50)    NULL,
    statut_enquete           VARCHAR(50)    NULL,
    libelle_enquete          VARCHAR(50)    NULL,
    offre_paris              VARCHAR(50)    NULL,
    heure_arrivee_definitive VARCHAR(50)    NULL,
    ind_pari_complexe        BOOLEAN        NULL,
    CONSTRAINT course_pkey PRIMARY KEY (id)
);

ALTER TABLE course
    ADD CONSTRAINT fk_categorie_course FOREIGN KEY (categorie) REFERENCES categorie_course (code_categorie_course_interne);
ALTER TABLE course
    ADD CONSTRAINT fk_corde_course FOREIGN KEY (corde) REFERENCES corde (code_corde_interne);
ALTER TABLE course
    ADD CONSTRAINT fk_discipline_course FOREIGN KEY (discipline) REFERENCES discipline (code_discipline_interne);
ALTER TABLE course
    ADD CONSTRAINT fk_mode_depart_course FOREIGN KEY (mode_depart) REFERENCES mode_depart (code_mode_depart_interne);
ALTER TABLE course
    ADD CONSTRAINT fk_piste_course FOREIGN KEY (piste) REFERENCES type_piste (code_type_piste_interne);
ALTER TABLE course
    ADD CONSTRAINT fk_reunion FOREIGN KEY (id_reunion) REFERENCES reunion (id);
ALTER TABLE course
    ADD CONSTRAINT fk_type_course FOREIGN KEY ("type") REFERENCES type_course (code_type_course_interne);
CREATE TABLE homme
(
    id            INT PRIMARY KEY,
    id_homme      VARCHAR(50),
    source_id     VARCHAR(50),
    master_source VARCHAR(50),
    nom           VARCHAR(50),
    titre         VARCHAR(50),
    created       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status        VARCHAR(50)
);

CREATE TABLE cheval
(
    id                      INT PRIMARY KEY,
    id_cheval               VARCHAR(50),
    source_id               VARCHAR(50),
    master_source           VARCHAR(50),
    nom_cheval              VARCHAR(50),
    origine_cheval          VARCHAR(50),
    race_cheval             VARCHAR(50),
    sexe_cheval             VARCHAR(50),
    robe_cheval             VARCHAR(50),
    allure_cheval           VARCHAR(50),
    id_pere                 INT,
    id_mere                 INT,
    date_naissance_cheval   DATE,
    annee_naissance_cheval  INTEGER,
    annee_castration_cheval INTEGER,
    id_eleveur              INT,
    nom_eleveur             VARCHAR(50),
    titre_eleveur           VARCHAR(50),
    numero_sire             INTEGER,
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    trace                   VARCHAR(50),
    CONSTRAINT fk_cheval_pere FOREIGN KEY (id_pere) REFERENCES cheval (id),
    CONSTRAINT fk_cheval_mere FOREIGN KEY (id_mere) REFERENCES cheval (id),
    CONSTRAINT fk_origine_cheval FOREIGN KEY (origine_cheval) REFERENCES origine (code_origine_interne),
    CONSTRAINT fk_race_cheval FOREIGN KEY (race_cheval) REFERENCES race (code_race_interne),
    CONSTRAINT fk_sexe_cheval FOREIGN KEY (sexe_cheval) REFERENCES sexe (code_sexe_interne),
    CONSTRAINT fk_robe_cheval FOREIGN KEY (robe_cheval) REFERENCES robe (code_robe_interne),
    CONSTRAINT fk_allure_cheval FOREIGN KEY (allure_cheval) REFERENCES allure (code_allure_interne),
    CONSTRAINT fk_homme_eleveur FOREIGN KEY (id_eleveur) REFERENCES homme (id)
);

CREATE TABLE participation
(
    id                      INT           NOT NULL,
    id_participation        VARCHAR(50)    NULL,
    source_id               VARCHAR(50)    NULL,
    master_source           VARCHAR(50)    NULL,
    oeillere                VARCHAR(50)    NULL,
    surcharge_monte         VARCHAR(50)    NULL,
    ferrure                 VARCHAR(50)    NULL,
    statut_partant          VARCHAR(50)    NULL,
    id_cheval               INT           NULL,
    id_course               INT           NULL,
    numero_partant          INT           NOT NULL,
    age_cheval              INT           NULL,
    place_corde             INT           NULL,
    corde_demandee          BOOLEAN        NULL,
    taux_reclamation        INT           NULL,
    couleur                 VARCHAR(50)    NULL,
    ecurie                  INT           NULL,
    distance                INT           NULL,
    poids_calcule           NUMERIC(15, 2) NULL,
    poids_conditions_monte  NUMERIC(15, 2) NULL,
    jument_pleine           BOOLEAN        NULL,
    inedit_france_icp       BOOLEAN        NULL,
    supplemente             BOOLEAN        NULL,
    id_entraineur           INT           NULL,
    id_monte                INT           NULL,
    id_proprietaire         INT           NULL,
    date_participation      DATE           NULL,
    gains                   NUMERIC(10, 2) NULL,
    gains_annee             NUMERIC(10, 2) NULL,
    gains_annee_prec        NUMERIC(10, 2) NULL,
    gains_victoire          NUMERIC(10, 2) NULL,
    gains_place             NUMERIC(10, 2) NULL,
    nb_courses              INT           NULL,
    nb_courses_victoire     INT           NULL,
    nb_courses_place        INT           NULL,
    valeur_cheval           NUMERIC(6, 2)  NULL,
    musique_cheval          VARCHAR(50)    NULL,
    place_arrivee           INT           NULL,
    temps_arrivee           NUMERIC(15, 2) NULL,
    reduction_km            NUMERIC(15, 2) NULL,
    casaque_path            TEXT           NULL,
    texte_place_arrivee     TEXT           NULL,
    bonnet                  BOOLEAN        NULL,
    attache_langue          BOOLEAN        NULL,
    echarpe                 VARCHAR(50)    NULL,
    joker                   BOOLEAN        NULL,
    avis_entraineur         INT           NULL,
    pari_monte              BOOLEAN        NULL,
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP      NULL,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP      NULL,
    status                  VARCHAR(50)    NULL,
    nom_entraineur          VARCHAR(50)    NULL,
    titre_entraineur        VARCHAR(50)    NULL,
    nom_monte               VARCHAR(50)    NULL,
    titre_monte             VARCHAR(50)    NULL,
    nom_proprietaire        VARCHAR(50)    NULL,
    titre_proprietaire      VARCHAR(50)    NULL,
    numero_course           INT           NOT NULL,
    code_hippodrome_interne VARCHAR(50)    NULL,
    code_ecart_precedent    VARCHAR(50)    NULL,
    code_pays_entrainement  VARCHAR(50)    NULL,
    performances_comparees  VARCHAR(50)    NULL,
    CONSTRAINT participation_pkey PRIMARY KEY (id),
    CONSTRAINT fk_cheval FOREIGN KEY (id_cheval) REFERENCES cheval (id),
    CONSTRAINT fk_course FOREIGN KEY (id_course) REFERENCES course (id),
    CONSTRAINT fk_homme_entraineur FOREIGN KEY (id_entraineur) REFERENCES homme (id),
    CONSTRAINT fk_homme_monte FOREIGN KEY (id_monte) REFERENCES homme (id),
    CONSTRAINT fk_homme_proprietaire FOREIGN KEY (id_proprietaire) REFERENCES homme (id),
    CONSTRAINT fk_oeillere FOREIGN KEY (oeillere) REFERENCES oeillere (code_oeillere_interne),
    CONSTRAINT fk_ferrure FOREIGN KEY (ferrure) REFERENCES ferrure (code_ferrure_interne),
    CONSTRAINT fk_statut_partant FOREIGN KEY (statut_partant) REFERENCES statut_partant (code_statut_partant_interne),
    CONSTRAINT fk_pays_entrainement FOREIGN KEY (code_pays_entrainement) REFERENCES origine (code_origine_interne)
);

CREATE TABLE rapport_definitif
(
    id                      INT           NOT NULL,
    id_rapport_definitif    VARCHAR(50)    NOT NULL,
    master_source           VARCHAR(50)    NULL,
    date_course             DATE           NULL,
    code_hippodrome_interne VARCHAR(50)    NULL,
    numero_course           INT           NULL,
    id_course               INT           NULL,
    code_pari               VARCHAR(50)    NULL,
    ordre_affichage         INT           NULL,
    combinaison             VARCHAR(50)    NULL,
    type_rapport            VARCHAR(50)    NULL,
    nb_mises_gagnantes      NUMERIC(10, 2) NULL,
    rapport_un_euro         NUMERIC(10, 2) NULL,
    rapport_base            NUMERIC(10, 2) NULL,
    mise_base               NUMERIC(10, 2) NULL,
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    CONSTRAINT rapport_definitif_pkey PRIMARY KEY (id),
    CONSTRAINT fk_course FOREIGN KEY (id_course) REFERENCES course (id),
    CONSTRAINT fk_code_hippodrome_interne FOREIGN KEY (code_hippodrome_interne) REFERENCES hippodrome (code_hippodrome_interne),
    CONSTRAINT fk_code_pari FOREIGN KEY (code_pari) REFERENCES pari (code_pari_interne)
);

CREATE TABLE rapport_probable
(
    id                      INT           NOT NULL,
    id_rapport_probable     VARCHAR(50)    NOT NULL,
    id_course               INT           NULL,
    reference               VARCHAR(50)    NULL,
    master_source           VARCHAR(50)    NULL,
    date_course             DATE           NULL,
    code_hippodrome_interne VARCHAR(50)    NULL,
    numero_course           INT           NULL,
    code_pari               VARCHAR(50)    NULL,
    rapport                 VARCHAR(50)    NULL,
    mont_enjeux             NUMERIC(10, 2) NULL,
    created                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated                 TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status                  VARCHAR(50),
    CONSTRAINT rapport_probable_pkey PRIMARY KEY (id),
    CONSTRAINT fk_course FOREIGN KEY (id_course) REFERENCES course (id),
    CONSTRAINT fk_code_hippodrome_interne FOREIGN KEY (code_hippodrome_interne) REFERENCES hippodrome (code_hippodrome_interne),
    CONSTRAINT fk_code_pari FOREIGN KEY (code_pari) REFERENCES pari (code_pari_interne)
);
