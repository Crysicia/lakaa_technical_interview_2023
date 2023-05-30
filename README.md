# Lakaa technical interview (Full-stack internship)

## How to run the app 🔧
**Backend**
- Go to the backend folder: `cd lakaa_backend`
- Install the dependencies `bundle install`
- Create the database and run the migrations `rails db:create db:migrate`
- Seed the database `rails db:seed
- Run the server `rails s`

**Frontend**
- Go to the frontend folder: `cd lakaa_frontend`
- Install the dependencies `npm install`
- Run the server `npm start dev`

## Technical choices ⚙️
**ahem** let's switch back to french for this one.
- Blueprinter pour la sérialisation des données. Je voulais apprendre à l'utiliser mais ce n'est clairement pas le meilleur choix. La gem génêre énormément de requêtes lors de la sérialisation des associations...
- Soft delete des indicateurs de collecte pour ne perdre aucune donnée même après suppression des indicateurs.
- Relation many to many entre les indicateurs et les collectes. Plus facile à query qu'un array d'indicateurs dans chaque collecte et évite la duplication de l'information.
- chota.css pour le front, je ne suis clairement pas très bon en css et j'ai bien aimé l'approche minimaliste de la librairie.

## What I would like to improve 🚀
- Filtre des collectes par association / indicateur.
- Ajout d'unités cohérentes pour chaque indicateur.
- Restaurations d'indicateurs supprimés.
- Edition de collectes passées.
