import 'package:flutter/material.dart';
import 'package:khoj_tech/provider/cart_provider.dart';
import 'package:khoj_tech/widgets/icon_button_widget.dart';
import 'package:khoj_tech/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppbarWidget(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppbarWidget(
              context,
            ).preferredSize.height,
        color: const Color(
          0xfff2f2f2,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                alignment: Alignment.centerLeft,
                child: const TextWidget(
                  text: 'Order Summary',
                  color: Color(
                    0xff414042,
                  ),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .013,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.items.length,
                  itemBuilder: ((context, index) => ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            color: const Color(
                              0xff292665,
                            ).withOpacity(
                              0.3,
                            ),
                            borderRadius: BorderRadius.circular(
                              5,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * .18,
                          height: MediaQuery.of(context).size.height * .07,
                          child: Image.network(
                            cart.items.values.toList()[index].image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: TextWidget(
                          color: Colors.black,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: cart.items.values.toList()[index].title!,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: TextWidget(
                            color: const Color(
                              0xff414042,
                            ),
                            fontSize: 15,
                            text:
                                'PKR ${(double.parse(cart.items.values.toList()[index].price!) * cart.items.values.toList()[index].quantity!)}'),
                        trailing: TextWidget(
                          color: const Color(
                            0xff292665,
                          ),
                          fontSize: 15,
                          text:
                              "x ${cart.items.values.toList()[index].quantity!}",
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .023,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * .9,
              //   alignment: Alignment.centerLeft,
              //   child: const TextWidget(
              //     text: 'Shipping Address',
              //     color: Color(
              //       0xff414042,
              //     ),
              //     fontSize: 17,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .02,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * .9,
              //   child: ListTile(
              //     leading: CircleAvatar(
              //       backgroundColor: const Color(
              //         0xff292665,
              //       ).withOpacity(
              //         0.3,
              //       ),
              //       child: const Icon(
              //         Icons.location_on_outlined,
              //         color: Color(
              //           0xff292665,
              //         ),
              //       ),
              //     ),
              //     title: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const TextWidget(
              //           color: Colors.black,
              //           fontSize: 15,
              //           text: 'Thomos Kunz',
              //         ),
              //         const TextWidget(
              //           color: Colors.black,
              //           fontSize: 15,
              //           text: '030332784562',
              //         ),
              //         SizedBox(
              //           height: MediaQuery.of(context).size.height * .02,
              //         ),
              //       ],
              //     ),
              //     subtitle: const TextWidget(
              //       color: Color(
              //         0xff414042,
              //       ),
              //       fontSize: 15,
              //       text:
              //           "871 kersagan Street Thomos kunz kersagan Street Thomos kunz 44",
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .02,
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white70,
              //     borderRadius: BorderRadius.circular(
              //       5,
              //     ),
              //   ),
              //   height: MediaQuery.of(context).size.height * .09,
              //   width: MediaQuery.of(context).size.width * .9,
              //   child: Center(
              //     child: ListTile(
              //       title: TextWidget(
              //         text: "Total",
              //         color: Color(
              //           0xff414042,
              //         ),
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       trailing: Chip(
              //         label: TextWidget(
              //           color: Colors.white,
              //           fontSize: 15,
              //           text: "PKR ${totalAmount}",
              //         ),
              //         backgroundColor: Color(
              //           0xffED1651,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .035,
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * .4,
              //   height: MediaQuery.of(context).size.height * .05,
              //   child: ElevatedButtonWidget(
              //     text: 'Checkout',
              //     textColor: Colors.white,
              //     fontSize: 16.5,
              //     backColor: const Color(
              //       0xff292665,
              //     ),
              //     onTap: () {
              //       var req = RequestOrderModel(
              //           billing: Ing(
              //               firstName: 'Talha',
              //               lastName: "Irfan",
              //               email: "dsf@sdf.fsd"),
              //           lineItems: [
              //             LineItem(
              //               productId: items.values.toList()[0].id,
              //               quantity: items.values.toList()[0].quantity,
              //             ),
              //           ],
              //           shippingLines: [
              //             ShippingLine(
              //               total: totalAmount.toString(),
              //             )
              //           ]);
              //       postOrder(req);
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .035,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar AppbarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const TextWidget(
        text: 'Your Cart',
        fontSize: 19,
        fontWeight: FontWeight.bold,
        color: Color(
          0xff414042,
        ),
      ),
      leading: IconButtonWidget(
        onTap: () {
          Navigator.pop(context);
        },
        icon: Icons.arrow_back_ios,
        iconSize: 19,
        color: const Color(
          0xff414042,
        ),
      ),
    );
  }
}
