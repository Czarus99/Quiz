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
        
        
        
        
        <div>
        <?php
            $con = new mysqli("127.0.0.1", "root", "", "quiz");
            $zap = $con->query("Select id, treść FROM pytania");
            if()
            
        ?>
        </div>
    </body>
</html>