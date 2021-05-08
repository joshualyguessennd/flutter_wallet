import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> with TickerProviderStateMixin {
  bool visibility = true;

  double windowWidth = 0;
  double windowHeight = 0;

  ScrollController _scrollViewController;
  bool _showAppbar = false;
  bool isScrollingDown = false;

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _controller = TabController(vsync: this, length: 2);
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = true;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = true;
          setState(() {});
        }
      }
      if (_scrollViewController.position.pixels < 30) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = false;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

    _scrollViewController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            height: _showAppbar ? 56.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                'Wallet',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: <Widget>[
                //add buttons here
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('assets/images/camera.png'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollViewController,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Wallet',
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Image(
                          image: AssetImage('assets/images/camera.png'),
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('VALEUR TOTAL PORTEFEUILLE'),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CFA',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Box Amount + address container
                  SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                elevation: 0.0,
                                builder: (BuildContext builder) {
                                  return Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height *
                                        0.85,
                                    child: Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height *
                                          0.85,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 35),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Text('Mon Compte Principal',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              'CFA0',
                                              style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.82,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xffcfd2d4),
                                              ),
                                              child: TabBar(
                                                unselectedLabelColor:
                                                    Colors.black,
                                                indicator: BoxDecoration(
                                                  color: Color(0xff1ec72f),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                controller: _controller,
                                                tabs: [
                                                  Tab(
                                                    text: 'Actifs',
                                                  ),
                                                  Tab(
                                                    text: 'Transactions',
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.82,
                                                child: TabBarView(
                                                  controller: _controller,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Image(
                                                                    height: 20,
                                                                    image: AssetImage(
                                                                        'assets/images/logoEthereum.png'),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'Ethereum',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '0 ETH',
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 8),
                                                              child: Text(
                                                                'CFA 0',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '@ CFA 1,000,000',
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 40,
                                                        ),
                                                        Text(
                                                            "Il n'y a pour le moment aucune activit2 sur le compte"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            width: MediaQuery.of(context).size.width * 0.92,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 50, top: 8),
                                    child: Text(
                                      'Mon compte principal',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 30),
                                    child: Row(
                                      children: [
                                        Text(
                                          'CFA 0',
                                          style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Icon(Icons.arrow_forward_ios_outlined,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 38,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12, top: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                isDismissible: true,
                                                isScrollControlled: true,
                                                elevation: 0.0,
                                                builder:
                                                    (BuildContext builder) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.45,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(25),
                                                        topRight:
                                                            Radius.circular(25),
                                                      ),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          child: Center(
                                                            child: Text(
                                                              'Addresses to receive funds',
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                        Center(
                                                          child: Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.25,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.5,
                                                            child: Image(
                                                                height: 80,
                                                                image: AssetImage(
                                                                    'assets/images/qr.png')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 30),
                                                              child: Container(
                                                                height: 50,
                                                                width: 120,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            23),
                                                                    color: Color(
                                                                        0xfff5f6f7)),
                                                                child: Center(
                                                                    child: Text(
                                                                        'Copy')),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 30,
                                                            ),
                                                            Container(
                                                              height: 50,
                                                              width: 220,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              23),
                                                                  color: Color(
                                                                      0xff24bf48)),
                                                              child: Center(
                                                                  child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    FontAwesome5
                                                                        .upload,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15,
                                                                  ),
                                                                  Text(
                                                                    'Share',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ],
                                                              )),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/internal.png'),
                                            ),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color(0xfff5f7fa)),
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 40,
                                          width: 40,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/external.png'),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Color(0xfff5f7fa)),
                                        )
                                      ],
                                    ),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/green.jpg'),
                                    fit: BoxFit.fill),
                                color: Colors.blue),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                elevation: 0.0,
                                builder: (BuildContext builder) {
                                  return Container(
                                    height: MediaQuery.of(context)
                                            .copyWith()
                                            .size
                                            .height *
                                        0.90,
                                    child: Container(
                                      height: MediaQuery.of(context)
                                              .copyWith()
                                              .size
                                              .height *
                                          0.85,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(35),
                                          topRight: Radius.circular(35),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 35),
                                            child: Text(
                                              'Nouveau compte',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 35),
                                            child: Container(
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                    hintStyle: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                    hintText:
                                                        'Ajouter un nouveau compte',
                                                    border: InputBorder.none),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.4,
                                          ),
                                          Center(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff1ec72f),
                                                  border: Border.all(
                                                    color: Color(0xff1ec72f),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.26,
                            width: MediaQuery.of(context).size.width * 0.92,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xff04d98e),
                                      size: 40,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Creer un compte',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    'Gerer separement votre budget',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff04d98e)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32.0, top: 10),
                      child: Text(
                        'Gerer mes comptes',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                elevation: 0.0,
                                builder: (BuildContext builder) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          child: Center(
                                            child: Text(
                                              'Addresses to receive funds',
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.25,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            child: Image(
                                                height: 80,
                                                image: AssetImage(
                                                    'assets/images/qr.png')),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Container(
                                                height: 50,
                                                width: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            23),
                                                    color: Color(0xfff5f6f7)),
                                                child:
                                                    Center(child: Text('Copy')),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Container(
                                              height: 50,
                                              width: 220,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(23),
                                                  color: Color(0xff24bf48)),
                                              child: Center(
                                                  child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FontAwesome5.share_alt,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Text(
                                                    'Share',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              )),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Image(
                                  image:
                                      AssetImage('assets/images/interna1.png'),
                                  height: 40,
                                ),
                                Text(
                                  'Recevoir',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "D'un protefeuille existant",
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isDismissible: true,
                                isScrollControlled: true,
                                elevation: 0.0,
                                builder: (BuildContext builder) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Text(
                                            'Buy Ether',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.14,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/add_square.png'),
                                  height: 40,
                                ),
                                Text(
                                  'Acheter',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Acheter via mobile money",
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Plus d'options",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/bug.png'),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Center(
                                  child: Text(
                                    "Envoyer un rapport",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/settings.png'),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Center(
                                  child: Text(
                                    "Reglages et support",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage('assets/images/more.png'),
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "Plus de fonctionalites",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: MediaQuery.of(context).size.height * 0.09,
                          child: Text(
                              'SkyPay Inc, est une independante, auto-financee compagnie.\nNous apportons gratuitement, de facon open-source, un interfacr utilisateur pour interagir avec la blockchain et les services financier.'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Text(
                              'Nous ne collectons, gardons, ou ne sauvegardons vos cles, comptes, informations ou mots de passe. Nous ne collectons aucune donnees passives, ni ne monetisons la lensemble de vos donnees, et nous nutilisons en aucun cas vos donnees dans un but marketing ou publicitaire.'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
