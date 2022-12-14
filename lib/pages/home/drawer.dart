import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/terms/contact_page.dart';
import 'package:get_instant_help/pages/terms/terms_page.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final Stream<QuerySnapshot> usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 20,
                child: ClipOval(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  "Logged in as",
                  style: TextStyle(fontFamily: 'GoogleSans', fontSize: 16),
                ),
              ),
              subtitle: !user.isAnonymous
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        user.displayName == null
                            ? Text(
                                user.email!.split('@')[0],
                                style: const TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16,
                                ),
                              )
                            : Text(
                                user.displayName!,
                                style: const TextStyle(
                                  fontFamily: 'GoogleSans',
                                  fontSize: 16,
                                ),
                              ),
                        StreamBuilder<QuerySnapshot>(
                          stream: usersStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            return Text(
                              snapshot.hasData
                                  ? snapshot.data!.docs
                                      .where((doc) => doc.id == user.uid)
                                      .first
                                      .get('type')
                                      .toString()
                                      .toUpperCase()
                                  : 'Loading...',
                              style: const TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 16,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Anonymous User',
                          style: TextStyle(
                            fontFamily: 'GoogleSans',
                            fontSize: 16,
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: usersStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            return Text(
                              snapshot.hasData
                                  ? snapshot.data!.docs
                                      .where((doc) => doc.id == user.uid)
                                      .first
                                      .get('type')
                                      .toString()
                                      .toUpperCase()
                                  : 'Loading...',
                              style: const TextStyle(
                                fontFamily: 'GoogleSans',
                                fontSize: 16,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
              onTap: () {},
            ),
          ),
          ListTile(
            title: const Text(
              "Terms of Use",
              style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => Terms(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Contact Info",
              style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ContactPage()));
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
            ),
            trailing: const Icon(Icons.call_made),
            onTap: () {
              context.read<FirebaseAuthMethods>().signOut(context);
            },
          ),
          ListTile(
            title: const Text(
              'Delete Account',
              style: TextStyle(fontFamily: 'GoogleSans', fontSize: 15),
            ),
            trailing: const Icon(Icons.call_made),
            onTap: () {
              context.read<FirebaseAuthMethods>().deleteAccount(context);
            },
          ),
        ],
      ),
    );
  }
}
