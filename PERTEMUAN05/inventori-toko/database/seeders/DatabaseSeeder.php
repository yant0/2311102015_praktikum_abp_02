<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Buat user demo: Pak Cokomi dan Mas Wowo
        User::factory()->create([
            'name'     => 'Pak Cokomi',
            'email'    => 'cokomi@tokocokwo.com',
            'password' => Hash::make('password'),
        ]);

        User::factory()->create([
            'name'     => 'Mas Wowo',
            'email'    => 'wowo@tokocokwo.com',
            'password' => Hash::make('password'),
        ]);

        // Generate 30 produk dummy menggunakan ProductFactory
        Product::factory(30)->create();
    }
}
