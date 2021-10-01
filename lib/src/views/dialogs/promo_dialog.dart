import 'package:appname/src/constants/constants.dart';
import 'package:flutter/material.dart';

class PromoDialog extends StatelessWidget {
  final Widget image;

  const PromoDialog({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CommonConstants.smallRadius),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorConstants.secondaryAppColor,
                ),
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.width / 1.1,
                child: image,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: ClipOval(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: ColorConstants.defaultTextColor,
                  width: 40,
                  height: 40,
                  child: Center(
                      child: Icon(
                    Icons.clear,
                    color: ColorConstants.defaultColor,
                  )),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorConstants.defaultColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.white, width: 3)),
                ),
                onPressed: () {},
                child: Text(
                  "BUY NOW",
                  style: TextStyle(
                    color: ColorConstants.defaultTextColor,
                    fontSize: 20,
                    shadows: const [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
