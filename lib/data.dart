import 'dart:convert';

import 'package:http/http.dart' as https;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const APIurl = 'https://rest.coinapi.io/v1/exchangerate';
const APIkey = 'A887EBD9-710A-4A4A-A4BA-66A7493C21F1';

class CoinData {
  var cur;
  CoinData(this.cur);
  // static var cur = 'AUD';
  // var selectedcur = 'AUD';
  Future getCoinData() async {
    String req = '$APIurl/BTC/$cur/?apikey=$APIkey';
    final response = await https.get(Uri.parse(req));

    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }

  Future getCoinData1() async {
    String req = '$APIurl/ETH/$cur/?apikey=$APIkey';
    final response = await https.get(Uri.parse(req));

    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }

  Future getCoinData2() async {
    String req = '$APIurl/LTC/$cur/?apikey=$APIkey';
    final response = await https.get(Uri.parse(req));

    if (response.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(response.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(response.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}

Future gg() async {
  final response = await https.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=77364e2e88fdcf92163319e8a58c9c25'));
  if (response.statusCode == 200) {
    print(response.statusCode);
    String res =
        jsonDecode(response.body)['weather'][0]['description'].toString();
    print(res);
    return res;
  } else {
    throw Exception('error');
  }
}
