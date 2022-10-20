<html>
    <meta charset="utf-8">
    <title>Podstawy</title>
</html>
    <head>
        <body>
            <?php
                print_r ($_COOKIE);
                $count;
            if(isset ($_COOKIE["ukryte"])){
                $count = $_COOKIE["ukryte"];
                $count ++;
            }
            else {
                $count = 0;
            }
            setcookie("ukryte", $count);
            ?>
                <form method="POST">
                    <input name="imie">
                    <input name="nazwisko">
                    <input name="ukryte" type="hidden" value="<?php echo $count; ?>" />
                    <input type="submit">
                </form>
            
        </body>
    </head>