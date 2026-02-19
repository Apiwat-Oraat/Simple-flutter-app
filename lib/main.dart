import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // จำกัดค่าให้อยู่ในช่วง 0 - 100
  void _updateCounter(int value) {
    setState(() {
      _counter += value;

      if (_counter < 0) {
        _counter = 0;
      } else if (_counter > 100) {
        _counter = 100;
      }
    });
  }

  // กำหนดสีตามช่วงค่า
  Color _getCounterColor() {
    if (_counter <= 35) {
      return Colors.green;
    } else if (_counter <= 80) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // แสดงตัวเลขใหญ่ตรงกลาง
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: _getCounterColor(),
              ),
            ),

            const SizedBox(height: 40),

            // ปุ่ม +1 +5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _updateCounter(1),
                  child: const Text('+1'),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () => _updateCounter(5),
                  child: const Text('+5'),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // ปุ่ม -1 -5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _updateCounter(-1),
                  child: const Text('-1'),
                ),

                const SizedBox(width: 15),

                ElevatedButton(
                  onPressed: () => _updateCounter(-5),
                  child: const Text('-5'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
