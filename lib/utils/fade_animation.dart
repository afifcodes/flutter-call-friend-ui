import 'dart:async';

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final int delay;
  final Widget child;
  final bool isHorizontal;
  final int duration;

  const FadeAnimation(
      {super.key,
      required this.delay,
      required this.child,
      this.isHorizontal = false,
      this.duration = 1000});

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _fadeAnimation;
  late Animation _slideAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });

    _slideAnimation = Tween<double>(begin: 72, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
    Timer(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _animationController.forward().orCancel;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _fadeAnimation.value,
      child: Transform.translate(
        offset: widget.isHorizontal
            ? Offset(_slideAnimation.value, 0)
            : Offset(0, _slideAnimation.value),
        child: widget.child,
      ),
    );
  }
}
