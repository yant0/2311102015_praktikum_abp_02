<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Kategori produk toko CokWo.
     */
    private array $categories = [
        'Makanan', 'Minuman', 'Snack', 'Bumbu Dapur', 'Kebersihan',
        'Perawatan Diri', 'Alat Tulis', 'Elektronik', 'Obat-Obatan',
    ];

    /**
     * Satuan produk.
     */
    private array $units = ['pcs', 'kg', 'liter', 'dus', 'pack', 'botol', 'sachet'];

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $category = $this->faker->randomElement($this->categories);

        return [
            'name'        => $this->faker->words(fake()->numberBetween(2, 4), true),
            'category'    => $category,
            'description' => $this->faker->sentence(10),
            'stock'       => $this->faker->numberBetween(0, 500),
            'price'       => $this->faker->numberBetween(1000, 500000),
            'unit'        => $this->faker->randomElement($this->units),
        ];
    }
}
