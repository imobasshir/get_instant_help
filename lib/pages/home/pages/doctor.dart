import 'package:flutter/material.dart';
import 'package:get_instant_help/widgets/video_call_buttons.dart';

class Doctor extends StatefulWidget {
  const Doctor({super.key});

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                onPressed: () {},
                text: 'Video Call',
              ),
              VCButton(
                icon: Icons.add_box_sharp,
                onPressed: () {},
                text: 'New Call',
              ),
              VCButton(
                icon: Icons.calendar_today_sharp,
                onPressed: () {},
                text: 'Shedule',
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
    );
  }
}
