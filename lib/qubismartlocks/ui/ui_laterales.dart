import 'package:qubismartlocks_fw/qubismartlocks.dart';

class UILaterales extends StatelessWidget {
  const UILaterales({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 5 / 100,
        child: Image.asset(AppRes.appResMap[Co.BACKGROUND_LATERAL],
            fit: BoxFit.cover),
      ),
    );
  }
}
