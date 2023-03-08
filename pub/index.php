<?php
require_once('./../src/config.php');

use Steampixel\Route;

Route::add('/', function() {
    //strona wyświetlająca obrazki
    //echo "Strona główna";
    global $twig;
    $twig->display("index.html.twig");
});

Route::add('/upload', function() {
    //wgrywanie obrazków    
    global $twig;
    $twig->display("upload.html.twig");

});

Route::run('/zadanieMemy/pub');

?>