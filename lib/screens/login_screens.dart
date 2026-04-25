import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Stateful karena ada perubahan UI (loading & toggle password)
class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String errorMessage = '';
  bool isLoading = false;
  bool isPasswordVisible = false;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    await Future.delayed(Duration(seconds: 2));

    if (email == "admin@test.com" && password == "Admin123") {
      Navigator.pushReplacementNamed(
        context,
        '/dashboard',
        arguments: email,
      );
    } else {
      setState(() {
        isLoading = false;
        errorMessage = "Email atau password salah";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  bool validatePassword(String value) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$');
    return regex.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                // 🔥 GANTI ICON JADI GAMBAR
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.jpg',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Lana",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [

                      // EMAIL
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (v) => email = v,
                        validator: (v) {
                          if (v!.isEmpty) return "Email wajib diisi";
                          if (!v.contains("@")) return "Format email salah";
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

                      // PASSWORD
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onChanged: (v) => password = v,
                        validator: (v) {
                          if (v!.isEmpty) return "Password wajib diisi";
                          if (!validatePassword(v)) {
                            return "Minimal 8 karakter, huruf & angka";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20),

                      // BUTTON LOGIN
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : login,
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text("Login"),
                        ),
                      ),

                      // LUPA PASSWORD
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot');
                        },
                        child: Text("Lupa Password?"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}