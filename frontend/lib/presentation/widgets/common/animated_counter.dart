import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final double value;
  final String prefix;
  final String suffix;
  final TextStyle? style;
  final int decimals;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.prefix = '',
    this.suffix = '',
    this.style,
    this.decimals = 0,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldValue = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _oldValue = widget.value;
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _oldValue = oldWidget.value;
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final current = _oldValue + (widget.value - _oldValue) * _animation.value;
        final numberFormat = NumberFormat('#,##0', 'id_ID');
        int displayValue;
        if (widget.decimals > 0) {
          displayValue = (current * pow(10, widget.decimals)).round();
        } else {
          displayValue = current.round();
        }
        
        String text;
        if (widget.decimals > 0) {
          final val = displayValue / pow(10, widget.decimals);
          text = '${widget.prefix}${val.toStringAsFixed(widget.decimals)}${widget.suffix}';
        } else {
          text = '${widget.prefix}${numberFormat.format(displayValue)}${widget.suffix}';
        }

        return Text(text, style: widget.style);
      },
    );
  }
}

class NumberFormat {
  final String pattern;
  final String locale;
  NumberFormat(this.pattern, this.locale);
  String format(int number) {
    String str = number.toString();
    String result = '';
    int count = 0;
    for (int i = str.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) result = '.$result';
      result = str[i] + result;
      count++;
    }
    return result;
  }
}
