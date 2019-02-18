import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isLoading = false;

  _onTap() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _onTap,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 4000),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(isLoading ? 40 : 10),
              ),
              width: isLoading ? 50 : 250,
              height: 50,
              alignment: Alignment.center,
              child: AnimatedCrossFade(
                duration: Duration(milliseconds: 4000),
                firstChild: Center(
                                  child: Text(
                      "Botão",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                ),
                secondChild: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              )
              /*isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    "Botão",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ), */
              ),
        ),
      ),
    );
  }
}
