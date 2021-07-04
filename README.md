# Topics

Topics est une application de type "forum", réalisée en parallèle à la formation "développeur fullstack web-web mobil" avec Oclock.<br>
Nous étions 5 a avoir développer la première version, en utilisant :
- html, css et js pour le front 
- une app express + sequelize pour le CRUD,
- ejs en moteur de template.

Le projet était bien avancé mais pas finalisé quand il a fallu se concentrer sur la suite de la formation (en l'occurence sur React pour certains et la spé data pour d'autres).

Dans ce repo on trouvera un MVP qui vient d'un fork du projet original repris en autonomie, avec une logique séparant le front du back et utilisant notamment le CMS Strapi.

## Qu'est-ce qu'on peut faire avec Topics ?
Sur Topics, un visiteur peut : 
- Vister le site et les différentes pages, lire les sujets ou "Topics" et les messages écrits dans chaque sujet.
- Créer un compte avec un email, un mot de passe et un pseudo.

Un utilisateur connecté peut :
- Ecrire un topic dans une catégorie de son choix, 
- Ecrire un message dans un topic de son choix,
- Modifier ou supprimer un topic ou un message s'il lui appartient.

## Comment ça se passe ?
Le visiteur a accès à toutes les pages du site mais il ne peut pas créer de topics oou écrire de message.

Après avoir créé un compte à l’aide de son email, l’utilisateur connecter a la possibilité de créer un topic avec le formulaire qui est désormais visible dans la page d'une catégorie.

Il peut également créer un message à l'aide d'un formulaire identique visible dans la page d'un topic.

Les formulaires permettent une mise en forme poussée (gras, italique, liste, couleur de police et de fond) et l'utilisation d'emoji.

L'utilisateur a aussi la possibilité de créer un compte en un clic s'il a un compte Google ou Github. Depuis sa page profil il peut également modifier son pseudo, son email ou son mot de passe. Son mot de passe est réinitialisé en cas de perte et envoyé par mail.

## Stack technique :

Frontend avec html, scss et js :
    - axios (communication avec le CMS Strapi),
    - quill.js (rich text editor),

Backend avec Node.js et le framework 'express',
    - axios (communication avec le CMS Strapi),
    - bcrypt (hash password),
    - express-session (gestion des sessions),
    - ejs (moteur de template),
    
CMS Strapi,

SGBD PostgreSQL.
<br>

## Setup

On utilise le CMS Strapi avec postgreSQL, commencer par installer postgreSQL si nécessaire.

```bash
npm i -g postgresql
```
<br>

### 1. CREER un utilisateur et une BDD dédiée, depuis un terminal :

On bascule sur l'utilisateur postgres on lance pgsql en tant que postgres, donc superutilisateur
```bash
sudo -i -u postgres pgsql // 
```

On crée un utilisateur et sa base de donnée.
```sql
CREATE USER forum WITH ENCRYPTED LOGIN "mot_de_passe";

CREATE DATABASE forum OWNER forum;
```
<br>

### 2. Install et setup de l'app Strapi

Installation avec npm, dans un terminal depuis le dossier /topics-AWS/topics-strapi :
```bash
npm install
```

Editer le fichier .env copy pour y indiquer les variables d'environnement.

Pour info, le fichier de config pour le SGBD est ici: [topics-AWS/topics-strapi/config/database.js](./topics-strapi/config/database.js)

Il n'y a pas (encore) de script de seed pour les datas, il faut donc créer à la mano au minimum les catégories dans strapi.
Les catégories à créer pour affichage des pages correspondantes sont les suivantes:
- animals, arts, bdsm, canvas, cinema, sports, technology et videogames.

<br>

### 3. Install et setup de l'app topics

Installation avec npm, dans un terminal depuis le dossier /topics-AWS/topics-app :
```bash
npm install
```
éditer le fichier .env-example, préciser le port souhaité pour l'app et l'url d'accès à strapi en local, http:localhost:1337 par défaut.

éditer le fichier [topics-AWS/topics-app/public/src/js/utils.js](./topics-app/public/src/js/utils.js), préciser l'url pour accéder à l'app strapi depuis un navigateur.
<br>

## Suivi de version:

### V2 : Le 15/06/2021
_Modification pour passage de l'app front + back sur la même instance AWS :_
  - Proxy avec nginx,
  - ssl avec certbot,
  - DNS strapi.ikodi.eu pour accès back,
  - DNS topics.ikodi.eu pour accès front,
  - l'app express interroge strapi en local,
  
  Rq: Auparavant, front hébergé chez Planethoster et strapi chez AWS avec SGBD RDS.
  
### V1 : Le 03/04/2021
- FRONT :
  - Mise en forme du contenu des formulaires avec quill.js,
  - Branchement sur API, les topics et messages sont fetch par le navigateur,
  - Fin intégration page messages d'un topic,

-BACK :
  - Base de données postgreSQL,
  - API réalisée avec le CMS Strapi,
  - Les vues sont servies par node.js + générateur de vues ejs,
  - L'app node.js interroge l'API (localhost), pas de requête à la base pg.

### V0 : état lors du fork le 15/03/2021

#### TO DO :
- BACK :
  - Passer sur une API strapi,

- FRONT :
  - Intégration des formulaires avec Quilljs,
  - Wireframe + intégration page message d'un topic,
  - Gérer le fetch.
  - Revoir l'intégration de la page topics d'une catégorie,
  - Faire le responsive du site (...),

#### DONE :
- BACK :
  - App node.js - express,
  - Base de donnée SQL,
  - Fonctionnalités :
    - Création de sujet pour une catégorie,
    - Post de message dans un sujet (gestion de la modification selon utilisateur),
    - Connexion user (y compris avec API Google et Github),
    - Modification des données user dans l'espace membre,
- FRONT :
  - HTML, CSS et JS, (pas de framework),
  - Signature visuelle avec 'Gandoulf',
  - Intégration visuelle faite pour connexion, profil.
  - Intégration partielle sur homepage, categorie, topics.