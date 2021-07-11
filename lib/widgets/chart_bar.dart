import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
                height: constraints.maxHeight * .12,
                child:
                    FittedBox(child: Text(spendingAmount.toStringAsFixed(0)))),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -15,
                  intensity: .75,
                  lightSource: LightSource.topLeft,
                  color: Colors.white30),
              child: Container(
                height: constraints.maxHeight * .65,
                width: 12,
                child: Stack(
                  children: <Widget>[
                    FractionallySizedBox(
                      heightFactor: spendingPctOfTotal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).accentColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * .05,
            ),
            Container(height: constraints.maxHeight * .1, child: Text(label))
          ],
        );
      },
    );
  }
}
