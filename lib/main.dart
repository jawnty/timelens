import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'services/history_service.dart';
import 'services/theme_service.dart';
import 'services/allowlist_service.dart';
import 'services/credits_service.dart';
import 'services/purchase_service.dart';
import 'theme/app_theme.dart';
import 'screens/sign_in_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Initialize services
  final historyService = HistoryService();
  await historyService.init();

  final themeService = ThemeService();
  await themeService.init();

  final allowlistService = AllowlistService();
  await allowlistService.loadAllowlist();

  final creditsService = CreditsService(allowlistService);
  await creditsService.init();

  final purchaseService = PurchaseService(creditsService);
  await purchaseService.init();

  runApp(TimeLensApp(
    historyService: historyService,
    themeService: themeService,
    creditsService: creditsService,
    purchaseService: purchaseService,
  ));
}

class TimeLensApp extends StatelessWidget {
  final HistoryService historyService;
  final ThemeService themeService;
  final CreditsService creditsService;
  final PurchaseService purchaseService;

  const TimeLensApp({
    super.key,
    required this.historyService,
    required this.themeService,
    required this.creditsService,
    required this.purchaseService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        Provider<HistoryService>.value(value: historyService),
        ChangeNotifierProvider<ThemeService>.value(value: themeService),
        ChangeNotifierProvider<CreditsService>.value(value: creditsService),
        ChangeNotifierProvider<PurchaseService>.value(value: purchaseService),
      ],
      child: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return MaterialApp(
            title: 'TimeLens',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeService.themeMode,
            home: const AuthWrapper(),
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Provider.of<AuthService>(context, listen: false).authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        return const SignInScreen();
      },
    );
  }
}
