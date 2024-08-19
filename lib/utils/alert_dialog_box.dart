import 'package:flutter/material.dart';
import 'package:flutter_to_do/constants/color_constants.dart';
import 'package:flutter_to_do/utils/button.dart';

class AlertDialogBox extends StatelessWidget {
  final TextEditingController controller; // Specified type for the controller
  final VoidCallback onsave; // Marked as final for immutability
  final VoidCallback cancel; // Marked as final for immutability

  const AlertDialogBox({
    super.key,
    required this.controller,
    required this.onsave,
    required this.cancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.mainwhite,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller:
                  controller, // Assigned the controller to the TextField
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Create a new task",
                  fillColor: ColorConstants.mainwhite),
            ),
            const SizedBox(
                height: 15), // Added spacing between the TextField and buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(text: "save", onPressed: onsave),
                Button(text: "cancel", onPressed: cancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
