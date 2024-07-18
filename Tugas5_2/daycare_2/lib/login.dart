import 'package:flutter/material.dart';
import 'orang_tua_page.dart';
import 'models.dart';

class LoginPage extends StatefulWidget {
  final List<Anak> anakList;

  const LoginPage({super.key, required this.anakList});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            _inputField(context),
            _forgotPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Little Garden",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Where Little Ones Blossom in Nature"),
      ],
    );
  }

  _inputField(context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              'images/1.png', // Path to your image
              height: 120, // Adjusted height for the image
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // Adjusted border radius
                    borderSide: BorderSide.none
                ),
                fillColor: Colors.lightGreen.withOpacity(0.1),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjusted padding
                prefixIcon: const Icon(Icons.person)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Adjusted border radius
                  borderSide: BorderSide.none),
              fillColor: Colors.lightGreen.withOpacity(0.1),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Adjusted padding
              prefixIcon: const Icon(Icons.password),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_usernameController.text == "admin" && _passwordController.text == "password") {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrtuPage(anakList: widget.anakList),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid Credentials'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill input')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 15), // Adjusted padding
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 15), // Adjusted font size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {
        // Handle forgot password functionality here
      },
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.lightGreen),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: const Text("Sign Up", style: TextStyle(color: Colors.lightGreen),)
        )
      ],
    );
  }
}