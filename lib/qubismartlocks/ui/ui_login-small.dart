import 'package:qubismartlocks_fw/qubismartlocks.dart';


class UILoginSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        UILoginBackgroundImage(opacidad: 0.2),
        Container(
          width: App.variables.calculeAnchoResponsive(context, .4, .8, .8, .8),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: <Widget>[
              UILoginLogo(),
              UILoginForm(),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ],
    );
  }
}
