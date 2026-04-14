<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');

$profil = [
    ['nama' => 'Budi',    'pekerjaan' => 'Web Developer',  'lokasi' => 'Jakarta'],
    ['nama' => 'Sari',    'pekerjaan' => 'UI/UX Designer', 'lokasi' => 'Bandung'],
    ['nama' => 'Andi',    'pekerjaan' => 'Data Analyst',   'lokasi' => 'Surabaya'],
    ['nama' => 'Dewi',    'pekerjaan' => 'Mobile Developer','lokasi' => 'Yogyakarta'],
    ['nama' => 'Rizky',   'pekerjaan' => 'DevOps Engineer', 'lokasi' => 'Medan'],
];

echo json_encode($profil);
