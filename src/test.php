<?php

    $conn = new mysqli("localhost","root","","member");

    if($conn){
        echo "connect error!";
    }else{
        echo "connect done!";
    }

    phpinfo();
?>