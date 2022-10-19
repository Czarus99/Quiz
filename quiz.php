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
            $los = rand(1, $max);
            // if isset($_POST)
            
            
            $zap = $con->query("Select id, treść FROM pytania WHERE id=$los");
            $wyp = $zap->fetch_all(MYSQLI_ASSOC);
                for($i=0;$i<count($wyp); $i++){
                    echo $wyp[$i]["treść"]."<br>";
                    
                }
            ?>
        </div>
        <div>
            
            <?php
            $odp = $con->query("SELECT `id`, `Treść` FROM `odpowiedzi` 
                                JOIN pytania_has_odpowiedzi ON pytania_has_odpowiedzi.Odpowiedzi_id=odpowiedzi.id
                                WHERE pytania_has_odpowiedzi.Pytania_id = $los");
            
            echo '<form method="POST">';
            echo '<input type="hidden" name="questionid" value="'.$los.'"/>';
            $wypodp = $odp->fetch_all(MYSQLI_ASSOC);
                for($i=0; $i<count($wypodp); $i++){
                    echo '<label><input type="checkbox" name="idodpowiedzi" value="'.$wypodp[$i]["id"].'">'.$wypodp[$i]["Treść"]."</label><br>";
                }
            echo '<input type="submit">';
            echo '</form>';
                
           
            
        print_r($_POST);
         
            
        ?>
            
        </div>
    </body>
</html>