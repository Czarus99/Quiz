<html>
    <meta charset="utf-8">
    <title>Podstawy</title>
</html>
    <head>
        <body>
            <?php
                print_r ($_POST);
                $count;
            if(isset ($_POST["ukryte"])){
                $count = $_POST["ukryte"];
                $count ++;
            }
            else {
                $count = 0;
            }
            ?>
                <form method="POST">
                    <input name="imie">
                    <input name="nazwisko">
                    <input name="ukryte" type="hidden" value="<?php echo $count; ?>" />
                    <input type="submit">
                </form>
            
        </body>
    </head>