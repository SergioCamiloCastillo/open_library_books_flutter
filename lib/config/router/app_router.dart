import 'package:bookstore_flutter/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) {
              return const HomeView();
            },
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
        GoRoute(
          path: '/user',
          builder: (context, state) {
            return const UserScreen();
          },
        )
      ]),
  /*GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(
            childView: HomeView(),
          ),
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
      */
]);
