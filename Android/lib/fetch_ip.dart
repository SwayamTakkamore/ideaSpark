import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchIp extends StatelessWidget {
  const FetchIp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch IP Address'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            printIps();
          },
          child: const Text('Fetch IP Address'),
        ),
      ),
    );
  }

    void printIps() async {
    final url = Uri.parse('https://api.ipify.org');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final ip = response.body;
      print('Public IP: $ip');
    } else {
      print('Failed to fetch IP address');
    }

    final localIp = InternetAddress.anyIPv4.host;
    print('Local IP: $localIp');
  }
}