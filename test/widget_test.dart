// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_peliculas/main.dart';

void main() {
  testWidgets('Movies app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AppState());

    // Verify that our app shows loading initially (since movies are fetched async)
    // or shows the movie app UI
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // You can add more specific tests here based on the app's functionality
    // For example, testing if the CircularProgressIndicator shows up initially
    // expect(find.byType(CircularProgressIndicator), findsWidgets);
  });
}
