import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traning/Models/show_model.dart';
import 'package:traning/widget/card_view.dart';
import 'package:traning/widget/text_widget.dart';
import '../../Models/product_model.dart';
import '../../apis/api_service.dart';
import '../shows_detail/shows_details_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ProductModel>? _productModel = [];
  late List<ShowModel>? _showModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProduct();
    _getShow();
  }

  void _getProduct() async {
    _productModel = (await ApiServices().getProduct(context))!;
    setState(() {});
  }

  void _getShow() async {
    _showModel = (await ApiServices().getShow(context))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextView(
            text: "Demo Api", fontsize: 20, fontWeight: FontWeight.bold),
        elevation: 1,
      ),
      body: _showModel == null || _showModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.only(
            left: 12, right: 12, bottom: 12, top: 12),
        child: ListView.builder(
          itemCount: _showModel!.length,
          itemBuilder: (context, index) {
            log("DATA :: ${_showModel![index].image!.original}");
            log("DATA :: ${_showModel![index].name}");
            log("DATA :: ${_showModel![index].language}");
            log("DATA :: ${_showModel![index].type}");
            log("DATA :: ${_showModel![index].rating!.average}");

            return Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowsDetailsScreen(),),);
                },
                child: CardView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            image: _showModel![index].image!.original != null
                                ? DecorationImage(
                              image: NetworkImage(_showModel![index].image!.original.toString()),
                              fit: BoxFit.fill,
                            )
                                : DecorationImage(
                              image:
                              AssetImage("Assets/category1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text:
                                  "Name: ${_showModel![index].name}",
                                  fontWeight: FontWeight.bold,
                                  fontsize: 18,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  textOverFlow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                TextView(
                                  text:
                                  "Type: ${_showModel![index].type}",
                                  fontWeight: FontWeight.w500,
                                  fontsize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  textOverFlow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                TextView(
                                  text:
                                  "Language: ${_showModel![index].language}",
                                  fontWeight: FontWeight.w500,
                                  fontsize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  textOverFlow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 5),
                                TextView(
                                  text:
                                  "Rating: ${_showModel![index].rating!.average}",
                                  fontWeight: FontWeight.w500,
                                  fontsize: 16,
                                  color: Colors.black,
                                  textAlign: TextAlign.start,
                                  textOverFlow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      /*_productModel == null || _productModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, bottom: 12, top: 12),
              child: ListView.builder(
                itemCount: _productModel!.length,
                itemBuilder: (context, index) {
                  log("DATA :: ${_productModel![index].image}");
                  log("DATA :: ${_productModel![index].title}");
                  log("DATA :: ${_productModel![index].category}");
                  log("DATA :: ${_productModel![index].price}");
                  log("DATA :: ${_productModel![index].rating!.rate}");

                  double num = _productModel![index].price!.toDouble();
                  String numToString = num.toString();

                  log("NUM VALUE :: ${num}");
                  log("NUM TO STRING VALUE :: ${numToString}");

                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: CardView(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.17,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                image: _productModel![index].image != null
                                    ? DecorationImage(
                                        image: NetworkImage(_productModel![index].image.toString()),
                                        fit: BoxFit.fill,
                                      )
                                    : DecorationImage(
                                        image:
                                            AssetImage("Assets/category1.png"),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          "${_productModel![index].title}",
                                      fontWeight: FontWeight.bold,
                                      fontsize: 18,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      textOverFlow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5),
                                    TextView(
                                      text:
                                          "${_productModel![index].category}",
                                      fontWeight: FontWeight.w500,
                                      fontsize: 16,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      textOverFlow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextView(
                                          text:
                                          "Price: ${_productModel![index].price}",
                                          fontWeight: FontWeight.w500,
                                          fontsize: 16,
                                          color: Colors.black,
                                          textAlign: TextAlign.start,
                                          textOverFlow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 5),
                                        TextView(
                                          text:
                                          "Rating: ${_productModel![index].rating!.rate}",
                                          fontWeight: FontWeight.w500,
                                          fontsize: 16,
                                          color: Colors.black,
                                          textAlign: TextAlign.start,
                                          textOverFlow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    TextView(
                                      text:
                                      "QTY: ${_productModel![index].rating!.count}",
                                      fontWeight: FontWeight.w500,
                                      fontsize: 16,
                                      color: Colors.black,
                                      textAlign: TextAlign.start,
                                      textOverFlow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),*/
    );
  }
}
