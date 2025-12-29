import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sos_countdown_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeHer Travel'),
        centerTitle: true,
        backgroundColor: const Color(0xFF6B4CE6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Welcome card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome 👋',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your safety companion for solo travel.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // PANIC-SAFE SOS BUTTON
GestureDetector(
onLongPress: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const SosCountdownPage(),
    ),
  );
},
  child: Container(
    height: 80,
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.4),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: const Text(
      'HOLD FOR SOS',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    ),
  ),
),

const SizedBox(height: 12),

const Text(
  'Press and hold if you feel unsafe. Help will be alerted immediately.',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontSize: 13,
    color: Colors.grey,
  ),
),


            // Placeholder features
            Expanded(
              child: ListView(
                children: const [
                  _FeatureTile(
                    icon: Icons.location_on_outlined,
                    title: 'Live Location',
                    subtitle: 'Share your live location with trusted contacts',
                  ),
                  _FeatureTile(
                    icon: Icons.map_outlined,
                    title: 'Nearby Help',
                    subtitle: 'Find police stations & hospitals nearby',
                  ),
                  _FeatureTile(
                    icon: Icons.chat_outlined,
                    title: 'Safety Assistant',
                    subtitle: 'Chat with AI for travel safety tips',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6B4CE6)),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
