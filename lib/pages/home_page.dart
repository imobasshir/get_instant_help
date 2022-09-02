import 'package:flutter/material.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/widgets/custom_buttons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Instant Help'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (user.isAnonymous)
                const Text(
                  'Anonymous User',
                  style: TextStyle(fontSize: 32),
                ),
              if (!user.isAnonymous)
                Text(
                  user.email!.split('@')[0],
                  style: const TextStyle(fontSize: 32),
                ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign Out',
              ),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
                text: 'Delete Account',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
