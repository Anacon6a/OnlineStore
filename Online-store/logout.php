<?php
session_start();
include("includes/config.php");
$_SESSION['login']=="";
date_default_timezone_set('Europe/Moscow');
$ldate=date( 'Y-m-d H:i:s ', time () );
mysqli_query($con,"UPDATE userlog  SET logout = '$ldate' WHERE userEmail = '".$_SESSION['login']."' ORDER BY id DESC LIMIT 1");
session_unset();
$_SESSION['errmsg']="Вы успешно вышли из системы";
echo "<script type='text/javascript'> document.location ='index.php'; </script>";
?>

