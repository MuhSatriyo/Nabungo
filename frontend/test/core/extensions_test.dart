import 'package:flutter_test/flutter_test.dart';
import 'package:nabungo/core/utils/extensions.dart';

void main() {
  group('NumberFormatting', () {
    test('rupiah formats correctly', () {
      expect(50000.rupiah, 'Rp 50.000');
      expect(0.rupiah, 'Rp 0');
      expect(1000000.rupiah, 'Rp 1.000.000');
    });

    test('compactRupiah formats correctly', () {
      expect(5000.compactRupiah, 'Rp 5rb');
      expect(1000000.compactRupiah, 'Rp 1,0jt');
      expect(500.compactRupiah, 'Rp 500');
    });
  });

  group('DateTimeFormatting', () {
    test('dayMonth formats correctly', () {
      final date = DateTime(2024, 1, 5);
      expect(date.dayMonth, '5 Jan');
    });

    test('monthYear formats correctly', () {
      final date = DateTime(2024, 3, 1);
      expect(date.monthYear, 'Maret 2024');
    });
  });
}
