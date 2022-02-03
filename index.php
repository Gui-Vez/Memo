<?php
    

    /////////////////////////////////
    // TRISTAN LAPOINTE (e1995593) //
    // GUILLAUME VÉZINA (e1939817) //
    /////////////////////////////////


    // Tous : Code de connexion


    // Intégrer la base de données pour le menu
    $connexion = mysqli_connect("localhost", "root", "");

    // Utiliser UTF-8 
    mysqli_query($connexion, "SET NAMES 'UTF8'");

    // Sélectionner la BD "memo"
    mysqli_select_db($connexion, "memo_e1995593_e1939817");


    // Modifier le format de la date d'ajout
    // $date_modifiee = date_format('date_ajout',"Y/m/d H:i:s");


    // 3) Ajout : Requête INSERT

    // Si l'utilisateur entre une nouvelle tâche ET que le texte n'est pas vide,
    if (isset($_POST['texteTache']) && trim($_POST['texteTache']) != '')
    {
        // Envoyer le texte de la tâche dans la BD
        $texte = mysqli_real_escape_string($connexion, $_POST['texteTache']);

        // Insérer les valeurs 'texte' et 'accomplie' dans une nouvelle tâche
        $nouvelleTache = "INSERT INTO tache (texte, accomplie) VALUES ('$texte', 0)";

        // Ajouter la tâche dans la BD
        mysqli_query($connexion, $nouvelleTache);
    }
    

    // 5) Basculer l'état : Requête Update

    // Si l'utilisateur bascule l'état d'une tâche,
    if (isset($_GET['basculer']))
    {
        // Obtenir la valeur de la tâche qui a été basculée
        $valeurBaculer = mysqli_real_escape_string($connexion, $_GET['basculer']);

        // Mettre à jour la tâche qui a été basculée pour la rendre accomplie ou non
        mysqli_query($connexion, "UPDATE tache SET accomplie = !accomplie WHERE id = $valeurBaculer");
    }


    // 2) Affichage : Requête SELECT

    // Sélectioner les éléments 'id', 'texte' 'accomplie' et 'date d'ajout' de la tâche
    $requeteTache = "SELECT
                      id,
                      texte,
                      accomplie,
                      date_ajout
                    FROM tache

                    # Afficher les tâches plus récentes en premier (Ordre décroissant)
                    ORDER BY date_ajout DESC";


    // 4) Filtrer : clause WHERE ajoutée à la requête ci-dessus

    // Si l'utilisateur filtre ses tâches,
    if (isset($_GET['filtrer']))
    {
        // D'après ce que filtre l'utilisateur:
        switch ($_GET['filtrer'])
        {
            // Non-complétées: Sélectionner uniquement les tâches qui ne sont pas accomplies
            case 0: $requeteTache = "SELECT * FROM tache WHERE accomplie = 0"; break;

            // Complétées: Sélectionner uniquement les tâches qui sont accomplies
            case 1: $requeteTache = "SELECT * FROM tache WHERE accomplie = 1"; break;

            // Toutes: Ignorer
            default: ;
        }
    }

    $resultatTache = mysqli_query($connexion, $requeteTache);
?>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Test | Liste de tâches</title>
    <meta name="description" content="Application Web de gestion de tâches - à produire dans le cadre du TP du cours.">
    <link rel="stylesheet" href="ressources/css/styles.css">
</head>
<body>
    <div class="conteneur">
        <a href="index.php"><h1>MEMO</h1></a>
        <form method="post" autocomplete="off" action="index.php">
            <input autofocus class="quoi-faire" type="text" name="texteTache" placeholder="">
        </form>
        <div class="filtres">
            <!-- Les liens suivants permettent de filtrer les tâches -->
            <a href="index.php?filtrer=1" title="Afficher les tâches complétées uniquement.">Complétées</a>
            <a href="index.php?filtrer=0" title="Afficher les tâches non-complétées uniquement.">Non-complétées</a>
            <!-- Le lien suivant revient à l'affichage par défaut : toutes les tâches -->
            <a href="index.php" title="Afficher toutes les tâches.">Toutes</a>
        </div>

        <ul class="liste-taches">

            <!-- Boucle While -->
            <?php while($enregistrement = mysqli_fetch_assoc($resultatTache)) : ?>

                <!-- Si l'on détecte que la tâche est accomplie, mettre une classe -->
                <li <?php if ($enregistrement['accomplie'] == 1)
                      { ?>
                        class="accomplie"
                <?php } ?>>

                    <span class="coche"><a href="index.php?basculer=<?= $enregistrement['id']; ?>" title="Cliquez pour faire basculer l'état de cette tâche."><img src="ressources/images/coche.svg" alt=""></a></span>

                    <span class="texte"><?= $enregistrement['texte'] ?></span>

                    <span class="ajout"><?= $enregistrement['date_ajout'] ?></span>

                </li>

            <!-- Fin de la boucle -->
            <?php endwhile; ?>
        </ul>
    </div>
</body>
</html>