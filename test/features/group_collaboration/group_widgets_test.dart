import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/chat_message_view.dart';
import 'package:keenpockets/features/group_collaboration/presentation/view_models/dispute_view.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/disputes_section.dart';
import 'package:keenpockets/features/group_collaboration/presentation/widgets/group_chat_panel.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('GroupChatPanel', () {
    testWidgets('renders bubbles and sends typed text', (tester) async {
      String? sent;
      await tester.pumpApp(
        Scaffold(
          body: GroupChatPanel(
            messages: const [
              ChatMessageView(
                id: '1',
                author: 'Sarah',
                text: 'Hello',
                isMine: false,
              ),
            ],
            onSend: (t) => sent = t,
          ),
        ),
      );

      expect(find.text('Hello'), findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Hi there');
      await tester.tap(find.byIcon(Icons.send_rounded));
      await tester.pump();
      expect(sent, 'Hi there');
    });

    testWidgets('shows the empty state when there are no messages', (
      tester,
    ) async {
      await tester.pumpApp(
        Scaffold(
          body: GroupChatPanel(messages: const [], onSend: (_) {}),
        ),
      );
      expect(find.text('No messages yet — say hello 👋'), findsOneWidget);
    });
  });

  testWidgets('DisputesSection renders cases with status pills', (
    tester,
  ) async {
    await tester.pumpApp(
      const Scaffold(
        body: SingleChildScrollView(
          child: DisputesSection(
            disputes: [
              DisputeView(
                id: '1',
                title: 'Late Payout',
                author: 'Musa',
                timeAgo: '2d ago',
                description: 'Not processed yet.',
                status: DisputeStatus.open,
              ),
              DisputeView(
                id: '2',
                title: 'Duplicate Entry',
                author: 'Sarah',
                timeAgo: '5d ago',
                description: 'Charged twice.',
                status: DisputeStatus.resolved,
                resolutionNote: 'Refunded.',
              ),
            ],
          ),
        ),
      ),
    );

    expect(find.text('Late Payout'), findsOneWidget);
    expect(find.text('Open'), findsOneWidget);
    expect(find.text('Resolved'), findsOneWidget);
    expect(find.text('Refunded.'), findsOneWidget);
  });
}
