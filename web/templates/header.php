<!doctype html>
<html class="no-js" lang="<?= htmlspecialchars($_SESSION["LANGUAGE"] ?? "en", ENT_QUOTES, 'UTF-8') ?>">

<head>
<?php
require $_SERVER["FOXITI"] . "/web/templates/includes/title.php";
require $_SERVER["FOXITI"] . "/web/templates/includes/css.php";
require $_SERVER["FOXITI"] . "/web/templates/includes/js.php";
?>
</head>

<body class="page-<?= strtolower($TAB) ?> lang-<?= htmlspecialchars($_SESSION["LANGUAGE"] ?? "en", ENT_QUOTES, 'UTF-8') ?>">
	<div class="app">
