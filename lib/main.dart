import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Vote',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LiveVotePage(),
    );
  }
}

class LiveVotePage extends StatelessWidget {
  const LiveVotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Vote'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image and Title
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/banner.jpg', // Replace with actual asset image path
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Live Vote Results',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Winner Contestant
            InkWell(
              onTap: () {
                // Handle click event
                print('Winner card tapped!');
              },
              child: Card(
                color: Colors.red.shade100,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/1.jpg'), // Replace with actual asset image path
                  ),
                  title: const Text('Omar D. Regalado'),
                  subtitle: const Text('Lorem ipsum loremipsum'),
                  trailing: const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Voting Statistics
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Handle click event
                      print('Total Votes card tapped!');
                    },
                    child: Card(
                      color: Colors.blue.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Text(
                              'Total Votes',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '560',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Handle click event
                      print('Percentage card tapped!');
                    },
                    child: Card(
                      color: Colors.blue.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: const [
                            Text(
                              'Total Votes',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '50%',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Other Contestants
            const Text(
              'Others Contestant',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildContestantCard(
              name: 'Chester Cheng',
              votes: '196 Votes',
              percentage: '35%',
              color: Colors.blue.shade100,
              imageUrl: 'assets/images/2.jpg', // Replace with actual asset image path
              onTap: () {
                // Handle click event
                print('Chester Cheng card tapped!');
              },
            ),
            _buildContestantCard(
              name: 'Robert Soliman',
              votes: '56 Votes',
              percentage: '10%',
              color: Colors.green.shade100,
              imageUrl: 'assets/images/3.jpg', // Replace with actual asset image path
              onTap: () {
                // Handle click event
                print('Robert Soliman card tapped!');
              },
            ),
            _buildContestantCard(
              name: 'Kristine Lim',
              votes: '28 Votes',
              percentage: '5%',
              color: Colors.green.shade200,
              imageUrl: 'assets/images/4.jpg', // Replace with actual asset image path
              onTap: () {
                // Handle click event
                print('Kristine Lim card tapped!');
              },
            ),
            const SizedBox(height: 16),
            
            // Contest Videos
            const Text(
              'Contest Videos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'http://www.youtube.com/watch?v=abcdEfgH',
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(height: 16),
            
            // Upcoming Events
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildEventCard(
              eventName: 'Music Festivals',
              date: '30/09/2024',
              color: Colors.purple.shade100,
              onTap: () {
                // Handle click event
                print('Music Festivals card tapped!');
              },
            ),
            _buildEventCard(
              eventName: 'Sports Events',
              date: '30/09/2024',
              color: Colors.red.shade100,
              onTap: () {
                // Handle click event
                print('Sports Events card tapped!');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContestantCard({
    required String name,
    required String votes,
    required String percentage,
    required Color color,
    required String imageUrl,
    required VoidCallback onTap, // Add this parameter
  }) {
    return InkWell(
      onTap: onTap, // Handle tap event
      child: Card(
        color: color,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageUrl), // Use AssetImage instead of NetworkImage
          ),
          title: Text(name),
          subtitle: Text(votes),
          trailing: Text(
            percentage,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard({
    required String eventName,
    required String date,
    required Color color,
    required VoidCallback onTap, // Add this parameter
  }) {
    return InkWell(
      onTap: onTap, // Handle tap event
      child: Card(
        color: color,
        child: ListTile(
          title: Text(eventName),
          subtitle: Text(date),
          trailing: const Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
