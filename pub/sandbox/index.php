<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <label for="uploadedFileInput">
            Wybierz plik do wgrania na serwer:

        </label><br>
        <input type="file" name="uploadedFile" id="uploadedFileInput" required><br>
        <input type="submit" value="Wyślij plik" name="submit"><br>
    </form>

    <?php 
        if(isset($_POST['submit'])) {
            //echo "<pre>";
            //var_dump($_FILES);

            $targetDir = "img/";
            $sourceFileName = $_FILES['uploadedFile']['name'];

           
            $tempURL = $_FILES['uploadedFile']['tmp_name'];
            $imgInfo = getimagesize($tempURL);
            if(!is_array($imgInfo)) {
                die("BŁĄD: Podany plik nie jest obrazem!");
            }

            $newFileName = hash("sha256", $sourceFileName) . hrtime(true) . ".webp";

            $imageString = file_get_contents($tempURL);
            $gdImage = @imagecreatefromstring($imageString);


            $targetURL = $targetDir . $newFileName;



            if(file_exists($targetURL)) {
                die("BŁĄD: Podany plik już istnieje");
            }


            //move_uploaded_file($tempURL, $targetURL);
            imagewebp($gdImage, $targetURL);


        }
    ?>
</body>
</html>