<?php

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Content-Type");
    header("Access-Control-Max-Age: 86400");
    header("HTTP/1.1 200 OK");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json");


    $data = json_decode(file_get_contents('php://input'), true);
    $servername = "127.0.0.1";
    $username = "root";
    $password = "";
    $dbname = "technical_project";

    try{
        $conn = new mysqli($servername, $username, $password, $dbname);
    }catch(Exception $e){
        echo json_encode(['status' => 'failed', 'error' => 'Error saving entry: ' . $e]);
        die();
    }
    
    $name = $conn->real_escape_string($data['name']);
    $email = $conn->real_escape_string($data['email']);
    $phone = $conn->real_escape_string($data['phone']);
    $message = $conn->real_escape_string($data['message']);
    
    $sql = "INSERT INTO entries (name, email, phone, message) VALUES ('$name', '$email', '$phone', '$message')";
    
    if ($conn->query($sql) === TRUE) {
      http_response_code(200);
      echo json_encode(['status' => 'success','message' => 'Entry saved successfully!']);
    } else {
      echo json_encode(['status' => 'failed', 'error' => 'Error saving entry: ' . $conn->error]);
    }
    
    $conn->close();
}

?>
