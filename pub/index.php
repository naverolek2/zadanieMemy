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
    if(isset($_SESSION['user'])) {
        if(User::isAdmin($_SESSION['user']->getID())) {
            $isAdmin = 1;
        }
        else {
            $isAdmin = 0;
        }
    }
    else {
        $isAdmin = 0;
    }
   
    $twigData = array('postArray' => $postArray,
                      'pageTitle' => "Strona Główna",
                      'isAdmin' =>  $isAdmin
                      );
    if(isset($_SESSION['user'])) {
        $twigData['user'] = $_SESSION['user'];
    }
    $twig->display("index.html.twig", $twigData);
});

Route::add('/', function() {
    global $twig;   
    if(isset($_SESSION['user'])) {
        if(isset($_POST['like'])) {
        if(Liked::likeAdd($_POST['userID'], $_POST['postID'])) {
            header("Location: http://localhost/zadanieMemy/pub/");
        }
        else {
            header("Location: http://localhost/zadanieMemy/pub/");
        }
    }
    if(isset($_POST['dislike'])) {
        if(Liked::likeDelete($_POST['userID'], $_POST['postID'])) {
            header("Location: http://localhost/zadanieMemy/pub/");
        }
        else {
            header("Location: http://localhost/zadanieMemy/pub/");
        }
    }
    }
    else {
        header("Location: http://localhost/zadanieMemy/pub/");

    }
    
    
    
    
}, 'post');




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

Route::add('/logout', function () {
    if(isset($_SESSION['user'])) {
        session_destroy();
        header("Location: http://localhost/zadanieMemy/pub");
        }
        else {
            die("Użytkownik nie był zalogowany");
        }
});

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

Route::add('/admin', function() {
    global $twig;                
    
    if(User::isAuth()) {
        if(User::isAdmin($_SESSION['user']->getID())) {
            

        $postArray = Post::getPage(1,100);
        $twigData = array('postArray' => $postArray);
        $twig->display("admin.html.twig", $twigData);
    }
    else{
        http_response_code(403);
    }
    }  
    else {
        http_response_code(403);
    }
    
    
} );

Route::add('/admin/remove/([0-9])*', function($id) {
    if(Post::remove($id)) {
        header("Location: http://localhost/zadanieMemy/pub/admin");
    }
    else {
        die("Nie udało się usunąć podanego obrazka");
    }
}, );





Route::run('/zadanieMemy/pub');

?>