<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Tampilkan daftar semua produk.
     */
    public function index()
    {
        $products = Product::latest()->paginate(10);
        return view('products.index', compact('products'));
    }

    /**
     * Tampilkan form tambah produk baru.
     */
    public function create()
    {
        $categories = $this->getCategories();
        $units      = $this->getUnits();
        return view('products.create', compact('categories', 'units'));
    }

    /**
     * Simpan produk baru ke database.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'category'    => 'required|string|max:100',
            'description' => 'nullable|string|max:1000',
            'stock'       => 'required|integer|min:0',
            'price'       => 'required|numeric|min:0',
            'unit'        => 'required|string|max:50',
        ]);

        Product::create($validated);

        return redirect()->route('products.index')
            ->with('success', 'Produk berhasil ditambahkan!');
    }

    /**
     * Tampilkan form edit produk.
     */
    public function edit(Product $product)
    {
        $categories = $this->getCategories();
        $units      = $this->getUnits();
        return view('products.edit', compact('product', 'categories', 'units'));
    }

    /**
     * Update produk di database.
     */
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'category'    => 'required|string|max:100',
            'description' => 'nullable|string|max:1000',
            'stock'       => 'required|integer|min:0',
            'price'       => 'required|numeric|min:0',
            'unit'        => 'required|string|max:50',
        ]);

        $product->update($validated);

        return redirect()->route('products.index')
            ->with('success', 'Produk berhasil diperbarui!');
    }

    /**
     * Hapus produk dari database.
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return redirect()->route('products.index')
            ->with('success', 'Produk berhasil dihapus!');
    }

    /**
     * Daftar kategori produk.
     */
    private function getCategories(): array
    {
        return [
            'Makanan',
            'Minuman',
            'Snack',
            'Bumbu Dapur',
            'Kebersihan',
            'Perawatan Diri',
            'Alat Tulis',
            'Elektronik',
            'Obat-Obatan',
        ];
    }

    /**
     * Daftar satuan produk.
     */
    private function getUnits(): array
    {
        return ['pcs', 'kg', 'liter', 'dus', 'pack', 'botol', 'sachet'];
    }
}
