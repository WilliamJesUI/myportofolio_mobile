import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/achievement_form.dart';
import 'package:myportofolio_mobile/screens/achievement_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/services/auth_guard.dart'; // wherever ensureLoggedIn lives
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          // Grab these before any await so we never use a stale context.
          final navigator = Navigator.of(context);
          final messenger = ScaffoldMessenger.of(context);

          if (item.name == "Logout") {
            try {
              await context.read<AuthState>().logout();
            } catch (_) {
              // Local logout already happened in AuthState's finally block.
            }
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text('Logged out.')));
            return;
          }

          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")),
            );

          if (item.name == "View Achievements") {
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const AchievementListScreen(),
              ),
            );
          }

          if (item.name == "Add Project") {
            navigator.push(
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
          }

          if (item.name == "Add Experience") {
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
          }

          if (item.name == "Add Achievement") {
            final ok = await ensureLoggedIn(context);
            if (!ok || !context.mounted) return;
            navigator.push(
              MaterialPageRoute(
                builder: (context) => const AchievementFormPage(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(40), spreadRadius: -10),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
