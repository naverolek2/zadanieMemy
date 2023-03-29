<?php

require_once('./../src/config.php');
session_start();
use Steampixel\Route;

Route::add('/', function() {
    //strona wyświetlająca obrazki
    //echo "Strona główna";
    global $twig;
    //pobieranie 10 najnowszych postów
    $postArray = Post::getPage();
    
    $twigData = array('postArray' => $postArray,
                      'pageTitle' => "Strona Główna",
                      );
    if(isset($_SESSION['user'])) {
        $twigData['user'] = $_SESSION['user'];
    }
    $twig->display("index.html.twig", $twigData);
});

Route::add('/upload', function() {
    //wgrywanie obrazków    
    global $twig;
    $twigData = array('pageTitle' => "Strona Główna");
    if(User::isAuth()) {
        $twigData['user'] = $_SESSION['user'];
        $twig->display("upload.html.twig", $twigData);
    }
    else {
        http_response_code(403);
    }
    
});

Route::add('/upload', function() {
    global $twig;
    if(isset($_POST['submit']))  {
        Post::upload($_FILES['uploadedFile']['tmp_name'], $_POST['userID']);
    }
    header("Location: http://localhost/zadanieMemy/pub");
    
    
}, 'post');


Route::add('/register', function() {
    global $twig;
    $twigData = array('pageTitle' => "Zarejestruj użytkownika");
    $twig->display("register.html.twig", $twigData);
});

Route::add('/register', function() {
    global $twig;
    if(isset($_POST['submit'])) {
        User::register($_POST['email'], $_POST['password']);
    }
    header("Location: http://localhost/zadanieMemy/pub");

}, 'post');

Route::add('/login', function() {
    global $twig;
    $twigData = array('pageTitle' => "Zaloguj użytkownika");
    $twig->display("login.html.twig", $twigData);
});

Route::add('/login', function() {
    global $twig;
    if(isset($_POST['submit'])) {
        if(User::login($_POST['email'], $_POST['password'])) {
            header("Location: http://localhost/zadanieMemy/pub");
        } else {
            $twigData = array('pageTitle' => "Zaloguj użytkownika",
                                "message" => "Niepoprawny login lub hasło!");
            $twig->display("login.html.twig", $twigData);
        }
    }
   

}, 'post');


Route::run('/zadanieMemy/pub');

?>