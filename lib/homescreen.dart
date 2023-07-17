import 'package:bitcoin_tracker/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

    // data();
    // gg();
    // get();
  }

  String selected = 'AUD';
  var bitcoinValue = '??';
  var ethvalue = '??';
  var ltcvalue = '??';

  void getdata() async {
    try {
      double d = await CoinData(selected).getCoinData();
      double d1 = await CoinData(selected).getCoinData1();
      double d2 = await CoinData(selected).getCoinData2();

      setState(() {
        // print(CoinData.cur);

        bitcoinValue = d.toStringAsFixed(0);
        ethvalue = d1.toStringAsFixed(0);
        ltcvalue = d2.toStringAsFixed(0);
      });
    } catch (e) {
      print('network error');
    }
  }

  List<Text> picker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      Text(currency);
      items.add(Text(currency));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // data();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Text(
                      '1BTC = $bitcoinValue $selected',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Text(
                      '1ETH = $ethvalue $selected',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                        child: Text(
                      '1LTC = $ltcvalue $selected',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: CupertinoPicker(
                itemExtent: 32.0,
                onSelectedItemChanged: (selectedIndex) {
                  setState(() {
                    selected = currenciesList[selectedIndex];

                    getdata();
                  });
                  print(selected);
                },
                children: picker(),
              )),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
//                 value: selectedcurrency,
//                 items: getDropDown(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedcurrency = value!;
//                     print(value);
//                   });
//                  }),