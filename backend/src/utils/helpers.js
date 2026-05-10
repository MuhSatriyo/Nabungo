const autoCategorize = (note) => {
  if (!note) return null;
  const lower = note.toLowerCase();

  const rules = [
    { keywords: ['kopi', 'coffee', 'kafe', 'cafe', 'starbuck', ' fore ', 'mcd'], category: 'Jajan' },
    { keywords: ['gojek', 'grab', 'maxim', 'ojek', 'taksi', 'taxi', 'bensin', 'parkir', 'tol'], category: 'Transport' },
    { keywords: ['indomaret', 'alfamart', 'alfamidi', 'supermarket', 'minimarket'], category: 'Belanja' },
    { keywords: ['makan', 'nasi', 'ayam', 'bakso', 'soto', 'mi ', 'mie', 'sate', 'gorengan'], category: 'Makan' },
    { keywords: ['nongkrong', 'cafe', 'kopi', 'ngopi'], category: 'Nongkrong' },
    { keywords: ['pulsa', 'kuota', 'paket data', 'top up', 'topup', 'diamond', 'voucher'], category: 'Top Up' },
    { keywords: ['listrik', 'air', 'internet', 'wifi', 'pdam', 'pln', 'bpjs', 'sewa', 'iuran'], category: 'Tagihan' },
    { keywords: ['gaji', 'honor', 'upah', 'pendapatan'], category: 'Gaji' },
    { keywords: ['freelance', 'project', 'proyek'], category: 'Freelance' },
  ];

  for (const rule of rules) {
    if (rule.keywords.some(k => lower.includes(k))) {
      return rule.category;
    }
  }
  return null;
};

const getDateRange = (period) => {
  const now = new Date();
  let start, end;

  switch (period) {
    case 'today':
      start = new Date(now.getFullYear(), now.getMonth(), now.getDate());
      end = new Date(start);
      end.setDate(end.getDate() + 1);
      break;
    case 'week':
      const dayOfWeek = now.getDay();
      start = new Date(now);
      start.setDate(now.getDate() - dayOfWeek);
      start.setHours(0, 0, 0, 0);
      end = new Date(start);
      end.setDate(end.getDate() + 7);
      break;
    case 'month':
      start = new Date(now.getFullYear(), now.getMonth(), 1);
      end = new Date(now.getFullYear(), now.getMonth() + 1, 1);
      break;
    case 'year':
      start = new Date(now.getFullYear(), 0, 1);
      end = new Date(now.getFullYear() + 1, 0, 1);
      break;
    default:
      return null;
  }
  return { start, end };
};

