import 'package:flutter/material.dart';
import 'package:open_library_app/core/constants/ui_constants.dart';
import 'package:open_library_app/features/books/data/repositories/book_repository_remote.dart';
import 'package:open_library_app/features/books/ui/viewmodels/book_details_viewmodel.dart';
import 'package:open_library_app/features/books/ui/viewmodels/search_result_viewmodel.dart';
import 'package:open_library_app/shared/widgets/loading_indicator.dart';

class BookDetails extends StatefulWidget {
  final SearchResultViewModel book;
  final VoidCallback onBack;
  final BookRepositoryRemote repository;

  const BookDetails({
    super.key,
    required this.book,
    required this.onBack,
    required this.repository,
  });

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late final BookRepositoryRemote _repo;

  BookDetailsViewModel? details;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _repo = widget.repository;
    _loadBookDetails();
  }

  Future<void> _loadBookDetails() async {
    final result = await _repo.bookByOLId(widget.book.olid);

    if (!mounted) return;

    setState(() {
      details = BookDetailsViewModel.fromBookDto(result);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Daten werden geladen.'),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: UiConstants.spacingSmall,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: widget.onBack,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Zurück zur Liste'),
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              details!.coverLargeUrl,
              width: 200,
              height: 300,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 300,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.menu_book, size: 48),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.book.title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            widget.book.author,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Beschreibung',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  details?.description ?? 'Keine Beschreibung verfügbar.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(height: 1.6),
                ),
                const SizedBox(height: 24),

                Text(
                  'Details',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  'Versionen',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text('${details?.revisionCount ?? 'Unbekannt'}'),

                if ((details?.subjects ?? []).isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Themen', style: Theme.of(context).textTheme.labelLarge),
                  Text(details!.subjects.join(', ')),
                ],

                if ((details?.subjectPeople ?? []).isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Personen',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(details!.subjectPeople.join(', ')),
                ],

                if ((details?.subjectPlaces ?? []).isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Orte', style: Theme.of(context).textTheme.labelLarge),
                  Text(details!.subjectPlaces.join(', ')),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
