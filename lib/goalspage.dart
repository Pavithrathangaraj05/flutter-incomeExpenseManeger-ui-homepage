import 'package:flutter/material.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  String _selectedButton = 'Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        centerTitle: true,
        title: const Text(
          'Goals',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'All';
                      });
                    },
                    child: Text('All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'All'
                          ? Colors.lightBlue[100]
                          : null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Year';
                      });
                    },
                    child: Text('Year'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Year'
                          ? Colors.lightBlue[100]
                          : null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Week';
                      });
                    },
                    child: Text('Week'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Week'
                          ? Colors.lightBlue[100]
                          : null,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedButton = 'Month';
                      });
                    },
                    child: Text('Month'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedButton == 'Month'
                          ? Colors.lightBlue[100]
                          : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              goalCard(
                icon: Icons.phone_android,
                title: 'Saving for new Phone',
                description:
                    'I have to save 1500 dollars every month from my income to buy a new mobile',
                amount: '\$18,000',
                percentage: '40%',
              ),
              const SizedBox(height: 16.0),
              goalCard(
                icon: Icons.car_rental,
                title: 'Saving for new Car',
                description:
                    'I have to save 2000 dollars every month from my income to buy a new car',
                amount: '\$1,00,000',
                percentage: '60%',
              ),
              const SizedBox(height: 16.0),
              goalCard(
                icon: Icons.home,
                title: 'Saving for New House',
                description:
                    'I have to save 3500 dollars every month from my income to buy a new house',
                amount: '\$2,50,000',
                percentage: '30%',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget goalCard({
    required IconData icon,
    required String title,
    required String description,
    required String amount,
    required String percentage,
  }) {
    double getPercentageValue() {
      final percentageValue = double.tryParse(percentage.replaceAll('%', ''));
      if (percentageValue == null) {
        throw FormatException('Invalid percentage value: $percentage');
      }
      return percentageValue / 100;
    }

    return Card(
      elevation: 2.0,
      color: const Color.fromARGB(255, 219, 219, 226),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Icon(icon, size: 40),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              child: LinearProgressIndicator(
                value: getPercentageValue(),
                minHeight: 10,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(34)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('To save $amount'),
                  Text('$percentage completed'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
