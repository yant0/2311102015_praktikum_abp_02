<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            Dashboard — Toko CokWo
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">

            {{-- Kartu Statistik --}}
            <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 mb-8">
                @php
                    $totalProduk   = \App\Models\Product::count();
                    $totalStok     = \App\Models\Product::sum('stock');
                    $nilaiInventori = \App\Models\Product::selectRaw('SUM(stock * price) as total')->value('total');
                @endphp

                <div class="bg-white rounded-lg shadow-sm p-6 border-l-4 border-indigo-500">
                    <div class="text-sm text-gray-500 uppercase tracking-wider">Total Produk</div>
                    <div class="text-3xl font-bold text-gray-900 mt-1">{{ number_format($totalProduk) }}</div>
                    <div class="text-xs text-gray-400 mt-1">jenis produk terdaftar</div>
                </div>

                <div class="bg-white rounded-lg shadow-sm p-6 border-l-4 border-emerald-500">
                    <div class="text-sm text-gray-500 uppercase tracking-wider">Total Stok</div>
                    <div class="text-3xl font-bold text-gray-900 mt-1">{{ number_format($totalStok) }}</div>
                    <div class="text-xs text-gray-400 mt-1">unit di seluruh produk</div>
                </div>

                <div class="bg-white rounded-lg shadow-sm p-6 border-l-4 border-amber-500">
                    <div class="text-sm text-gray-500 uppercase tracking-wider">Nilai Inventori</div>
                    <div class="text-2xl font-bold text-gray-900 mt-1">Rp {{ number_format($nilaiInventori, 0, ',', '.') }}</div>
                    <div class="text-xs text-gray-400 mt-1">estimasi nilai stok</div>
                </div>
            </div>

            {{-- Selamat datang --}}
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6">
                    <h3 class="text-lg font-semibold text-gray-800 mb-2">
                        Selamat datang, {{ Auth::user()->name }}! 👋
                    </h3>
                    <p class="text-gray-600 text-sm">
                        Ini adalah sistem inventari <strong>Toko CokWo</strong> milik Pak Cokomi dan Mas Wowo.
                        Kelola semua produk toko melalui menu <a href="{{ route('products.index') }}" class="text-indigo-600 font-medium hover:underline">Produk</a>.
                    </p>
                </div>
            </div>

        </div>
    </div>
</x-app-layout>
