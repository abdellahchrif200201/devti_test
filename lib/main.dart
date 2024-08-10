import 'package:devti_test/mainPageNavigation/navigationButtom.dart';
import 'package:devti_test/theme/ProviderSubscription.dart';
import 'package:devti_test/theme/ProviderTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.loadDarkMode();

  final subProvider = ProviderSubscription();
  await subProvider.loadSavedsub();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => themeProvider),
        ChangeNotifierProvider<ProviderSubscription>(
            create: (_) => subProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const MainPages(),
    );
  }
}
