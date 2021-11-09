extension IterableExtension<T> on Iterable<T> {
  T? find(bool Function(T element) convertor) {
    for (T element in this) {
      if (convertor(element)) return element;
    }
    return null;
  }

  Iterable<T> sortedBy(Comparable Function(T e) key) {
    return toList()..sort((a, b) => key(a).compareTo(key(b)));
  }
}
