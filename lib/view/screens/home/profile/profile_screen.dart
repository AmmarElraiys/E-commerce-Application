import 'package:e_commerce_application/controller/home/profile_controller.dart';
import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Profil"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<ProfileControllerImp>(
        builder:
            (controller) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Profil Fotoğrafı
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(
                          AppImageassets.profileImage,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // İsim
                    Text(
                      "${controller.username}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Bilgi Kartları
                    cardWidget(title: "${controller.email}", icon: Icons.email),
                    const SizedBox(height: 12),
                    cardWidget(title: "${controller.phone}", icon: Icons.phone),
                    const SizedBox(height: 30),

                    // Düzenle Butonu
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Profili düzenleme işlemi
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text("Profili Düzenle"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
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

class cardWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  const cardWidget({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
      ),
    );
  }
}
