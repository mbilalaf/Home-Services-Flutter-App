import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_services/controllers/add_to_cart_controller/add_to_cart_controller.dart';
import 'package:home_services/controllers/add_to_cart_controller/cart_services_controller/cart_services_controller.dart';
import 'package:home_services/pages/payment_page/payment_page.dart';
import 'package:home_services/utils/colors.dart';
import 'package:home_services/utils/styles.dart';
import 'package:home_services/widgets/appbar.dart';
import 'package:home_services/widgets/button.dart';
import 'package:home_services/widgets/remove_items_dialoug.dart';
import 'package:home_services/widgets/what_bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  AddToCartController addToCartController = Get.put(AddToCartController());
  CartServiceDetailsController cartServiceDetailsController =
      Get.put(CartServiceDetailsController());

  Future<void> fetchData() async {
    await addToCartController.fetchCartFromFirebase();
    await cartServiceDetailsController
        .fetchServiceDetails(addToCartController.cartItems);
  }

  final Uri workerWhatsapp = Uri.parse('https://wa.me/+923348328351');
  final Uri customerServiceWhatsapp = Uri.parse('https://wa.me/++923480051552');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Column(
          children: [
            const MyAppBar(title: "Cart"),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                    bottom: 10,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FutureBuilder(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            print(
                                'Cart Items List: ${cartServiceDetailsController.serviceDetailsList}');
                            print(
                                'services Items List: ${addToCartController.cartItems}');
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.81,
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                addToCartController.isDone.value = false;
                              });
                              return Obx(() => addToCartController
                                          .cartItems.length ==
                                      0
                                  ? Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.81,
                                      alignment: Alignment.center,
                                      child: const Text('Your cart is Empty'))
                                  : addToCartController.isDone.value
                                      ? Container()
                                      : ListView.builder(
                                          itemCount: min(
                                              addToCartController
                                                  .cartItems.length,
                                              cartServiceDetailsController
                                                  .serviceDetailsList.length),
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            print(
                                                'Length: ${addToCartController.cartItems.length}');
                                            print('Index: $index');

                                            print(
                                                'ID: at index: $index = ${cartServiceDetailsController.serviceDetailsList[index].docID}');
                                            return Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color: MyColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: MyColors.black
                                                        .withOpacity(0.1),
                                                    offset: const Offset(2, 2),
                                                    blurRadius: 12,
                                                  ),
                                                ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: CachedNetworkImage(
                                                        height:
                                                            Get.height * 0.12,
                                                        width: Get.width * 0.3,
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            cartServiceDetailsController
                                                                .serviceDetailsList[
                                                                    index]
                                                                .img,
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    downloadProgress) =>
                                                                Center(
                                                          child: SizedBox(
                                                            height: Get.height *
                                                                0.12,
                                                            width:
                                                                Get.width * 0.3,
                                                            child: Shimmer
                                                                .fromColors(
                                                              baseColor: MyColors
                                                                  .lightGray,
                                                              highlightColor:
                                                                  MyColors
                                                                      .darkGray,
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.2,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: MyColors
                                                                      .lightGray,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              24),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 16),
                                                    Row(
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              // "Hair Accessory",
                                                              cartServiceDetailsController
                                                                  .serviceDetailsList[
                                                                      index]
                                                                  .name,
                                                              style: MyFontStyle
                                                                  .mediumText,
                                                            ),
                                                            Text(
                                                              cartServiceDetailsController
                                                                  .serviceDetailsList[
                                                                      index]
                                                                  .service,
                                                              style: MyFontStyle
                                                                  .captionText,
                                                            ),
                                                            const SizedBox(
                                                                height: 5),
                                                            Text(
                                                              "Rs: ${cartServiceDetailsController.serviceDetailsList[index].price}",
                                                              style: MyFontStyle
                                                                  .mediumText
                                                                  .copyWith(
                                                                color: MyColors
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 10),
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.46,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      MyButton(
                                                                        changeStyle:
                                                                            true,
                                                                        btnColor:
                                                                            Colors.red,
                                                                        width:
                                                                            0.18,
                                                                        height:
                                                                            20,
                                                                        radius:
                                                                            5,
                                                                        btnText:
                                                                            "Cancel",
                                                                        onTap:
                                                                            () {
                                                                          CartsDialog.show(
                                                                              title: 'Removing',
                                                                              content: 'Do you want to remove the item ?',
                                                                              onYesPress: () {
                                                                                addToCartController.removeFromCartById(cartServiceDetailsController.serviceDetailsList[index].docID);
                                                                                Get.back();
                                                                              });
                                                                          // Get.to(
                                                                          //     const PaymentPage());
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      MyButton(
                                                                        changeStyle:
                                                                            true,
                                                                        width:
                                                                            0.18,
                                                                        height:
                                                                            20,
                                                                        radius:
                                                                            5,
                                                                        btnText:
                                                                            "Book Now",
                                                                        onTap:
                                                                            () {
                                                                          // Get.to(const PaymentPage());
                                                                          whatsappBottomSheet(
                                                                              workerWhatsapp,
                                                                              customerServiceWhatsapp,
                                                                              index: index,
                                                                              isCart: true);
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ));
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        Obx(() => addToCartController.cartItems.length == 0
                            ? Container()
                            : MyButton(
                                btnText: "Checkout",
                                onTap: () {
                                  Get.to(const PaymentPage());
                                },
                              ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
