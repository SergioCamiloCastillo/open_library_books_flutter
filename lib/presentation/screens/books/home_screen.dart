import 'package:bookstore_flutter/presentation/providers/providers.dart';
import 'package:bookstore_flutter/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(biographyBooksProvider.notifier).loadNextItemsToRender();
      ref.read(fantasyBooksProvider.notifier).loadNextItemsToRender();
      ref.read(fictionBooksProvider.notifier).loadNextItemsToRender();
      ref.read(misteryBooksProvider.notifier).loadNextItemsToRender();
      ref.read(nonFictionBooksProvider.notifier).loadNextItemsToRender();
      ref.read(romanceBooksProvider.notifier).loadNextItemsToRender();
      ref.read(scienceBooksProvider.notifier).loadNextItemsToRender();
      ref.read(ventureBooksProvider.notifier).loadNextItemsToRender();
    });
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final screenHeight = MediaQuery.of(context).size.height;
    final appbarHeight =
        screenHeight * 0.19; // Ajusta el porcentaje según sea necesario

    final getBiographyBooks = ref.watch(biographyBooksProvider);
    final getFantasyBooks = ref.watch(fantasyBooksProvider);
    final getFictionBooks = ref.watch(fictionBooksProvider);
    final getMisteryBooks = ref.watch(misteryBooksProvider);
    final getNonFictionBooks = ref.watch(nonFictionBooksProvider);
    final getRomanceBooks = ref.watch(romanceBooksProvider);
    final getScienceBooks = ref.watch(scienceBooksProvider);
    final getVentureBooks = ref.watch(ventureBooksProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: appbarHeight, // Altura dinámica
          flexibleSpace: const FlexibleSpaceBar(
            background: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  BooksHorizontalListView(
                    books: getScienceBooks,
                    titleCategory: 'Ciencia',
                    loadNextPage: () {
                      ref
                          .read(scienceBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getRomanceBooks,
                    titleCategory: 'Romance',
                    loadNextPage: () {
                      ref
                          .read(romanceBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getMisteryBooks,
                    titleCategory: 'Misterio',
                    loadNextPage: () {
                      ref
                          .read(misteryBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getFictionBooks,
                    titleCategory: 'Ciencia Ficción',
                    loadNextPage: () {
                      ref
                          .read(fictionBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),

                  BooksHorizontalListView(
                    books: getFantasyBooks,
                    titleCategory: 'Fantasía',
                    loadNextPage: () {
                      ref
                          .read(fantasyBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getBiographyBooks,
                    titleCategory: 'Biografía',
                    loadNextPage: () {
                      ref
                          .read(biographyBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getVentureBooks,
                    titleCategory: 'Aventura',
                    loadNextPage: () {
                      ref
                          .read(ventureBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  BooksHorizontalListView(
                    books: getNonFictionBooks,
                    titleCategory: 'No ficción',
                    loadNextPage: () {
                      ref
                          .read(nonFictionBooksProvider.notifier)
                          .loadNextItemsToRender();
                    },
                  ),
                  // Agrega las demás listas de libros aquí...
                ],
              );
            },
            childCount: 1, // Número de elementos que deseas construir
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          if (title != null)
            Text(
              title ?? '',
              style: titleStyle,
            ),
        ],
      ),
    );
  }
}
