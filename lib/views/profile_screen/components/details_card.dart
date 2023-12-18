import 'package:emart_app/consts/consts.dart';

Widget detailsCard({width, String? count, String? title}){
  return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
                5.heightBox,
                title!.text.fontFamily(bold).color(darkFontGrey).make(),
                5.heightBox,
                "You Ordered".text.fontFamily(bold).color(darkFontGrey).make(),
              ],
            ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(3)).make();
}