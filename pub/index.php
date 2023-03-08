<?php
require_once('./../src/config.php');

use Steampixel\Route;

Route::add('/', function() {
    //strona wyświetlająca obrazki
    //echo "Strona główna";
    global $twig;
    //pobieranie 10 najnowszych postów
    $postArray = Post::getPage();
    $twigData = array('postArray' => $postArray,
                      'pageTitle' => "Strona Główna");
    $twig->display("index.html.twig", $twigData);
});

Route::add('/upload', function() {
    //wgrywanie obrazków    
    global $twig;
    $twigData = array('pageTitle' => "Strona Główna");
    $twig->display("upload.html.twig", $twigData);

});

Route::add('/upload', function() {
    global $twig;
    if(isset($_POST['submit']))  {
        Post::upload($_FILES['uploadedFile']['tmp_name']);
    }
    header("Location: http://localhost/zadanieMemy/pub");
    
    
}, 'post');

Route::run('/zadanieMemy/pub');

?>