import 'package:bookstore_flutter/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
            path: 'book/:id/:coverId',
            name: BookScreen.name,
            builder: (context, state) {
              final bookId = state.pathParameters['id'] ?? 'without-id';
              final coverId =
                  state.pathParameters['coverId'] ?? 'without-cover-id';
              return BookScreen(bookId: bookId, coverId: coverId);
            })
      ]),
]);
