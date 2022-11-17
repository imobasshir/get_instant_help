import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_instant_help/services/auth_methods.dart';
import 'package:get_instant_help/utils/colors.dart';
import 'package:get_instant_help/utils/jitsi_meet.dart';
import 'package:get_instant_help/widgets/custom_buttons.dart';
import 'package:get_instant_help/widgets/field.dart';
import 'package:get_instant_help/widgets/meeting_options.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final FirebaseAuthMethods _authMethods =
      FirebaseAuthMethods(FirebaseAuth.instance);
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.user.displayName,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          'Join a Meeting',
          style: TextStyle(
            fontFamily: 'GoogleSans',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Field(
              controller: meetingIdController,
              hintText: 'Room ID',
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Field(
              controller: nameController,
              hintText: 'Name',
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onTap: _joinMeeting,
            text: 'Join',
          ),
          const SizedBox(height: 20),
          MeetingOption(
            text: 'Mute Audio',
            isMute: isAudioMuted,
            onChange: onAudioMuted,
          ),
          MeetingOption(
            text: 'Turn Off My Video',
            isMute: isVideoMuted,
            onChange: onVideoMuted,
          ),
        ],
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
