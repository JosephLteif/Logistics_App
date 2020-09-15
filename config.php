<?php
$username="root";//change username 
$password=""; //change password
$host="127.0.0.1";
$db_name="logistics"; //change databasename

$connect=mysqli_connect($host,$username,$password,$db_name);

if(!$connect)
{
	echo json_encode("Connection Failed");
}

?>