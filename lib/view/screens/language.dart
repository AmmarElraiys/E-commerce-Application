import 'package:e_commerce_application/core/constant/imageassets.dart';
import 'package:e_commerce_application/core/constant/routes.dart';
import 'package:e_commerce_application/core/localization/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final ChangelocalController controller = Get.put(ChangelocalController());

  String? selectedLangCode;

  final List<Map<String, String>> languages = [
    {"code": "ar", "label": "🇸🇦 Arabic"},
    {"code": "en", "label": "🇺🇸 English"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 164, 198, 237),
              Color.fromARGB(255, 151, 194, 240),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Spacer(flex: 2),
                Lottie.asset(AppImageassets.language, height: 150),
                const SizedBox(height: 16),
                Text(
                  "1".tr, // Choose Your Language
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedLangCode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "🌍 Select Language",
                    ),
                    items:
                        languages.map((lang) {
                          return DropdownMenuItem<String>(
                            value: lang["code"],
                            child: Text(
                              lang["label"]!,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedLangCode = value;
                      });
                      if (value != null) {
                        controller.changeLang(value);
                        Get.toNamed(AppRoutes.onBoarding);
                      }
                    },
                  ),
                ),

                const Spacer(flex: 3),
                Text(
                  "© 2025 Your App Name",
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:e_commerce_application/core/constant/routes.dart';
// import 'package:e_commerce_application/core/localization/changelocal.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Language extends GetView<ChangelocalController> {
//   const Language({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             children: [
//               const Spacer(flex: 2),
//               Text(
//                 "1".tr, // "Choose Your Language"
//                 style: Theme.of(context).textTheme.headlineSmall,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 40),
//               buildLanguageButton(
//                 context,
//                 langCode: "ar",
//                 text: "🇸🇦  ${"2".tr}", // "Arabic"
//               ),
//               const SizedBox(height: 20),
//               buildLanguageButton(
//                 context,
//                 langCode: "en",
//                 text: "🇺🇸  ${"3".tr}", // "English"
//               ),
//               const Spacer(flex: 3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildLanguageButton(
//     BuildContext context, {
//     required String langCode,
//     required String text,
//   }) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         child: Text(text, style: Theme.of(context).textTheme.headlineLarge),
//         style: ElevatedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           backgroundColor: Colors.blueAccent,
//           foregroundColor: Colors.white,
//         ),
//         onPressed: () {
//           controller.changeLang(langCode);
//           Get.toNamed(AppRoutes.onBoarding);
//         },
//       ),
//     );
//   }
// }
