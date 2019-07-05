import 'package:flutter/material.dart';
import 'package:upday_assignment/model/shutterstock_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:upday_assignment/constants/style.dart';
class ShutterStockItem extends StatelessWidget {
  final ShutterStockModel model;
  final Function(ShutterStockModel) onView;

  const ShutterStockItem({Key key, this.model, this.onView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onView(model),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Stack(
         alignment: Alignment.bottomCenter,

          children: <Widget>[

            Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              child: new Image.network(
                model.assets.preview.url,
                fit: BoxFit.fitWidth,
              ),
            ),

            Container(
              decoration: new BoxDecoration(

                  gradient: new LinearGradient(
                    colors: [Colors.black54, Colors.black12],
                  ),),

              alignment: Alignment.bottomCenter,
              child: Text(model.description, style: Style.dialogDesStyle,)
            ),






          ],
        )


      ),
    );
  }
}
