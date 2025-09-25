import 'package:delivery_app/pages/auth/login.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final String role; // 'Rider' หรือ 'Customer'

  const RegisterScreen({super.key, required this.role});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 241, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ปุ่ม Back
              IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              SizedBox(height: 8),

              // รูปโปรไฟล์
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // ชื่อผู้ใช้
              _buildInputField(Icons.person, 'User Name'),
              SizedBox(height: 12),

              // เบอร์โทร
              _buildInputField(Icons.phone, 'Phone'),
              SizedBox(height: 12),

              // ที่อยู่
              // ที่อยู่ (เฉพาะ Customer เท่านั้น)
              if (widget.role == 'Customer') ...[
                _buildInputField(Icons.home, 'Address'),
                SizedBox(height: 12),
              ],

              // รหัสผ่าน
              TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  hintText: 'Input Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed:
                        () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Must include letter, number and a character',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(height: 12),

              // ยืนยันรหัสผ่าน
              TextField(
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Re-enter Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed:
                        () => setState(
                          () =>
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Must match with above password',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(height: 24),

              // ปุ่ม Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue[700],
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(IconData icon, String hint) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
