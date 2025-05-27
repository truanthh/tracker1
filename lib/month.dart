import 'package:flutter/material.dart';
import 'close_dialog.dart';

class Month extends StatefulWidget {
  const Month({super.key});

  State<Month> createState() => _MonthState();
}

class _MonthState extends State<Month> {
  List<List<int?>> grid = List.generate(5, (_) => List.filled(7, 0));

  @override
  void initState() {
    super.initState();
    _fillMonth();
  }

  void _fillMonth() {
    int day = 1;

    setState(() {
      for (var i = 0; i < grid.length; i++) {
        List<int?> weekArr = grid[i];
        for (var j = 0; j < weekArr.length; j++) {
          weekArr[j] = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'bla',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 0.5,
          ),
          itemCount: 31,
          itemBuilder: (context, index) {
            int row = index ~/ 7;
            int col = index % 7;

            return GestureDetector(
              onTap: () async {
                final result = await showCloseDialog(context);
                if (result != null) {
                  setState(() {
                    grid[row][col] = int.tryParse(result);
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      child: Center(
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(fontSize: 24, color: Colors.grey),
                        ),
                      ),
                    ),
                    // actual cell value
                    SizedBox(
                      child: Center(
                        child: Text(
                          grid[row][col].toString(),
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
