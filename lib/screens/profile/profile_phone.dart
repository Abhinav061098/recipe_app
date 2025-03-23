import 'package:flutter/material.dart';

class ProfilePhone extends StatelessWidget {
  final String phoneNo;
  final bool isEditingPhoneNo;
  final TextEditingController phoneNoController;
  final bool isAnonymous;
  final VoidCallback onEditSavePressed;
  final bool showEditIcon;
  final bool showUpdateIcon;

  const ProfilePhone({
    Key? key,
    required this.phoneNo,
    required this.isEditingPhoneNo,
    required this.phoneNoController,
    required this.isAnonymous,
    required this.onEditSavePressed,
    this.showEditIcon = true,
    this.showUpdateIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Phone Number',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (showEditIcon)
              IconButton(
                icon: Icon(isEditingPhoneNo ? Icons.save : Icons.edit),
                onPressed: onEditSavePressed,
              ),
            if (showUpdateIcon)
              IconButton(onPressed: onEditSavePressed, icon: Icon(Icons.add))
          ],
        ),
        if (isEditingPhoneNo)
          TextField(
            controller: phoneNoController,
            decoration: InputDecoration(labelText: 'Phone Number'),
          )
        else
          Text(phoneNo),
      ],
    );
  }
}
