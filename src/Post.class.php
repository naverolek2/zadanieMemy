<?php
class Post {
    private int $id;
    private string $filename;
    private string $timestamp;


    function __construct(int $i, string $f, string $t) {
        $this->id = $i;
        $this->filename = $f;
        $this->timestamp = $t;
    }

    public function getFilename() : string {
        return $this->filename;
    }
    public function getTimestamp() : string {
        return $this->timestamp;
    }


    //zwraca ostatnio dodany obraz
    static function getLast() : Post {
        
        global $db;
        
        $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT 1");
       //JEBAĆ CIE MICHAŁ
        $query->execute();
       
        $result = $query->get_result();
        
        $row = $result->fetch_assoc();
        //tworzenie nowego obiektu
        $p = new Post($row['ID'], $row['filename'], $row['timestamp']);
        
        return $p; 
    }

    static function getPage(int $pageNumber = 1, int $postsPerPage = 10) : array {
        //łączenie z bazą
        global $db;
        $query = $db->prepare("SELECT * FROM post ORDER BY timestamp DESC LIMIT ? OFFSET ?");
        $offset =  ($pageNumber-1)*$postsPerPage;
        $query->bind_param('ii', $postsPerPage, $offset);
        $query->execute();
        $result = $query->get_result();
        $postsArray = array();
        // pobiera wiersz jako tabele asocjacyjną
        while($row = $result->fetch_assoc()) {
            $post = new Post($row['ID'], $row['filename'], $row['timestamp']);
            array_push($postsArray, $post);
        }
        return $postsArray;

    }

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
        //czy plik istnieje 
        if(file_exists($newFileName)) {
            die("BŁĄD: Podany plik już istnieje!");
        }
        //zaczytujemy cały obraz z folderu tymczasowego do stringa
        $imageString = file_get_contents($tempFileName);
        
        //@nie pokazuje zagrozen
        $gdImage = @imagecreatefromstring($imageString);
        //zapisujemy w formacie webp
        imagewebp($gdImage, $newFileName);

        global $db;
        
        $query = $db->prepare("INSERT INTO post VALUES(NULL, ?, ?)");
        
        $dbTimestamp = date("Y-m-d H:i:s");
        
        $query->bind_param("ss", $dbTimestamp, $newFileName);
        if(!$query->execute())
            die("Błąd zapisu do bazy danych");

    }
}

?>
