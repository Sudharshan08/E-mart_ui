import 'package:emart_app/consts/consts.dart';

Widget ourButton({onPress, color, textColor, String? title}){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding:const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    //below remove login and put title in vedio number 2 timing number25:00
     child: title!.text.color(textColor).fontFamily(bold).make(),
     );
}