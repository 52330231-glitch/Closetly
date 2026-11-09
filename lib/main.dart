import 'package:flutter/material.dart';

void main() {
  runApp(const ClosetlyApp());
}

class ClosetlyApp extends StatelessWidget {
  const ClosetlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Closetly',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5EFE6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF722F43),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Tops',
    'Pants',
    'Dresses',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5EFE6),
        title: const Text(
          'Closetly',
          style: TextStyle(
            color: Color(0xFF722F43),
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your wardrobe, your style.',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A3035),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Organize your clothes and create your favorite looks.',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'My Wardrobe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              children: categories.map((category) {
                return ChoiceChip(
                  label: Text(category),
                  selected: selectedCategory == category,
                  selectedColor: const Color(0xFF722F43),
                  labelStyle: TextStyle(
                    color: selectedCategory == category
                        ? Colors.white
                        : const Color(0xFF722F43),
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 35),

            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.checkroom,
                    size: 75,
                    color: Color(0xFF722F43),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Your wardrobe starts here!',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Add your clothes and start organizing.',
                    style: TextStyle(color: Colors.brown),
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add Item feature coming soon!'),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add New Item'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF722F43),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}