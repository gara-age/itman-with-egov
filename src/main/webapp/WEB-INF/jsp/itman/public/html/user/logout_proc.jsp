<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" %>

<?php
session_start();

session_unset();
session_destroy();

header("location: ../index.php");
?>