const generateInsights = async (userId, query) => {
  const insights = [];
  const db = require('../config/database');

  const monthlyQuery = await db.query(
    `SELECT 
      COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) as total_expense,
      COALESCE(SUM(CASE WHEN type = 'income' THEN amount ELSE 0 END), 0) as total_income
    FROM transactions 
    WHERE user_id = $1 
      AND date >= date_trunc('month', CURRENT_DATE)
      AND date < date_trunc('month', CURRENT_DATE) + INTERVAL '1 month'`,
    [userId]
  );
  const monthly = monthlyQuery.rows[0];

  const lastMonthQuery = await db.query(
    `SELECT 
      COALESCE(SUM(CASE WHEN type = 'expense' THEN amount ELSE 0 END), 0) as total_expense
    FROM transactions 
    WHERE user_id = $1 
      AND date >= date_trunc('month', CURRENT_DATE - INTERVAL '1 month')
      AND date < date_trunc('month', CURRENT_DATE)`,
    [userId]
  );
  const lastMonth = lastMonthQuery.rows[0];

  const topCategory = await db.query(
    `SELECT c.name, COALESCE(SUM(t.amount), 0) as total
    FROM transactions t
    JOIN categories c ON t.category_id = c.id
    WHERE t.user_id = $1 
      AND t.type = 'expense'
      AND t.date >= date_trunc('month', CURRENT_DATE)
    GROUP BY c.name
    ORDER BY total DESC
    LIMIT 1`,
    [userId]
  );

  const weekExpense = await db.query(
    `SELECT COALESCE(SUM(amount), 0) as total
    FROM transactions
    WHERE user_id = $1 
      AND type = 'expense'
      AND date >= date_trunc('week', CURRENT_DATE)
      AND date < date_trunc('week', CURRENT_DATE) + INTERVAL '1 week'`,
    [userId]
  );

  const lastWeekExpense = await db.query(
    `SELECT COALESCE(SUM(amount), 0) as total
    FROM transactions
    WHERE user_id = $1 
      AND type = 'expense'
      AND date >= date_trunc('week', CURRENT_DATE - INTERVAL '1 week')
      AND date < date_trunc('week', CURRENT_DATE)`,
    [userId]
  );

  const weekTotal = parseFloat(weekExpense.rows[0].total);
  const lastWeekTotal = parseFloat(lastWeekExpense.rows[0].total);
  const monthlyExpense = parseFloat(monthly.total_expense);
  const lastMonthExpense = parseFloat(lastMonth.total_expense);

  const budgetQuery = await db.query(
    `SELECT COALESCE(SUM(amount), 0) as total_budget FROM budgets WHERE user_id = $1 AND month = date_trunc('month', CURRENT_DATE)`,
    [userId]
  );
  const totalBudget = parseFloat(budgetQuery.rows[0].total_budget);

  if (lastWeekTotal > 0 && weekTotal > 0) {
    const diff = ((weekTotal - lastWeekTotal) / lastWeekTotal) * 100;
    if (Math.abs(diff) > 10) {
      insights.push({
        type: diff > 0 ? 'warning' : 'success',
        title: diff > 0 ? 'Pengeluaran minggu ini naik' : 'Pengeluaran minggu ini turun',
        message: `Pengeluaran kamu ${diff > 0 ? 'naik' : 'turun'} ${Math.abs(diff).toFixed(0)}% dibanding minggu lalu`,
      });
    }
  }

  if (totalBudget > 0 && monthlyExpense > 0) {
    const percentage = (monthlyExpense / totalBudget) * 100;
    if (percentage >= 80) {
      insights.push({
        type: 'danger',
        title: 'Budget hampir habis!',
        message: 'Kamu sudah menggunakan ' + percentage.toFixed(0) + '% dari budget bulan ini',
      });
    } else if (percentage <= 50 && monthlyExpense > 0) {
      insights.push({
        type: 'success',
        title: 'Pengeluaran terkendali',
        message: 'Kamu baru menggunakan ' + percentage.toFixed(0) + '% dari budget bulan ini',
      });
    }
  }

  if (topCategory.rows.length > 0) {
    const cat = topCategory.rows[0];
    const pct = monthlyExpense > 0 ? ((parseFloat(cat.total) / monthlyExpense) * 100).toFixed(0) : 0;
    insights.push({
      type: 'info',
      title: 'Kategori terbesar',
      message: `${cat.name} adalah pengeluaran terbesar kamu (${pct}% dari total)`,
    });
  }

  if (lastMonthExpense > 0 && monthlyExpense < lastMonthExpense) {
    const savings = ((lastMonthExpense - monthlyExpense) / lastMonthExpense) * 100;
    insights.push({
      type: 'success',
      title: 'Hemat bulan ini!',
      message: `Pengeluaran kamu turun ${savings.toFixed(0)}% dibanding bulan lalu`,
    });
  }

  if (monthly.income > 0) {
    const savingsRate = ((parseFloat(monthly.income) - monthlyExpense) / parseFloat(monthly.income)) * 100;
    if (savingsRate > 0) {
      insights.push({
        type: 'info',
        title: 'Kebiasaan menabung',
        message: `Kamu menyisihkan ${savingsRate.toFixed(0)}% dari pemasukan bulan ini`,
      });
    }
  }

  return insights;
};

module.exports = { autoCategorize, getDateRange, generateInsights };
