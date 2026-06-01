enum SearchFilter {
  all('Alle'),
  author('Autor'),
  title('Titel');

  const SearchFilter(this.label);

  final String label;
}
