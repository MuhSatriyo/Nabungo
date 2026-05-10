import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../providers/transaction_provider.dart';
import '../../widgets/common/gradient_button.dart';
import '../../../core/constants/colors.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  String _type = 'expense';
  double _amount = 0;
  int? _categoryId;
  bool _isLoading = false;

  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  static final List<Map<String, dynamic>> _categories = [
    {'id': 1, 'name': 'Makan', 'icon': Icons.restaurant, 'color': const Color(0xFFFF6B6B), 'type': 'expense'},
    {'id': 2, 'name': 'Jajan', 'icon': Icons.icecream, 'color': const Color(0xFFFFA502), 'type': 'expense'},
    {'id': 3, 'name': 'Transport', 'icon': Icons.directions_car, 'color': const Color(0xFF2ED573), 'type': 'expense'},
    {'id': 4, 'name': 'Nongkrong', 'icon': Icons.local_cafe, 'color': const Color(0xFFA29BFE), 'type': 'expense'},
    {'id': 5, 'name': 'Top Up', 'icon': Icons.smartphone, 'color': const Color(0xFFFD79A8), 'type': 'expense'},
    {'id': 6, 'name': 'Belanja', 'icon': Icons.shopping_cart, 'color': const Color(0xFFFDCB6E), 'type': 'expense'},
    {'id': 7, 'name': 'Tagihan', 'icon': Icons.receipt_long, 'color': const Color(0xFFE17055), 'type': 'expense'},
    {'id': 11, 'name': 'Gaji', 'icon': Icons.payments, 'color': const Color(0xFF00B894), 'type': 'income'},
    {'id': 12, 'name': 'Freelance', 'icon': Icons.laptop, 'color': const Color(0xFF0984E3), 'type': 'income'},
  ];

  List<Map<String, dynamic>> get _filteredCategories =>
      _categories.where((c) => c['type'] == _type || c['type'] == 'both').toList();

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _quickAmount(String val) {
    setState(() {
      _amountController.text = val;
      _amount = double.tryParse(val) ?? 0;
    });
  }

  Future<void> _submit() async {
    if (_amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan nominal')),
      );
      return;
    }
    if (_categoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pilih kategori')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref.read(transactionProvider.notifier).createTransaction({
        'type': _type,
        'amount': _amount,
        'category_id': _categoryId,
        'note': _noteController.text,
        'date': DateTime.now().toIso8601String(),
      });
      if (mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_type == 'expense' ? 'Pengeluaran dicatat!' : 'Pemasukan dicatat!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Type toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() { _type = 'expense'; _categoryId = null; }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _type == 'expense' ? AppColors.danger : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.trending_down, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text('Expense', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() { _type = 'income'; _categoryId = null; }),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: _type == 'income' ? AppColors.success : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.trending_up, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text('Income', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Amount input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                autofocus: true,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  prefixText: 'Rp ',
                  prefixStyle: theme.textTheme.displayMedium?.copyWith(
                    color: theme.textTheme.displayMedium?.color,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: '0',
                  border: InputBorder.none,
                  filled: false,
                ),
                onChanged: (v) => _amount = double.tryParse(v) ?? 0,
              ),
            ),
            // Quick amounts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['5000', '10000', '20000', '50000', '100000', '200000'].map((val) {
                  return ActionChip(
                    label: Text('Rp ${NumberFormat('#,##0', 'id_ID').format(int.parse(val))}',
                      style: const TextStyle(fontSize: 12)),
                    onPressed: () => _quickAmount(val),
                  );
                }).toList(),
              ),
            ),
            const Divider(height: 32),
            // Category selector
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Category', style: theme.textTheme.titleMedium),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 8,
                runSpacing: 12,
                children: _filteredCategories.map((cat) {
                  final selected = _categoryId == cat['id'];
                  return GestureDetector(
                    onTap: () => setState(() {
                      _categoryId = cat['id'] as int;
                    }),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 56) / 4,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? (cat['color'] as Color).withValues(alpha: 0.15)
                            : (isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.08)),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected ? cat['color'] as Color : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(cat['icon'] as IconData,
                            color: selected ? cat['color'] as Color : null,
                            size: 24),
                          const SizedBox(height: 6),
                          Text(cat['name'] as String,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                            )),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            // Note input
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  hintText: 'Add note (optional)',
                  prefixIcon: Icon(Icons.edit_note),
                ),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 24),
            // Submit button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GradientButton(
                label: _type == 'expense' ? 'Add Expense' : 'Add Income',
                isLoading: _isLoading,
                icon: _type == 'expense' ? Icons.trending_down : Icons.trending_up,
                colors: _type == 'expense'
                    ? [AppColors.danger, AppColors.danger.withValues(alpha: 0.8)]
                    : [AppColors.success, AppColors.success.withValues(alpha: 0.8)],
                onPressed: _submit,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 300.ms);
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
