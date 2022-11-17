import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/pages/videocall/history_meetings.dart';
import 'package:get_instant_help/pages/videocall/video_call_screen.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/utils/jitsi_meet.dart';
import 'package:get_instant_help/widgets/video_call_buttons.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({super.key});
  final FirebaseAuthMethods _authMethods =
      FirebaseAuthMethods(FirebaseAuth.instance);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
      username: _authMethods.user.displayName!,
    );
  }

  joinMeeting(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VideoCallScreen(),
      ),
    );
  }

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctor Video Call',
          style: TextStyle(
            fontFamily: 'GoogleSans',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Video Call',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VCButton(
                  icon: Icons.videocam_sharp,
                  onPressed: () {
                    widget.createNewMeeting();
                  },
                  text: 'Video Call',
                ),
                VCButton(
                  icon: Icons.add_box_sharp,
                  onPressed: () {
                    widget.joinMeeting(context);
                  },
                  text: 'Join Call',
                ),
                VCButton(
                  icon: Icons.history_sharp,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryMeetingScreen(),
                      ),
                    );
                  },
                  text: 'text',
                ),
                VCButton(
                  icon: Icons.chat_sharp,
                  onPressed: () {},
                  text: 'Chats',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
