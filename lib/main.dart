import 'package:flutter/material.dart';
import 'package:project1/fab.dart';
import 'package:project1/goalspage.dart';
import 'package:project1/profilepage.dart';
import 'package:project1/staticpage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isFabPressed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isFabPressed = false;
    });
  }

  void _onFabPressed() {
    setState(() {
      _isFabPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isFabPressed ? Fabbotton() : _getSelectedWidget(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Opacity(
        opacity: 1, // Adjust opacity as needed (0.0 to 1.0)
        child: FloatingActionButton(
          onPressed: _onFabPressed,
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Color.fromARGB(79, 182, 184, 236).withOpacity(1),
          shape: CircleBorder(),
          elevation: 0, // Removes shadow
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return _buildHomeContent(context);
      case 1:
        return Statisticpage();
      case 2:
        return GoalsScreen();
      case 3:
        return Profilepage();

      default:
        return _buildHomeContent(context);
    }
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserGreeting(),
          const SizedBox(height: 20),
          TotalBalanceCard(),
          SizedBox(height: 20),
          TopSpendingSection(),
          SizedBox(height: 20),
          RecentTransactionsSection(),
        ],
      ),
    );
  }
}

class UserGreeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFA8ewdwEhnD6NRpS665hs1zkxDmr6c3vgdn2t1qwGsVKTpKppZe1sTbXakbWYGXwzW9Q&usqp=CAU'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello Ashwin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Good morning',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(79, 182, 184, 236),
          ),
          child: IconButton(
            icon: Icon(Icons.notifications_outlined,
                color: Colors.black, size: 30),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class TotalBalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(79, 182, 184, 236),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          children: [
            Text('Total Balance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              '\$45000.00',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Monthly Expenses",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            LinearProgressIndicator(
              value: 0.45,
              minHeight: 8,
              backgroundColor: Color.fromARGB(79, 182, 184, 236),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              // borderRadius is not available directly in LinearProgressIndicator.
              // Wrap in a container to give border radius.
              // valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(34)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0), // adjust the value to your liking
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$30000.00", style: TextStyle()),
                  Text("\$45000.00", style: TextStyle()),
                ],
              ),
            ),
            SizedBox(height: 10), // Add some space after the progress bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(79, 182, 184, 236),
                                  shape: BoxShape.circle,
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 24, // Increase the size of the icon
                                    weight:
                                        2.0, // Increase the thickness of the icon
                                  ),
                                  child: Icon(Icons.arrow_downward,
                                      color: Colors.greenAccent),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5), // Reduce the space here
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Income',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              Text('\$75000.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width / 4,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(79, 182, 184, 236),
                                  shape: BoxShape.circle,
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                    size: 24, // Increase the size of the icon
                                    weight:
                                        2.0, // Increase the thickness of the icon
                                  ),
                                  child: Icon(Icons.arrow_upward,
                                      color: Colors.redAccent),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 5), // Reduce the space here
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Expense',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              Text('\$30000.00',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopSpendingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // Add padding to the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Spending\'s',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  // Add functionality to navigate to more spending details
                  print('Navigate to more spending details');
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SpendingCategory(icon: Icons.fastfood_outlined, label: 'Food'),
                SpendingCategory(
                    icon: Icons.local_gas_station_outlined, label: 'Fuel'),
                SpendingCategory(icon: Icons.flight, label: 'Travel'),
                SpendingCategory(
                    icon: Icons.shopping_cart_outlined, label: 'Shopping'),
                // Add more SpendingCategory widgets if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SpendingCategory extends StatelessWidget {
  final IconData icon;
  final String label;

  SpendingCategory({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      height: 120, // Fixed height for the spending category
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color.fromARGB(
            79, 182, 184, 236), // Set the background color for each category
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 5),
          Text(label),
        ],
      ),
    );
  }
}

class RecentTransactionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Transactions',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Column(
          children: [
            RecentTransactionItem(
                label: 'Grocery Shopping', icon: Icons.shopping_cart_outlined),
            RecentTransactionItem(
                label: 'Bills & Subscription', icon: Icons.public),
            RecentTransactionItem(
                label: 'Food & Drinks', icon: Icons.fastfood_outlined),
            RecentTransactionItem(
                label: 'Travel', icon: Icons.airplanemode_active),
            // Add more RecentTransactionItem widgets if needed
          ],
        ),
      ],
    );
  }
}

class RecentTransactionItem extends StatelessWidget {
  final String label;
  final IconData icon;

  RecentTransactionItem({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(79, 182, 184, 236),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color for the icon
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            padding: EdgeInsets.all(8),
            child:
                Icon(icon, size: 30), // Adjust the size of the icon as needed
          ),
          SizedBox(width: 10),
          Text(label),
        ],
      ),
    );
  }
}
