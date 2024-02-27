import 'package:flutter/material.dart';
import 'custom_clipper.dart';
import 'package:riot_sync/screen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController nameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: double.infinity,
            child: _buildInputFields(),
          ),
          _buildSocialLogins(),
        ]),
      ),
    );
  }

  Widget _buildInputFields() {
    return ClipPath(
      clipper: CustomClipperWidget(),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.red,
            Color.fromARGB(155, 180, 0, 0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "Iniciar sesion",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField(
                  nameController, Icons.person_outline, "Nombre de usuario"),
              const SizedBox(height: 20),
              _buildTextField(
                  passwordController, Icons.info_outline, "Contraseña",
                  isPassword: true),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text("Iniciar sesion"),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Olvidé mi contraseña",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Column(
      children: [
        const Text(
          "O inicia sesion con",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/gugul.png'),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTextField(
      TextEditingController controller, IconData icon, String hint,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
      obscureText: isPassword,
    );
  }
}
