import 'package:flutter/material.dart';

class AppUserAvatar extends StatelessWidget {
  const AppUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 32),
      itemBuilder: (context) => [
        const PopupMenuItem(
          child: Text('Profile'),
        ),
        const PopupMenuItem(
          child: Text('Logout'),
        ),
      ],
      icon: CircleAvatar(
        foregroundImage: NetworkImage(
          'https://wiki.aiimpacts.org/_media/uncategorized/thispersondoesnotexist.png',
        ),
        child: Image.network(
          'https://thispersonnotexist.org/static/img/Random_female_face_1.jpeg',
        ),
      ),
    );
  }
}
