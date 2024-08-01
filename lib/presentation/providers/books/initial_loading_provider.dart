import 'package:bookstore_flutter/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final misteryBooks = ref.watch(misteryBooksProvider).isEmpty;
  final romanceBooks = ref.watch(romanceBooksProvider).isEmpty;
  final scienceBooks = ref.watch(scienceBooksProvider).isEmpty;
  if (misteryBooks || romanceBooks || scienceBooks) {
    return true;
  }
  return false;
});
