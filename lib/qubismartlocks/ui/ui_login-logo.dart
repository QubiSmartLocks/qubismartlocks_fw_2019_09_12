import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UILoginLogo extends StatelessWidget {
  const UILoginLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: MediaQuery.of(context).size.width * 40 / 100,
//      color: Colors.yellow,
      width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
      height: 100,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .25, left: App.variables.calculeAnchoResponsive(context, 0, .1, .1, .1)),
      child: Center(
        child: Image.asset(
          AppRes.appResMap[Co.LOGO_G],
          fit: BoxFit.fitHeight,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
