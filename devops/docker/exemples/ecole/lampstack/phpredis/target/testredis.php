<?php 
   //Connecting to Redis server on localhost 
   $redis = new Redis(); 
   $redis->connect('redis', 6379); 
   echo "Connection to server sucessfully"; 
   
   // Get the stored data and print it 
   $arList = $redis->lrange("tutorial-list", 0 ,5); 
   echo "Stored string in redis:: "; 
   print_r($arList); 
?>
