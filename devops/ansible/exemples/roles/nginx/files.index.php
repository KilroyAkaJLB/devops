<html>
<body>
<?php
$current_ip=exec("ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'");

echo "Hello from server ". $current_ip;
?>
</body>
</html>

