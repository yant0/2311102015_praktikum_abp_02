import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 07 – Flutter Widgets',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: const HomePage(),
    );
  }
}

// ─────────────────────────────────────────
// Shared data
// ─────────────────────────────────────────
const List<String> buahList = [
  'Apel', 'Mangga', 'Jeruk', 'Semangka', 'Anggur', 'Pisang',
  'Nanas', 'Durian', 'Pepaya',
];

const List<Color> gridColors = [
  Color(0xFF6C63FF), Color(0xFFFF6584), Color(0xFF43C59E),
  Color(0xFFFFB347), Color(0xFF56CCF2), Color(0xFFEB5757),
];

// ─────────────────────────────────────────
// Home – tab navigator
// ─────────────────────────────────────────
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  static const List<({String label, IconData icon, Widget page})> _tabs = [
    (label: 'Container', icon: Icons.square_rounded,  page: ContainerDemo()),
    (label: 'GridView',  icon: Icons.grid_view,       page: GridViewDemo()),
    (label: 'ListView',  icon: Icons.list,             page: ListViewDemo()),
    (label: 'Builder',   icon: Icons.format_list_bulleted, page: ListViewBuilderDemo()),
    (label: 'Separated', icon: Icons.horizontal_rule, page: ListViewSeparatedDemo()),
    (label: 'Stack',     icon: Icons.layers,           page: StackDemo()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pertemuan 07 – ${_tabs[_index].label}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: _tabs[_index].page,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          for (final t in _tabs)
            NavigationDestination(icon: Icon(t.icon), label: t.label),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 1. Container
// ─────────────────────────────────────────
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container dasar berwarna
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF56CCF2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x556C63FF),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Container',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Container dengan padding & margin
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFFB347),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Dengan Padding & Margin',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// 2. GridView
// ─────────────────────────────────────────
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: buahList.length,
      itemBuilder: (context, index) {
        final color = gridColors[index % gridColors.length];
        return Container(
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.emoji_food_beverage, color: color, size: 40),
              const SizedBox(height: 8),
              Text(
                buahList[index],
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Item ${index + 1}',
                style: TextStyle(color: color.withValues(alpha: 0.7), fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────
// 3. ListView (statis – A, B, C)
// ─────────────────────────────────────────
class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (label: 'A', subtitle: 'Item pertama', icon: Icons.looks_one, color: const Color(0xFF6C63FF)),
      (label: 'B', subtitle: 'Item kedua',   icon: Icons.looks_two, color: const Color(0xFFFF6584)),
      (label: 'C', subtitle: 'Item ketiga',  icon: Icons.looks_3,   color: const Color(0xFF43C59E)),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Text('ListView statis (3 item)', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        for (final item in items)
          Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item.color,
                child: Icon(item.icon, color: Colors.white),
              ),
              title: Text(item.label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// 4. ListView.builder
// ─────────────────────────────────────────
class ListViewBuilderDemo extends StatelessWidget {
  const ListViewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: buahList.length,
      itemBuilder: (context, index) {
        final color = gridColors[index % gridColors.length];
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Text(
                '${index + 1}',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(buahList[index], style: const TextStyle(fontWeight: FontWeight.w600)),
            subtitle: const Text('Dari data array buahList'),
            trailing: Icon(Icons.favorite_border, color: color),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────
// 5. ListView.separated
// ─────────────────────────────────────────
class ListViewSeparatedDemo extends StatelessWidget {
  const ListViewSeparatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: buahList.length,
      separatorBuilder: (context, index) => const Divider(
        color: Color(0xFF6C63FF),
        thickness: 1.5,
        indent: 72,
      ),
      itemBuilder: (context, index) {
        final color = gridColors[index % gridColors.length];
        return ListTile(
          leading: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color),
            ),
            child: Icon(Icons.local_florist, color: color),
          ),
          title: Text(buahList[index], style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text('Buah nomor ${index + 1}'),
        );
      },
    );
  }
}

// ─────────────────────────────────────────
// 6. Stack
// ─────────────────────────────────────────
class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Stack – Layer bertumpuk',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 20),

          // Stack 1: kotak bertumpuk
          SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                // Layer bawah
                Container(
                  width: 280,
                  height: 280,
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C63FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // Layer tengah
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6584),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                // Layer atas
                Positioned(
                  top: 40,
                  left: 40,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF43C59E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Stack!\nLayer 3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Stack 2: gambar + badge teks
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 280,
                height: 140,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFB347), Color(0xFFEB5757)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const Text(
                'Background Layer',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Badge',
                    style: TextStyle(
                      color: Color(0xFFEB5757),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
