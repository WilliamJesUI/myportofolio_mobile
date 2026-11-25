import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp(apiClient: ApiClient()));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.apiClient, super.key});

  final ApiClient apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: apiClient),
        ChangeNotifierProvider(create: (_) => AuthState(apiClient)),
      ],
      child: MaterialApp(
        title: 'My Portofolio',
        theme: ThemeData(
          colorScheme: .fromSeed(
            seedColor: const Color.fromARGB(255, 141, 237, 188),
            secondary: const Color.fromARGB(255, 122, 81, 81),
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
