import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_call_friend_ui/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class CallScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  const CallScreen({super.key, required this.name, required this.imageUrl});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  //
  // @afifcodes
  // afifcodes.vercel.app/flutter
  //

  @override
  Widget build(BuildContext context) {
    systemUI();
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Calling...',
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/${widget.imageUrl}'),
                    fit: BoxFit.cover)),
            child: Container(
              color: Colors.black.withOpacity(0.85),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Hero(
                  tag: widget.imageUrl,
                  child: AvatarGlow(
                    endRadius: 60,
                    child: Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/${widget.imageUrl}'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                const Spacer(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Icon(
                      Ionicons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'End Call',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
