// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yeetpost/profile.dart';

void main() {
  testWidgets('Upvote and flag values should be incremented when upvote is tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      Profile()
    );

    // Enter 'Test name' into the TextField.
    await tester.enterText(find.byType(TextField), 'Test name');

    // Tap the chage name button
    await tester.tap(find.byType(RaisedButton));

    // Rebuild the widget with updated data
    await tester.pump();

    expect(find.text('Test name'), findsOneWidget);
  });
}
