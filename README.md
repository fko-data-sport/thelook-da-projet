# thelook-da-projet
Analyse e-commerce TheLook Women France 2023-2024

# Analyse E-commerce 2023 vs 2024 – TheLook Europe

## Contexte et objectifs du projet

Dans le cadre de la formation Data Analyst DataGong, ce projet consiste à analyser les performances e-commerce de **TheLook Europe** et à comparer les résultats entre **2023 et 2024**.

L'objectif est d'identifier les évolutions du chiffre d'affaires, de la marge, des retours produits et du comportement client afin de formuler des recommandations à destination de la direction e-commerce.

Les travaux réalisés couvrent l'ensemble du cycle d'analyse :

* Extraction et préparation des données depuis Google BigQuery ;
* Analyse exploratoire des données (EDA) en Python ;
* Calcul et validation des KPI en Python et SQL ;
* Création d'un tableau de bord interactif sous Power BI ;
* Restitution des principaux enseignements et recommandations.

---

## Description du sous-périmètre

### Filtres appliqués

* **Pays :** France
* **Département :** Women
* **Période :** du 01/01/2023 au 31/12/2024

### Source des données

Dataset public Google BigQuery :

`bigquery-public-data.thelook_ecommerce`

### Tables utilisées

| Table       | Description            |
| ----------- | ---------------------- |
| users       | Informations clients   |
| orders      | Informations commandes |
| order_items | Lignes de commandes    |
| products    | Référentiel produits   |

### Clés de jointure

```sql
users.id = orders.user_id

orders.order_id = order_items.order_id

products.id = order_items.product_id
```

---

## Installation et exécution

### Prérequis

* Python 3.11 ou supérieur
* Jupyter Notebook
* Accès à Google BigQuery
* Power BI Desktop

### Installation des dépendances

Cloner le dépôt puis installer les bibliothèques nécessaires :

```bash
pip install -r requirements.txt
```

Principales dépendances utilisées :

```text
pandas
numpy
matplotlib
seaborn
plotly
google-cloud-bigquery
jupyter
```

---

## Reproduire les résultats

### 1. Extraction des données

Exécuter la requête :

```text
sql/extract_sous_perimetre.sql
```

Cette requête :

* applique les filtres métier ;
* reconstitue le sous-périmètre d'analyse ;
* permet l'export des données au format CSV.

Le fichier généré est enregistré dans :

```text
data/thelook_fr_women_2023_2024.csv
```

### 2. Analyse exploratoire des données (EDA)

Exécuter le notebook :

```text
notebooks/01_EDA_python.ipynb
```

Ce notebook contient :

* les contrôles qualité ;
* l'analyse des données ;
* les visualisations exploratoires ;
* le calcul des KPI en Python.

### 3. Calcul des KPI en SQL

Exécuter les requêtes présentes dans le dossier :

```text
sql/
```

Principaux KPI calculés :

* chiffre d'affaires ;
* marge ;
* panier moyen (AOV) ;
* taux de retour ;
* taux de réachat.

### 4. Visualisation Power BI

Ouvrir le fichier :

```text
powerbi/dashboard_thelook.pbix
```

Puis connecter le fichier :

```text
data/thelook_fr_women_2023_2024.csv
```

et actualiser les données.

---

## Dashboard Power BI

Le tableau de bord a été conçu pour faciliter la comparaison entre 2023 et 2024 et répondre aux besoins de pilotage de la direction e-commerce.

### Principaux axes d'analyse

* Évolution mensuelle du chiffre d'affaires et de la marge ;
* Comparaison des KPI entre 2023 et 2024 ;
* Contribution des marques et catégories à la performance ;
* Analyse des retours produits ;
* Analyse du comportement client et du panier moyen ;
* Répartition géographique des clientes.

### Choix de design

* Utilisation d'indicateurs clés (cartes KPI) pour une lecture rapide des performances ;
* Comparaison visuelle systématique entre 2023 et 2024 ;
* Filtres interactifs pour faciliter l'exploration des données ;
* Palette de couleurs cohérente pour distinguer les deux années ;
* Visuels orientés aide à la décision et compréhension métier.

---

## Principaux enseignements

L'analyse permet de :

* mesurer l'évolution de la performance commerciale entre 2023 et 2024 ;
* identifier les catégories et marques les plus contributrices au chiffre d'affaires et à la marge ;
* évaluer l'impact des retours sur la rentabilité ;
* comprendre l'évolution des comportements d'achat des clientes ;
* mettre en évidence les principaux leviers d'amélioration pour l'activité e-commerce.

Les résultats détaillés et recommandations sont présentés dans le tableau de bord Power BI ainsi que dans la soutenance finale.
