<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include "dbinfo.inc";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>
<html>
<body>
<h1>Sample page</h1>

<h2>TODO</h2>
<ol>
<?php
  foreach($db->query("SELECT content FROM todo_list") as $row) {
?>
  <li><?=$row['content']?></li>
<?php
  }
?>
</ol>

</body>
</html>
