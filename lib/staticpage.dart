import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts ;




class Statisticpage extends StatelessWidget {
  const Statisticpage({Key? key}) : super(key: key);

  static final greenColor = Color.fromARGB(79, 182, 184, 236);
  static final blueColor = Color.fromARGB(79, 138, 175, 180);

  static final List<Financial> expensesData = [
    Financial('Sun', 300, blueColor),
    Financial('Mon', 200, blueColor),
    Financial('Tue', 750, greenColor),
    Financial('Wed', 160,blueColor),
    Financial('Thu', 450, greenColor),
    Financial('Fri', 200, blueColor),
    Financial('Sat', 550, greenColor),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Financial, String>> expensesAndRevenueSeries = [
      charts.Series<Financial, String>(
        id: "Expenses",
        data: expensesData,
        domainFn: (Financial pops, _) => pops.year,
        measureFn: (Financial pops, _) => pops.value,
        colorFn: (Financial pops, __) =>
            charts.ColorUtil.fromDartColor(pops.barColor),
        labelAccessorFn: (Financial pops, _) => '\$${pops.value.toString()}',
      )
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(79, 182, 184, 236),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    Text(
                      'Statistics',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(79, 182, 184, 236),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.tune),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height:5),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color.fromARGB(79, 186, 191, 244),
                  border: Border.all(
                    color: Color.fromARGB(79, 57, 57, 61),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 223, 222, 222).withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total Expense',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$15000/20000 per month',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: 0.75,
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                  ],
                ),
              ),
              Container(
                               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(79, 182, 184, 236),
                    
                      ),
                      onPressed: () {},
                      child: Text(
                        'Today',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(79, 182, 184, 236),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Year',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(79, 182, 184, 236),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Week',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(79, 175, 239, 249),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Month',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal:15),
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              spreadRadius: 0.2,
                              blurRadius: 2,
                              offset: Offset(5,5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: charts.BarChart(
                            expensesAndRevenueSeries,
                            animate: true,
                            defaultRenderer: charts.BarRendererConfig(
                              cornerStrategy: const charts.ConstCornerStrategy(40),
                             
                              barRendererDecorator: charts.BarLabelDecorator<String>(
                                insideLabelStyleSpec: charts.TextStyleSpec(
                                  fontSize: 12,
                                  color: charts.Color.black,
                                ),
                                outsideLabelStyleSpec: const charts.TextStyleSpec(
                                  fontSize: 12,
                                  color: charts.Color.black,
                                  
                                ),
                                labelPosition: charts.BarLabelPosition.outside,
                              ),
                            ),
                            primaryMeasureAxis: const charts.NumericAxisSpec(
                              showAxisLine: false,
                              renderSpec: charts.NoneRenderSpec(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 400),
                      ),
                    
                      Text(
                        "Spending details",
                        //  style: GoogleFonts.lato(textStyle:TextStyle(fontWeight: FontWeight.w700,fontSize: 25)),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 450,
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(79, 182, 184, 236),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            width: 50,
                            height: 50,
                            child: Icon(Icons.restaurant, size: 32.0),
                            
                          ),
                          title: Text('Restaurant',
                              // style: GoogleFonts.lato(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                              ),
                          subtitle: Text('Three Transactions'),
                          trailing: Text('\$150', style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      SizedBox(height: 1.0),
                      Container(
                        margin: EdgeInsets.only(right: 20,left: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(79, 182, 184, 236),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.shopping_cart, size: 32.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Shopping',
                              //  style: GoogleFonts.lato(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                               ),
                          subtitle: Text('Four Transactions'),
                          trailing: Text('\$550', style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        margin: EdgeInsets.only(right: 20,left: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(79, 182, 184, 236),
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.savings, size: 32.0),
                           decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Investements',
                              //  style: GoogleFonts.lato(textStyle:TextStyle(fontWeight: FontWeight.bold,fontSize: 20))
                               ),
                          subtitle: Text('Two Transactions'),
                          trailing: Text('\$350', style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Financial {
  final String year;
  final int value;
  final Color barColor;

  Financial(this.year, this.value, this.barColor);
}
