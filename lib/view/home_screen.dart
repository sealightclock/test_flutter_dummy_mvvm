import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/my_string_viewmodel.dart';

class MyHomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MyStringViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('MVVM with SharedPreferences')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Stored Value:", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text(
                viewModel.myString.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter new value',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.updateString(_controller.text);
                },
                child: Text('Update Value'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  viewModel.fetchFromServer();
                },
                child: Text('Update from Server'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
