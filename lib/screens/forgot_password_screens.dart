import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  bool isLoading = false;

  void submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Link reset telah dikirim ke email Anda")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lupa Password")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Reset Password",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) => email = v,
                  validator: (v) {
                    if (v!.isEmpty) return "Email wajib diisi";
                    if (!v.contains("@")) return "Format email salah";
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : submit,
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Kirim Link Reset"),
                ),
              ),

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Kembali ke Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}