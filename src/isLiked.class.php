<?php
class isLiked {
    public static function isLik($id, $userID) : bool {
        global $db;
        $query = $db->prepare("SELECT * FROM isliked WHERE 1");
        $query->execute();
        $result = $query->get_result();
        while($row = $result->fetch_assoc()) {
           
            
        }
        return false;
    }
    
}
?>