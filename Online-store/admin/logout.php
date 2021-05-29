<?php
session_start();
$_SESSION['alogin'] == "";
session_unset();
$_SESSION['errmsg'] = "Вы успешно вышли из аккаунта администратора";
?>
<script language="javascript">
    document.location = "index.php";
</script>