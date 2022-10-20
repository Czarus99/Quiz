<html>
    <meta charset="utf-8">
    <title>Podstawy</title>
</html>
    <head>
        <body>
            <?php
                session_start(); ESSION["ukryte"])){
                $c = $_SESSION["ukryte"];
                $c ++;
                $_SESSION['ukryte']=$c;
            }
            else {
                $_SESSION['ukryte']=0;
            }
            print_r($_SESSION);
            ?>
            
                <form method="POST">
                    <input name="imie">
                    <input name="nazwisko">
                    <input name="ukryte" type="hidden" value="1" />
                    <input type="submit">
                </form>
            
        </body>
    </head>