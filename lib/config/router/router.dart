import 'package:go_router/go_router.dart';
import 'package:laundromat_flutter/screen/cart_screen.dart';
import 'package:laundromat_flutter/screen/favorite_pokemon_screen.dart';
import 'package:laundromat_flutter/screen/favorite_screen.dart';
import 'package:laundromat_flutter/screen/home_screen.dart';
import 'package:laundromat_flutter/screen/login_screen.dart';
import 'package:laundromat_flutter/screen/pokemon_detail_screen.dart';
import 'package:laundromat_flutter/service/auth/auth_service.dart';

class AppRouter {
  final AuthService authService;

  AppRouter(this.authService);

  static const homeScreen = '/';
  static const loginScreen = '/login';
  static const cartScreen = '/cart';
  static const favoriteScreen = '/favorite';
  static const pokemondetailScreen = '/pokemondetail';
  static const favoritePokemonScreen = '/favoritepokemon';

  late final router = GoRouter(
    refreshListenable: authService.authState,
    redirect: (context, state) {
      final isLoggedIn = authService.isLoggedIn;
      final isLoginRoute = state.matchedLocation == '/login';

      print(
          'Router check - isLoggedIn: $isLoggedIn, currentRoute: ${state.matchedLocation}');

      if (!isLoggedIn && !isLoginRoute) {
        print('Redirecting to login');
        return '/login';
      }

      if (isLoggedIn && isLoginRoute) {
        print('Redirecting to home');
        return '/';
      }

      print('No redirect needed');
      return null;
    },
    routes: [
      GoRoute(
        path: homeScreen,
        name: homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: loginScreen,
        name: loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: cartScreen,
        name: cartScreen,
        builder: (context, state) => CartScreen(),
      ),
      GoRoute(
        path: favoriteScreen,
        name: favoriteScreen,
        builder: (context, state) => FavoriteScreen(),
      ),
      GoRoute(
        path: pokemondetailScreen,
        name: pokemondetailScreen,
        builder: (context, state) {  final args = state.extra as Map<String, dynamic>?;
          final String pokemonId = args?['pokemonId'] as String? ?? '';
          return PokemonDetailScreen(pokemonId:pokemonId);
        },
      ),
      GoRoute(
        path: favoritePokemonScreen,
        name: favoritePokemonScreen,
        builder: (context, state) => FavoritePokemonScreen(),
      ),
    ],
  );
}
