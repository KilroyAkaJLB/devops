<p><?php echo 'We are running PHP, version: ' . phpversion(); ?></p>  


<?php
 $database ="testdb";  
 $user = "tetsdbuser";  
 $password = "tdbr123";  
 $host = "mysql";  

 $connection = new PDO("mysql:host={$host};dbname={$database};charset=utf8", $user, $password);  
 $query = $connection->query("SELECT * FROM materiel");  
 $resultset = $query->fetchAll(PDO::FETCH_ASSOC);  

  if (empty($resultset)) {
    echo "<p>There are no tables in database \"{$database}\".</p>";
  } else {
    echo "<p>Table materiel has the following lines:</p>";
    echo "<ul>";
    foreach ($resultset as $line) {
        echo "<li>$line[id] - $line[libelle]</li>";
      }
    echo "</ul>";
  }
?>
