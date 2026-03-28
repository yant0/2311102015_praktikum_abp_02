<?php
// menghitung nilai akhir dengan operator aritmatika (Asumsi bobot: Tugas 30%, UTS 30%, UAS 40%)
function hitungNilaiAkhir($tugas, $uts, $uas) {
    return ($tugas * 0.3) + ($uts * 0.3) + ($uas * 0.4);
}

function tentukanGrade($nilai) {
    if ($nilai >= 85) {
        return "A";
    } elseif ($nilai >= 75) {
        return "B";
    } elseif ($nilai >= 60) {
        return "C";
    } elseif ($nilai >= 50) {
        return "D";
    } else {
        return "E";
    }
}

function tentukanStatus($nilai) {
    if ($nilai >= 60) {
        return "Lulus";
    } else {
        return "Tidak Lulus";
    }
}

$mahasiswa = [
    [
        "nama" => "Muhammad Yanto",
        "nim" => "2311102011", 
        "nilai_tugas" => 80,
        "nilai_uts" => 75,
        "nilai_uas" => 85
    ],
    [
        "nama" => "Net and Yahoo",
        "nim" => "2311102012", 
        "nilai_tugas" => 50,
        "nilai_uts" => 55,
        "nilai_uas" => 60
    ],
    [
        "nama" => "Joe Biden",
        "nim" => "2311102013", 
        "nilai_tugas" => 90,
        "nilai_uts" => 88,
        "nilai_uas" => 92
    ]
];

$total_kelas = 0;
$nilai_tertinggi = 0;
$jumlah_mhs = count($mahasiswa);

?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Sistem Penilaian Mahasiswa</title>
    <style>
        body { font-family: 'Papyrus', 'Comic Sans MS', Arial, sans-serif; padding: 20px; }
        table { border-collapse: collapse; width: 60%; margin-bottom: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .statistik { margin-top: 20px; font-weight: bold; }
    </style>
</head>
<body>

    <h2>Data Penilaian Mahasiswa</h2>

    <table>
        <tr>
            <th>Nama</th>
            <th>NIM</th>
            <th>Nilai Tugas</th>
            <th>Nilai UTS</th>
            <th>Nilai UAS</th>
            <th>Nilai Akhir</th>
            <th>Grade</th>
            <th>Status</th>
        </tr>

        <?php
        foreach ($mahasiswa as $mhs) {
            $nilai_akhir = hitungNilaiAkhir($mhs['nilai_tugas'], $mhs['nilai_uts'], $mhs['nilai_uas']);
            $grade = tentukanGrade($nilai_akhir);
            $status = tentukanStatus($nilai_akhir);

            $total_kelas += $nilai_akhir;
            if ($nilai_akhir > $nilai_tertinggi) {
                $nilai_tertinggi = $nilai_akhir;
            }

            echo "<tr>";
            echo "<td>" . $mhs['nama'] . "</td>";
            echo "<td>" . $mhs['nim'] . "</td>";
            echo "<td>" . $mhs['nilai_tugas'] . "</td>";
            echo "<td>" . $mhs['nilai_uts'] . "</td>";
            echo "<td>" . $mhs['nilai_uas'] . "</td>";
            echo "<td>" . $nilai_akhir . "</td>";
            echo "<td>" . $grade . "</td>";
            echo "<td>" . $status . "</td>";
            echo "</tr>";
        }
        
        $rata_rata_kelas = $total_kelas / $jumlah_mhs;
        ?>

    </table>

    <div class="statistik">
        <p>Rata-rata Kelas: <?php echo number_format($rata_rata_kelas, 2); ?></p>
        <p>Nilai Tertinggi: <?php echo $nilai_tertinggi; ?></p>
    </div>

</body>
</html>