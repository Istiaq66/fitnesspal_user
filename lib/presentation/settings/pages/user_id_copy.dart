import 'package:fitnesspal_user/utils/managers/color_manager.dart';
import 'package:fitnesspal_user/utils/managers/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserIDScreen extends StatelessWidget {
  final String userId;

  const UserIDScreen({super.key, required this.userId}); // Replace with the actual user ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: AppBar(
        leading: IconButton(
          splashColor: ColorManager.grey3,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: SizeManager.s20,
            color: ColorManager.white,
          ),
        ),
        backgroundColor: ColorManager.darkGrey,
        title: const Text("User ID",style: TextStyle(color: ColorManager.white,),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Displaying the User ID in a read-only TextField
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display the User ID
                  Text(
                    userId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),

                  // Copy Icon Button
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.blueAccent),
                    onPressed: () {
                      _copyToClipboard(context, userId);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Button for an additional copy option
            ElevatedButton(
              onPressed: () {
                _copyToClipboard(context, userId);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16), backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Copy User ID",style: TextStyle(color: ColorManager.white,),),
            ),
          ],
        ),
      ),
    );
  }

  // Method to copy the User ID to the clipboard
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("User ID copied to clipboard!"),
      ),
    );
  }
}