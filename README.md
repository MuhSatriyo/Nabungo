# Nabungo - AI Financial Companion

> A modern fintech mobile application to help you manage money in a fun and engaging way.

## Demo Account
- **Email:** `demo@nabungo.app`
- **Password:** `demo123`

## Tech Stack

### Frontend (Flutter)
- **State Management:** Riverpod
- **Local Storage:** Hive
- **Routing:** Go Router
- **Charts:** FL Chart
- **Animations:** Flutter Animate, Shimmer
- **Fonts:** Google Fonts (Inter, Poppins)

### Backend (Node.js)
- **Framework:** Express.js
- **Database:** PostgreSQL
- **Authentication:** JWT (Access + Refresh Tokens)
- **Validation:** Express Validator
- **Security:** Helmet, CORS, bcryptjs

## Features

### Core
- ✅ JWT Authentication (Register/Login/Logout)
- ✅ Super-fast transaction input (<5 seconds)
- ✅ Auto categorization with smart keyword detection
- ✅ AI Financial Insights (automatic spending analysis)
- ✅ Budget management with alerts
- ✅ Gamification (XP, Levels, Badges)
- ✅ Challenge system
- ✅ Interactive charts and statistics
- ✅ Dark/Light mode
- ✅ Responsive UI (mobile-first)
- ✅ Offline-first with Hive

### Gamification
- **XP System:** Earn XP for every transaction
- **Levels:** Level up as you earn XP
- **Badges:** First Transaction, 7-Day Streak, 30-Day Streak, Budget Master, Smart Saver, Challenger, Level 5, Level 10
- **Challenges:** No Jajan 3 Days, Catat Harian, Hemat Transport, Budget Warrior, Makan di Rumah, Zero Waste Week, Save Rp 100K, Financial Detective

### Auto Categorization
Nabungo automatically categorizes transactions based on keywords in notes:
- "kopi", "coffee" → Jajan
- "gojek", "grab" → Transport
- "indomaret", "alfamart" → Belanja
- And more...

### Financial Insights
Automatic insights generated from transaction data:
- Spending trend analysis (weekly/monthly comparison)
- Budget usage alerts (80%, 90% thresholds)
- Top spending categories
- Savings rate tracking

## Project Structure

```
nabungo/
├── backend/
│   ├── src/
│   │   ├── config/         # Database & app configuration
│   │   ├── controllers/    # Route handlers
│   │   ├── middleware/      # Auth, validation
│   │   ├── repositories/   # Data access layer
│   │   ├── routes/         # API route definitions
│   │   ├── services/       # Business logic layer
│   │   └── utils/          # Helpers (JWT, auto-categorize)
│   ├── migrations/         # SQL migrations
│   ├── seeders/            # Initial data seeders
│   ├── .env.example
│   └── package.json
│
├── frontend/
│   ├── lib/
│   │   ├── core/
│   │   │   ├── constants/  # Colors, app constants
│   │   │   ├── theme/      # Dark/Light theme
│   │   │   ├── router/     # Go Router config
│   │   │   ├── network/    # API client (Dio)
│   │   │   └── utils/      # Extensions
│   │   ├── data/
│   │   │   ├── datasources/ # Remote & local data sources
│   │   │   └── models/     # Data models
│   │   ├── domain/         # Domain entities
│   │   └── presentation/
│   │       ├── providers/  # Riverpod state management
│   │       ├── screens/    # All screens
│   │       └── widgets/    # Reusable widgets
│   └── pubspec.yaml
│
├── docs/
└── README.md
```

## API Endpoints

### Auth
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/auth/register` | Register new user |
| POST | `/api/auth/login` | Login |
| POST | `/api/auth/refresh` | Refresh token |
| GET | `/api/auth/profile` | Get profile |
| PUT | `/api/auth/profile` | Update profile |
| DELETE | `/api/auth/account` | Delete account |

### Transactions
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/transactions` | Create transaction |
| GET | `/api/transactions` | List transactions |
| GET | `/api/transactions/analytics` | Get analytics |
| GET | `/api/transactions/:id` | Get transaction |
| PUT | `/api/transactions/:id` | Update transaction |
| DELETE | `/api/transactions/:id` | Delete transaction |

### Budgets
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/budgets` | Create budget |
| GET | `/api/budgets` | Get budgets by month |
| GET | `/api/budgets/alerts` | Get budget alerts |
| PUT | `/api/budgets/:id` | Update budget |
| DELETE | `/api/budgets/:id` | Delete budget |

### Challenges
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/challenges` | List challenges |
| GET | `/api/challenges/active` | Active challenges |
| GET | `/api/challenges/gamification` | Gamification status |
| POST | `/api/challenges/:id/join` | Join challenge |

### Insights
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/insights` | Get AI insights |

## Getting Started

### Prerequisites
- Node.js >= 18
- Flutter >= 3.16
- PostgreSQL >= 14

### Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create environment file
cp .env.example .env
# Edit .env with your PostgreSQL credentials

# Create database
createdb nabungo

# Run migrations
npm run migrate

# Seed data (includes demo account)
npm run seed

# Start server
npm run dev
```

### Frontend Setup

```bash
cd frontend

# Install dependencies
flutter pub get

# Run build_runner for code generation
flutter pub run build_runner build

# Run app
flutter run
```

## Screens

1. **Splash Screen** - Animated app intro
2. **Onboarding** - 3-page feature introduction
3. **Login/Register** - JWT authentication
4. **Dashboard** - Financial overview with charts
5. **Add Transaction** - Quick input (<5 seconds)
6. **Statistics** - Pie charts & bar charts
7. **Challenges** - Gamification & badges
8. **Wallet** - Transaction history
9. **Settings** - Dark mode, profile, export

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Navy | `#1B2A4A` | Primary |
| Emerald | `#2ED573` | Accent/Success |
| White | `#FFFFFF` | Surface |

## Database Schema

- `users` - User accounts with XP/level
- `categories` - Transaction categories
- `transactions` - Financial transactions
- `budgets` - Monthly budgets per category
- `challenges` - Available challenges
- `user_challenges` - User challenge progress
- `badges` - Available badges
- `user_badges` - Earned badges
- `streaks` - Daily logging streaks
- `refresh_tokens` - JWT refresh tokens

## License

MIT
