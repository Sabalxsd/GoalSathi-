import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Colors (swap for your constants/colors.dart if you want)
  static const Color cream = Color(0xFFF5EFE0);
  static const Color coral = Color(0xFFFF6B5B);
  static const Color muted = Color(0xFF9AA79F);
  static const Color hintColor = Color(0xFF6F7D75);
  static const Color card = Color(0xFF1A241E);
  static const Color fieldColor = Color(0xFF0F1713);
  static const Color borderColor = Color(0xFF2E3A33);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool visibility = true;
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => loading = true);

    // TODO: Firebase login
    // await FirebaseAuth.instance.signInWithEmailAndPassword(
    //   email: emailController.text.trim(),
    //   password: passwordController.text,
    // );

    await Future.delayed(const Duration(seconds: 1)); // demo only
    if (!mounted) return;
    setState(() => loading = false);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Logged in')));
  }

  InputDecoration inputStyle(String hint, IconData icon, {Widget? suffix}) {
    OutlineInputBorder border(Color c) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: c),
    );
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: hintColor),
      prefixIcon: Icon(icon, color: muted),
      suffixIcon: suffix,
      filled: true,
      fillColor: fieldColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      enabledBorder: border(borderColor),
      focusedBorder: border(coral),
      errorBorder: border(Colors.redAccent),
      focusedErrorBorder: border(Colors.redAccent),
    );
  }

  Widget socialButton(
      String label, String imagePath, IconData fallback, VoidCallback onTap) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: fieldColor,
          side: const BorderSide(color: borderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 22,
              width: 22,
              errorBuilder: (_, __, ___) =>
                  Icon(fallback, color: cream, size: 24),
            ),
            const SizedBox(width: 8),
            Text(label, style: const TextStyle(color: cream, fontSize: 15)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07120C),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF17432B), Color(0xFF07120C)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: borderColor),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Goal Sathi",
                          style: TextStyle(
                            color: coral,
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Text(
                          "Welcome back",
                          style: TextStyle(
                            color: cream,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text(
                          "Log in to continue your match analysis.",
                          style: TextStyle(color: muted, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Social buttons
                      Row(
                        children: [
                          Expanded(
                            child: socialButton(
                              "Facebook",
                              "assets/images/facebook.png",
                              Icons.facebook,
                                  () {
                                // TODO: Facebook sign-in
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: socialButton(
                              "Google",
                              "assets/images/google-logo.webp",
                              Icons.g_mobiledata,
                                  () {
                                // TODO: Google sign-in
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Expanded(child: Divider(color: borderColor)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("OR", style: TextStyle(color: muted)),
                          ),
                          Expanded(child: Divider(color: borderColor)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: cream),
                        decoration: inputStyle("you@example.com", Icons.email),
                        validator: (v) {
                          final t = v?.trim() ?? '';
                          if (t.isEmpty) return 'Enter your email';
                          if (!t.contains('@') || !t.contains('.')) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Password
                      TextFormField(
                        controller: passwordController,
                        obscureText: visibility,
                        style: const TextStyle(color: cream),
                        decoration: inputStyle(
                          "Your password",
                          Icons.lock,
                          suffix: IconButton(
                            onPressed: () =>
                                setState(() => visibility = !visibility),
                            icon: Icon(
                              visibility
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: muted,
                            ),
                          ),
                        ),
                        validator: (v) => (v == null || v.isEmpty)
                            ? 'Enter your password'
                            : null,
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: coral),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 54,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: coral,
                            foregroundColor: const Color(0xFF1B0B08),
                            elevation: 0,
                          ),
                          onPressed: loading ? null : login,
                          child: loading
                              ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Color(0xFF1B0B08),
                            ),
                          )
                              : const Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(color: muted)),
                            GestureDetector(
                              onTap: () {
                                // TODO: go to sign up screen
                              },
                              child: const Text(
                                "Sign up",
                                style: TextStyle(
                                  color: coral,
                                  fontWeight: FontWeight.w600,
                                ),
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
          ),
        ),
      ),
    );
  }
}