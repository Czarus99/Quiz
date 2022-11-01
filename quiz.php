<html>

<head>
    <title>Quiz</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="styl.css">
</head>

<body>

    <div class="esia">
        <img src="MinerCard.png" height="100%">
        <img class="" src="ogien.png">
        <img src="MinerCard.png" height="100%">
    </div>




    <div class="pytanie">
        <?php
        $con = new mysqli("localhost", "root", "", "quiz");
        $ile = $con->query("Select count(id) FROM pytania");
        $max = $ile->fetch_array()[0];
        $pytania = [];
        $odpowiedzi = [];
        $index = 0;

        if (isset($_POST["quest"]) && isset($_POST["index"]) && isset($_POST["odpowiedzi"])) {
            $pytania = unserialize($_POST["quest"]);
            $index = $_POST["index"];
            $odpowiedzi = unserialize($_POST["odpowiedzi"]);


            array_push($odpowiedzi, $_POST["idodpowiedzi"]);
        } else {
            while (count($pytania) < 5) {
                $los = rand(1, $max);
                if (!in_array($los, $pytania)) {
                    $pytania[] = $los;
                }
            }
        }
        if ($index >= 5) {
            $iloscpoprawnych=0;
            $maksymalnie=0;

            
            
            for ($i = 0; $i < count($pytania); $i++) {
                $zap = $con->query("SELECT `id`, `Tresc`, `Poprawna` FROM `odpowiedzi` JOIN pytania_has_odpowiedzi 
                ON pytania_has_odpowiedzi.Odpowiedzi_id=odpowiedzi.id WHERE pytania_has_odpowiedzi.Pytania_id =" . $pytania[$i] . ";
            ");
                $wyp = $zap->fetch_all(MYSQLI_ASSOC);
                for ($j = 0; $j < count($wyp); $j++) {
                    if($wyp[$j]["Poprawna"]==1){
                        $maksymalnie++;
                        if(in_array($wyp[$j]["id"],$odpowiedzi[$i])){
                            $iloscpoprawnych++;
                        }
                    }
                }
                
            }
            echo "Maksymalna ilość punktów to: ".$maksymalnie."<br>";
            echo "Twoja ilość punktów to: ".$iloscpoprawnych."<br>";
        } else {
            $zap = $con->query("Select id, tresc FROM pytania WHERE id=" . $pytania[$index] . ";");
            $wyp = $zap->fetch_all(MYSQLI_ASSOC);
            for ($i = 0; $i < count($wyp); $i++) {
                echo $wyp[$i]["tresc"] . "<br>";
            }
        }
        ?>
    </div>
    <div>

        <?php
        if ($index < 5) {
            $odp = $con->query("SELECT `id`, `Tresc` FROM `odpowiedzi` 
                                JOIN pytania_has_odpowiedzi ON pytania_has_odpowiedzi.Odpowiedzi_id=odpowiedzi.id
                                WHERE pytania_has_odpowiedzi.Pytania_id =" . $pytania[$index] . "");

            echo '<form method="POST">';

            $wypodp = $odp->fetch_all(MYSQLI_ASSOC);
            for ($i = 0; $i < count($wypodp); $i++) {
                echo '<label><input type="checkbox" name="idodpowiedzi[]" value="' . $wypodp[$i]["id"] . '">' . $wypodp[$i]["Tresc"] . "</label><br>";
            }

            echo '<input type="hidden" name="odpowiedzi" value=' . serialize($odpowiedzi) . '>';
            echo '<input type="hidden" name="quest" value="' . serialize($pytania) . '">';
            echo '<input type="hidden" name="index" value="' . ($index + 1) . '">';
            echo '<input type="submit">';
            echo '</form>';
        }



        ?>

    </div>
</body>

</html>