<?php
class Post {
    static function upload(string $tempFileName) {
        
        $targetDir = "img/";
        
        $imgInfo = getimagesize($tempFileName);
        

        if(!is_array($imgInfo)) {
            die("BŁĄD: Przekazany plik nie jest obrazem!");
        }
        
        // losowy numer od 10000 do 99999 + obecny czas do ms
        $randomNumber = rand(10000, 99999) . hrtime(true);
        
        $hash = hash("sha256", $randomNumber);
        //tworzymy docelowy url pliku graficznego na serwerze
        $newFileName = $targetDir . $hash . ".webp";
        //sprawdź czy plik przypadkiem już nie istnieje
        if(file_exists($newFileName)) {
            die("BŁĄD: Podany plik już istnieje!");
        }
        //zaczytujemy cały obraz z folderu tymczasowego do stringa
        $imageString = file_get_contents($tempFileName);
        //generujemy obraz jako obiekt klasy GDImage
        //@ przed nazwa funkcji powoduje zignorowanie ostrzeżeń
        $gdImage = @imagecreatefromstring($imageString);
        //zapisujemy w formacie webp
        imagewebp($gdImage, $newFileName);

        global $db;
        //stwórz kwerendę
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)");
        //przygotuj znacznik czasu dla bazy danych
        $dbTimestamp = date("Y-m-d H:i:s");
        //zapisz dane do bazy
        $query->bind_param("ss", $dbTimestamp, $newFileName);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");

    }
}

?>
