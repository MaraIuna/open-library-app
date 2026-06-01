# Open Library App

Eine Flutter-App, die das Open Library API nutzt, um Bücher zu suchen und Detailinformationen anzuzeigen.

## Funktionen

- Suche nach Büchern über die Open Library API
- Filter nach Titel, Autor oder allgemeiner Suche
- Anzeige von Suchergebnissen in einer ansprechenden Liste
- Detailansicht mit Buchcover, Beschreibung und zusätzlichen Metadaten
- Modernes UI-Layout und einfache Bedienung

## Architektur

- Flutter-App in Dart
- HTTP-Abfragen mit `http`
- Klare Trennung zwischen UI, Domain und Daten

## Voraussetzungen

- Flutter SDK installiert
- Dart SDK kompatibel mit Flutter 3.12+
- Internetzugang zum Abrufen von Open Library Daten

## Installation

1. In das Projektverzeichnis wechseln:

```bash
cd open_library_app
```

2. Abhängigkeiten installieren:

```bash
flutter pub get
```

## App starten

```bash
flutter run
```

Für eine bestimmte Plattform:

```bash
flutter run -d chrome
```

## Tests

```bash
flutter test
```

## Projektstruktur

- `lib/main.dart`: Einstiegspunkt der App
- `lib/features/books/`: Buchsuche und Detailansicht
- `lib/core/`: gemeinsame Widgets und Hilfsklassen
- `lib/shared/`: wiederverwendbare UI-Komponenten

## Hinweise

- Die App lädt Coverbilder und Buchdaten direkt von Open Library.
- Bei fehlenden Informationen zeigt sie eine passende Meldung an.

## Bekannte Fehler und Schwachstellen

- Netzwerk-/API-Fehler werden nicht vollständig abgefangen
- Keine Eingabevalidierung
- Query-Strings werden nicht URL-kodiert
- Keine Offline-Unterstützung / kein Caching
- Keine Pagination oder Nachladung
- Keine Retry-Logik bei Verbindungsabbruch
- Begrenzte Fehlerbeschreibung
- Keine Lokalisierung
- Kein separates Theme dadurch nur eingeschränkt Barrierefrei
- Keine formale State-Management-Lösung
