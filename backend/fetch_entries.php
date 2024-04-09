<?php

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Methods: POST");
    header("Access-Control-Allow-Headers: Content-Type");
    header("Access-Control-Max-Age: 86400");
    header("HTTP/1.1 200 OK");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    header("Access-Control-Allow-Origin: *");
    header("Content-Type: application/json");


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

    $sql = "SELECT * FROM entries ORDER BY created_at DESC";
    $result = $conn->query($sql);

   

    if ($result->num_rows > 0) {
        // Fetch all rows into an associative array
        $entries = [];
        while ($row = $result->fetch_assoc()) {
            
            $entries[] = $row;
        }
        echo json_encode(['status' => 'success', 'data' => $entries]);
    } else {
        echo json_encode(['status' => 'success', 'data' => []]); // No records found
    }

    $conn->close();
    
}

?>