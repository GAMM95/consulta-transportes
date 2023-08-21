<?php
$action = $_GET['action'] ?? '';

require_once '../app/Controllers/LoginController.php';

$controller = new LoginController();

switch ($action) {
    case 'login':
        $controller->processLogin();
        break;
    default:
        $controller->showLoginForm();
        break;
}
