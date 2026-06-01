import 'package:flutter/material.dart';

enum SearchResultLayout {
  list("Liste", Icons.view_list),
  grid("Grid", Icons.grid_view);

  const SearchResultLayout(this.label, this.icon);

  final String label;
  final IconData icon;
}
