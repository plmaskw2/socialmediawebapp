<?php

$serverName = "172.28.0.2";
$dBUsername = "root";
$dBPassword = "root";
$dBName = "klik_database";

$conn = mysqli_connect($serverName, $dBUsername, $dBPassword, $dBName, 3306);

if (!$conn)
{
    die("Connection failed: ". mysqli_connect_error());
}


