import 'package:blockpackage/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(), child: MainPage()),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_red);
            },
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              bloc.dispatch(ColorEvent.to_blue);
            },
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.home),
        title: Center(
          child: Text("Package 20160801250"),
        ),
        actions: <Widget>[Icon(Icons.camera_enhance)],
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
            builder: (context, currentColor) => AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: currentColor,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
      ),
    );
  }
}
