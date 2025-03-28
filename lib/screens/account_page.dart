import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yummy/models/models.dart';

typedef LogoutCallback = void Function(bool didLogout);

class AccountPage extends StatefulWidget {
  final User user;
  final LogoutCallback onLogOut;
  
  const AccountPage({
    super.key,
    required this.user,
    required this.onLogOut,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  Widget buildMenu() {
    return ListView(
      children: [
        ListTile(
          title: const Text('View my other projects'),
          onTap: () async {
            await launchUrl(Uri.parse('https://github.com/marcelovet'));
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
            widget.onLogOut(true);
          },
        )
      ],
    );
  }

  Widget buildProfile() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60.0, // Adjust the radius to change the size of the avatar
          backgroundImage: AssetImage(widget.user.profileImageUrl),
        ),
        const SizedBox(height: 16.0),
        Text(
          widget.user.firstName,
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        Text(widget.user.role),
        Text(
          '${widget.user.points} points',
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            buildProfile(),
            Expanded(
              child: buildMenu(),
            )
          ],
        ),
      ),
    );
  }
}