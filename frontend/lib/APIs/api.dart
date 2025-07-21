import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  final basePath = 'http://192.168.18.124:3000';

  Future<List<dynamic>> readData() async {
    final url = Uri.parse('$basePath/read');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data;
        //print(data);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return [
          {
            'error': 'Failed to create data',
            'statusCode': response.statusCode,
            'message': response.body,
          },
        ];
      }
    } catch (e) {
      print('Error: $e');
      return [
        {'error': 'Network error or timeout', 'exception': e.toString()},
      ];
    }
  }

  Future<Map> createData(Map data) async {
    final url = Uri.parse('$basePath/create');
    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(data),
            // headers: {'Content-Type': 'application/json'},
            // body: jsonEncode({
            //   'name': 'Arslan',
            //   'email': 'arslan1@gmail.com',
            //   'imageUrl':
            //       'https://th.bing.com/th/id/R.0ebeb7ba36140882cb7c48154fcc5bd6?rik=8jLZ%2f6%2fI%2fh1v7Q&riu=http%3a%2f%2fimages5.fanpop.com%2fimage%2fphotos%2f30500000%2fThe-Joker-the-joker-30590744-1000-1328.jpg&ehk=ELjZFTb8He%2fFpp2v%2bEHOcThZF%2bi484QNZ%2br1qnHlWuI%3d&risl=&pid=ImgRaw&r=0',
            // }),
          )
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        print('${response.statusCode}: Data created successfully');
        return data;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return {
          'error': 'Failed to create data',
          'statusCode': response.statusCode,
          'message': response.body,
        };
      }
    } catch (e) {
      print('Error: $e');
      return {'error': 'Network error or timeout', 'exception': e.toString()};
    }
  }

  Future<void> deleteData(String id) async {
    final url = Uri.parse('$basePath/delete/$id');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('User with ID $id deleted successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> updateData(String id, Map data) async {
    final url = Uri.parse('$basePath/update/$id');
    try {
      final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return data;
    }else{
      print('Error: ${response.statusCode} - ${response.body}');

    }
    } catch (e) {
      print('Error: $e');
      
    }
  }
}
