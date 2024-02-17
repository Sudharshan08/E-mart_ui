import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/orders_screen/components/order_place_details.dart';
import 'package:emart_app/views/orders_screen/components/order_status.dart';
import 'package:flutter/material.dart';

class OrdersDetails extends StatelessWidget {
  final dynamic data;

  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              orderStatus(color: redColor,icon: Icons.done,title: "Order placed",showDone:data['order_placed']),
              orderStatus(color: Colors.blue,icon: Icons.thumb_up ,title: "Order Confirmed",showDone:data['order_confirmed']),
              orderStatus(color: Colors.yellow, icon: Icons.car_crash, title: "On Delivery",showDone:data['order_on_delivery']),
              orderStatus(color: Colors.purple,icon: Icons.done_all_rounded, title: "Delivered",showDone:data['order_delivered']),
          
              Divider(),
              10.heightBox,
             // continue details from 45 min vedio 17
             Column(
              children: [
                 orderPlaceDetails( 
                title1:"Order code",
                 title2: "Shipping Method", 
                 d1: data['order_code'], 
                 d2: data['shipping_method'],
                ),
          
                 orderPlaceDetails( 
                title1:"Order Date",
                 title2: "Payment Method", 
                 //d1: data['order_date'], 
                 d2: data['payment_method'],
                ),
          
                  orderPlaceDetails( 
                title1:"Payment status",
                 title2: "Delivery status", 
                 d1: "Unpaid",
                 d2: "Order placed",
                ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Shipping Address".text.fontFamily(semibold).make(),
                      "${data['order_by_name']}".text.make(),
                      "${data['order_by_email']}".text.make(),
                      "${data['order_by_address']}".text.make(),
                      "${data['order_by_city']}".text.make(),
                      "${data['order_by_state']}".text.make(),
                      "${data['order_by_phone']}".text.make(),
                      "${data['order_by_postalcode']}".text.make(),
              
                    ],
                  ),
                  SizedBox(
                    width: 135,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        "Total Amount".text.fontFamily(semibold).make(),
                        "${data['total_amount']}".text.color(redColor).fontFamily(bold).make(),
                      ],
                    ),
                  ),
                ],
              ),
            )
              ],
             ).box.outerShadowMd.make(),
          
             Divider(),
             10.heightBox,
          
             "Ordered product".text.size(16).color(darkFontGrey).fontFamily(semibold).makeCentered(),
             10.heightBox,
             ListView(
              shrinkWrap: true,
              children: List.generate(data['orders'].length, (index) {
              return orderPlaceDetails(
                title1: data['orders'][index]['title'],
                title2: data['orders'][index]['tprice'],
                d1: "${data['orders'][index]['qty']}kg",
                d2: "Refundable",
              );
             }).toList(),
             ).box.outerShadowMd.make(),

             10.heightBox,
             Row(
              children: [
                //"SUB TOTAL".text.size(16).fontFamily(semibold).color(darkFontGrey).make(),

              ],
             ),

          
          
            ],
          ),
        ),
      ),
    );
  }
}