import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yummy/models/models.dart';
import 'package:yummy/screens/screens.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  runApp(const Yummy());
}

/// Allows the ability to scroll by dragging with touch, mouse, and trackpad.
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}

class Yummy extends StatefulWidget {

  const Yummy({super.key});

  @override
  State<Yummy> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {
  final String appTitle = 'Yummy';
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelected = ColorSelection.pink;
  /// Authentication to manage user login session
  // ignore: unused_field
  final YummyAuth _auth = YummyAuth();
  /// Manage user's shopping cart for the items they order.
  final CartManager _cartManager = CartManager();
  /// Manage user's orders submitted
  final OrderManager _orderManager = OrderManager();
  late final _router = GoRouter(
    initialLocation: '/login',
    redirect: _appRedirect,
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(
          onLogIn: (Credentials credentials) async {
            await _auth.signIn(credentials.username, credentials.password);
            if (await _auth.loggedIn && context.mounted) {
              context.go('/${YummyTab.home.value}');
            }
          }
        ),
      ),
      GoRoute(
        path: '/invalid-tab',
        builder: (context, state) {
          return _buildPageNotFound(context);
        },
      ),
      GoRoute(
        path: '/:tab',
        builder: (context, state) {
          final tabValue = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          final isValidTab = YummyTab.values.any((tab) => tab.value == tabValue);
          
          if (!isValidTab) {
            context.replace('/invalid-tab');
            return const SizedBox();
          }
          
          return Home(
            changeTheme: changeThemeMode,
            changeColor: changeColor,
            colorSelected: colorSelected,
            appTitle: appTitle,
            cartManager: _cartManager,
            orderManager: _orderManager,
            auth: _auth,
            tab: int.tryParse(state.pathParameters['tab'] ?? '') ?? 0,
          );
        },
        routes: [
          GoRoute(
            path: 'restaurant/:id',
            builder: (context, state) {
              final id = int.tryParse(state.pathParameters['id'] ?? '') ?? 0;
              final restaurant = restaurants[id];
              return RestaurantPage(
                restaurant: restaurant,
                cartManager: _cartManager,
                ordersManager: _orderManager,
              );
            },
          )
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Page Not Found'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops! Page Not Found',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'The page you are looking for doesn\'t exist or has been moved.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
  
  Future<String?> _appRedirect(BuildContext context, GoRouterState state) async {
    final loggedIn = await _auth.loggedIn;
    final isOnLoginPage = state.matchedLocation == '/login';
    if (!loggedIn) {
      return '/login';
    }
    else if (loggedIn && isOnLoginPage) {
      return '/${YummyTab.home.value}';
    }
    return null;
  }

  Widget _buildPageNotFound(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Oops! Invalid Tab',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'The page you are trying to access doesn\'t exist.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go('/${YummyTab.home.value}'),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    );
  }
  
  void changeThemeMode(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void changeColor(int value) {
    setState(() {
      colorSelected = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      // TODO: add custom scroll behavior
      scrollBehavior: CustomScrollBehavior(),
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: colorSelected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: _router,
    );
  }
}