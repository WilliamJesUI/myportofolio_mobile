import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/achievement.dart';

class AchievementDetailScreen extends StatelessWidget {
  const AchievementDetailScreen({super.key, required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(achievement.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (achievement.thumbnail != null &&
              achievement.thumbnail!.isNotEmpty)
            Image.network(
              achievement.thumbnail!,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          const SizedBox(height: 16),
          Text(
            achievement.name,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(achievement.description),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.local_fire_department, color: Colors.orange),
              const SizedBox(width: 4),
              Text('${achievement.flamedBy.length} flames'),
            ],
          ),
        ],
      ),
    );
  }
}
