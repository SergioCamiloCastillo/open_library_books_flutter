import 'package:bookstore_flutter/presentation/delegates/search_book_delegate.dart';
import 'package:bookstore_flutter/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'La librería de Checho',
              style: TextStyle(
                fontFamily: 'MonaSans',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                final bookRepository = ref.read(bookRepositoryProvider);
                print('hizo clcik aquii');
                showSearch(
                    context: context,
                    delegate: SearchBookDelegate(
                        searchBooks: (query) =>
                            bookRepository.searchBooks(query))).then((value) {
                  print('miedaaaa');
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFAFAFA), // Color de fondo
                  borderRadius: BorderRadius.circular(10), // Bordes redondeados
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        color: Color(0xFFACACAC),
                        size: 30, // Ajusta el tamaño del ícono
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Buscar...',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(
                              0xFFAFAFAF), // Color del texto de sugerencia
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
