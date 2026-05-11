import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nabungo/main.dart';
import 'package:nabungo/presentation/widgets/common/gradient_button.dart';
import 'package:nabungo/presentation/widgets/common/glass_card.dart';
import 'package:nabungo/presentation/widgets/common/empty_state.dart';
import 'package:nabungo/core/constants/colors.dart';

void main() {
  testWidgets('NabungoApp renders without error', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: NabungoApp(isDark: false)));
    expect(find.text('Nabungo'), findsOneWidget);
  });

  group('GradientButton', () {
    testWidgets('renders label text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GradientButton(label: 'Submit', onPressed: () {}))),
      );
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('shows loading indicator when isLoading is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GradientButton(label: 'Submit', isLoading: true))),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Submit'), findsNothing);
    });

    testWidgets('is disabled when isLoading', (WidgetTester tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GradientButton(
          label: 'Submit',
          isLoading: true,
          onPressed: () => pressed = true,
        ))),
      );
      await tester.tap(find.byType(GradientButton));
      expect(pressed, false);
    });
  });

  group('GlassCard', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: GlassCard(child: Text('Hello')))),
      );
      expect(find.text('Hello'), findsOneWidget);
    });
  });

  group('EmptyState', () {
    testWidgets('renders title and subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: EmptyState(
          title: 'No Data',
          subtitle: 'Add some items',
          icon: Icons.inbox_outlined,
        ))),
      );
      await tester.pumpAndSettle();
      expect(find.text('No Data'), findsOneWidget);
      expect(find.text('Add some items'), findsOneWidget);
    });
  });

  group('AppColors', () {
    test('primary color is navy', () {
      expect(AppColors.primary, const Color(0xFF1B2A4A));
    });

    test('accent color is emerald', () {
      expect(AppColors.accent, const Color(0xFF2ED573));
    });
  });
}
