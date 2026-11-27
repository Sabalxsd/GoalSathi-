import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Put your images in assets/images/ and list them in pubspec.yaml
  static const highlights = [
    {'label': 'Gojo', 'image': 'assets/images/gojo.jpeg'},
    {'label': 'Goku', 'image': 'assets/images/goku.jpeg'},
    {'label': 'Kakashi', 'image': 'assets/images/kakashi.jpeg'},
    {'label': 'Killua', 'image': 'assets/images/killua.jpeg'},
  ];

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF6FF),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () {},
        ),
        title: const Text('Sabal Khanal',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar + stats
              Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFDDE3D8),
                    backgroundImage: AssetImage('assets/images/bird.jpeg'),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _stat('50', 'Posts'),
                        _stat('100M', 'Followers'),
                        _stat('1', 'Following'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Name + bio
              const Text('sxbal.exe',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text(
                'lost in a different world 🌙\n',
                style: TextStyle(color: Colors.lightBlue, fontSize: 13),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.black,width: 1)
                            )
                        ),
                        onPressed: (){},
                        child: Text("Follow")),
                  ),
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                        onPressed: (){},
                        child: Text("Message")),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: highlights.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, i) {
                    final h = highlights[i];
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                            Border.all(color: Colors.black87, width: 1.5),
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey.shade800,
                            backgroundImage: AssetImage(h['image']!),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(h['label']!, style: const TextStyle(fontSize: 12)),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}