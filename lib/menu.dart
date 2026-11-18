import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/project_form.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2506637155";
  final String name = "William Jesiel";
  final String kelas = "KKI";

  final List<ItemHomepage> items = [
    ItemHomepage("View Projects", Icons.folder, Color.fromRGBO(255, 55, 55, 1)),
    ItemHomepage(
      "View Experiences",
      Icons.folder,
      Color.fromRGBO(63, 237, 36, 1),
    ),
    ItemHomepage(
      "View Achievements",
      Icons.folder,
      Color.fromRGBO(31, 65, 255, 1),
    ),
    ItemHomepage(
      "Add Project",
      Icons.add_circle,
      Color.fromRGBO(255, 89, 23, 1),
    ),
    ItemHomepage(
      "Add Achievements",
      Icons.add_circle,
      Color.fromRGBO(14, 225, 24, 1),
    ),
    ItemHomepage(
      "Add Experience",
      Icons.add_circle,
      Color.fromRGBO(86, 74, 250, 1),
    ),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyPortfolio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
          foregroundDecoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.redAccent,
              const Color.fromARGB(255, 255, 221, 0),
              const Color.fromARGB(255, 0, 179, 255),
              const Color.fromARGB(255, 187, 0, 255),
            ],
            transform: GradientRotation(1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Horizontal row showing 3 InfoCards.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: kelas),
              ],
            ),

            const SizedBox(height: 16.0),

            // Greeting and 3-column action grid.
            Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to MyPortfolio Mobile!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    childAspectRatio: 4,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  // Information card displaying a title and its associated content.
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 2.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")),
            );

          // Navigate to the appropriate screen
          if (item.name == "Add Project") {
            // TODO: Use Navigator.push() with a MaterialPageRoute for ProjectFormPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
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

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, [this.color = Colors.grey]);
}
