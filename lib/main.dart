import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Domino Game',
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/security-alert': (context) => const SecurityAlertPage(),
        '/security-question': (context) => const SecurityQuestionPage(),
        '/maintenance': (context) => const MaintenancePage(),
      },
    );
  }
}

// === TAMPILAN 1: LANDING PAGE ===
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6), Color(0xFFFFA726)],
          ),
        ),
        child: Stack(
          children: [
            // Tombol Service & ID Login di kiri atas
            const Positioned(
              top: 40,
              left: 20,
              child: Column(
                children: [
                  _CircleIconButton(icon: Icons.bolt, label: 'Service'),
                  SizedBox(height: 15),
                  _CircleIconButton(icon: Icons.person, label: 'ID Login'),
                ],
              ),
            ),
            // Konten tengah
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    // Pilihan Wilayah
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.amber.shade400, width: 2),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.public, color: Colors.amber),
                          SizedBox(width: 10),
                          Text('Asia', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_drop_down, color: Colors.amber),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Tombol Facebook
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1877F2),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        icon: const Icon(Icons.facebook, size: 24),
                        label: const Text('Login with Facebook', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Tombol Guest
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9F29),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        icon: const Icon(Icons.person_outline, size: 24, color: Colors.white),
                        label: const Text('Play as Guest', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Kebijakan
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        children: [
                          TextSpan(text: '● I have read and agree to the '),
                          TextSpan(text: 'Privacy Policy', style: TextStyle(color: Colors.lightBlueAccent, decoration: TextDecoration.underline)),
                          TextSpan(text: ' and '),
                          TextSpan(text: 'User Agreement', style: TextStyle(color: Colors.lightBlueAccent, decoration: TextDecoration.underline)),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(flex: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === TAMPILAN 2: ID LOGIN ===
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6), Color(0xFFFFA726)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: 40, left: 20, child: _ColumnIcons()),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.amber.withOpacity(0.5),
                  color: const Color(0xFF2B1600).withOpacity(0.95),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Judul
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFF8C00)]),
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.3), blurRadius: 10)],
                          ),
                          child: const Text(
                            'ID Login',
                            style: TextStyle(color: Color(0xFF4A2F00), fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 25),
                        // User ID
                        const Align(alignment: Alignment.centerLeft, child: Text('User ID', style: TextStyle(color: Colors.amber, fontSize: 16))),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _idController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter User ID',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.amber)),
                            suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.amber),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Password
                        const Align(alignment: Alignment.centerLeft, child: Text('Password', style: TextStyle(color: Colors.amber, fontSize: 16))),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '6-16 Character',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Colors.amber)),
                            suffixIcon: const Icon(Icons.visibility_off, color: Colors.amber),
                          ),
                        ),
                        const SizedBox(height: 25),
                        // Tombol Confirm
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(context, '/security-alert'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              shadowColor: Colors.green.withOpacity(0.5),
                              elevation: 10,
                            ),
                            child: const Text('Confirm', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === TAMPILAN 3: SECURITY ALERT ===
class SecurityAlertPage extends StatelessWidget {
  const SecurityAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6), Color(0xFFFFA726)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: 40, left: 20, child: _ColumnIcons()),
            Center(
              child: Card(
                elevation: 30,
                shadowColor: Colors.black.withOpacity(0.5),
                color: const Color(0xFF2B1600).withOpacity(0.95),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Your account has a security issue,\nplease verify it.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/security-question'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === TAMPILAN 4: SECURITY QUESTION ===
class SecurityQuestionPage extends StatefulWidget {
  const SecurityQuestionPage({super.key});

  @override
  State<SecurityQuestionPage> createState() => _SecurityQuestionPageState();
}

class _SecurityQuestionPageState extends State<SecurityQuestionPage> {
  final TextEditingController _jawaban1 = TextEditingController();
  final TextEditingController _jawaban2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6), Color(0xFFFFA726)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: 40, left: 20, child: _ColumnIcons()),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.amber, size: 28),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(30),
                child: Card(
                  elevation: 30,
                  shadowColor: Colors.amber.withOpacity(0.3),
                  color: const Color(0xFF2B1600).withOpacity(0.95),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFFFFD700), Color(0xFFFF8C00)]),
                            borderRadius: const
// === TAMPILAN 4: SECURITY QUESTION (LANJUTAN) ===
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            boxShadow: [BoxShadow(color: Colors.amber.withOpacity(0.3), blurRadius: 10)],
                          ),
                          child: const Text(
                            'Security Question',
                            style: TextStyle(color: Color(0xFF4A2F00), fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Q1
                        const Text(
                          'Q1  Apa nama film pertama yang Anda tonton?',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _jawaban1,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Silahkan Masukkan Jawaban',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Q2
                        const Text(
                          'Q2  Apa pekerjaan pertama Anda?',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _jawaban2,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Silahkan Masukkan Jawaban',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),

                        // Tombol Send & Change
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/maintenance');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF4CAF50),
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Send',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Change',
                                style: TextStyle(color: Colors.amber, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === TAMPILAN 5: MAINTENANCE ===
class MaintenancePage extends StatelessWidget {
  const MaintenancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF4A90E2), Color(0xFF9B59B6), Color(0xFFFFA726)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: 40, left: 20, child: _ColumnIcons()),
            Center(
              child: Card(
                elevation: 30,
                shadowColor: Colors.black.withOpacity(0.5),
                color: const Color(0xFF2B1600).withOpacity(0.95),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Sistem sedang Maintenance silahkan coba lagi nanti',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18, height: 1.5),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text('Confirm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 30),
                      // Loading bar
                      Container(
                        width: double.infinity,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9 * 0.9,
                              height: 20,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF4CAF50), Color(0xFF8BC34A)],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'Loading... 90%',
                                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === WIDGET BANTUAN ===
class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CircleIconButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.amber, width: 2),
          ),
          child: Icon(icon, color: Colors.amber, size: 24),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

class _ColumnIcons extends StatelessWidget {
  const _ColumnIcons();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _CircleIconButton(icon: Icons.bolt, label: 'Service'),
        SizedBox(height: 15),
        _CircleIconButton(icon: Icons.person, label: 'ID Login'),
      ],
    );
  }
}
