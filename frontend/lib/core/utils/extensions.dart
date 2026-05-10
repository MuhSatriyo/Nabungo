import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension NumberFormatting on num {
  String get rupiah {
    final format = NumberFormat('#,##0', 'id_ID');
    return 'Rp ${format.format(this)}';
  }

  String get compactRupiah {
    if (this >= 1000000) {
      return 'Rp ${(this / 1000000).toStringAsFixed(1)}jt';
    } else if (this >= 1000) {
      return 'Rp ${(this / 1000).toStringAsFixed(0)}rb';
    }
    return 'Rp $this';
  }
}

extension DateTimeFormatting on DateTime {
  String get formatted {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inDays == 0) {
      if (diff.inHours == 0) {
        return '${diff.inMinutes}m ago';
      }
      return '${diff.inHours}h ago';
    } else if (diff.inDays == 1) {
      return 'Yesterday';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    }
    return DateFormat('d MMM', 'id_ID').format(this);
  }

  String get fullDate {
    return DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(this);
  }

  String get monthYear {
    return DateFormat('MMMM yyyy', 'id_ID').format(this);
  }

  String get dayMonth {
    return DateFormat('d MMM', 'id_ID').format(this);
  }
}

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screenSize => mediaQuery.size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  bool get isDark => theme.brightness == Brightness.dark;
  bool get isSmallScreen => screenWidth < 360;
}
