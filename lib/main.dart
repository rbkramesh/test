import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/custom_icons_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _likecount = 0;
  int _commentcount = 0;
  String _message = '';
  bool bottomreached = false;

  int get likecount => _likecount;
  int get commentcount => _commentcount;
  String get message => _message;

  void likeincrement() {
    _likecount++;
    notifyListeners();
  }

  void commentincrement() {
    _commentcount++;
    notifyListeners();
  }

  void msg1(String mssg) {
    _message = mssg;
    bottomreached = true;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  final globalKey = GlobalKey;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
      home: Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Center(child: Text("Bluepad")),
          leading: IconButton(icon: Icon(Icons.home),
          onPressed:(){
    final snackBar = SnackBar(content: Text('Home button pressed'),);
    globalKey.currentState!.showSnackBar(snackBar);
    }),
    ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage() : super();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _controller;
  String message = "";
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      message = "You reached the bottom of the screen";
      context.read<Counter>().msg1(message);
      // optional feature
      showToast(message);
    }

    // if (_controller.offset <= _controller.position.minScrollExtent &&
    //     !_controller.position.outOfRange) {
    //   message = "You reached the top of the screen";
    //   //showToast(message);
    //   context.read<Counter>().msg1(message);
    // }
  }

  void showToast(String msg1) {
    Fluttertoast.showToast(
        msg: msg1,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.redAccent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: _controller,
        children: [
          // Center(child: Text('${context.watch<Counter>().message} ')),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                text:
                    '\nCrypto Investor Buys \$ 69 Million Beeple NFT Art Work\n\n',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          '\t\t\tThe latest news to do the rounds is about the investor from Singapore, has bought \$ 69 Million Beeple NFT. Now, that sounds too interesting. However, he is not ready to divulge his real name. I a world like ours, anyone can attack him for his funds. I just learnt, that this wealthy investor goes by the name Metakovan. It is a record of sorts in the bitcoin genre. The record-braking digital artwork is connected to an image file, that is connected to a NFT. \n\n',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      )),
                  TextSpan(
                      text:
                          '\t\t\tYou will be amazed to know how lucrative such bitcoins are getting today. Moreover, they are receiving rave reviews. Christie’s Auction House is behind this huge deal. Metakovan also happens to be the chief investor behind Metapurse. It is nothing, but a Crypto-based fund. It is also the largest NFT in the world. At least, that is what it claims to be. Metakovan has also given an interview on Google Hangouts, and states there, that it is one lucrative deal. It is a big investment. The art work in question is interesting. \n\n',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(
                      text:
                          '\t\t\tIt is a mosaic of 5,000 artworks. It took him the last 13 years to prepare it. Says, Mike Winkelmann, who goes by the artist whose name is Beeple. One can find a variety of images inside the mosaic artwork. There is Abraham Lincoln spanking baby Trump, and more interesting ones. The bidding happened on 25 February. If reports are to be believed, initially things were a bit mellow, however, it shot up in the last ten minutes. \n\n',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(
                      text: 'Monetization of NFTs\n\n ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          '\t\t\tWell, this is not the first time, Metakovan has done this. He has purchased more such Beeple artworks amounting to \$ 2.2 million in December 2020. Moreover, he fractionalized them and locked them with blockchain. No one even got a whiff, of what he was up to. The entire episode has created a sudden gripping interest in NFTs. \n\n',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  TextSpan(
                    text:
                        '\t\t\tWinkelmann is not ready to divulge any further details yet. Well, Metakovan himself is not planning to sell his shares. This is a historic feat that he has achieved. For the uninitiated, almost 20 million visitors were a part of the auction. And, there were 200 registrations for the bidding. Metakovan was one of them. He has made the payment through ether. This is also a first, for Christie’s. no one has ever received such a large payment in cryptocurrency, in a similar domain. \n\n',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text:
                        '\t\t\tThis is the third highest amount which has been paid for the artwork of a living artist. So, you can understand, how it is. The entire feeling is simply overwhelming. The amount, that Metakovan has invested in artwork can actually buy a few palaces in France. You could even buy a yacht or an aeroplane, with that amount of money. \n\n',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(
                    text:
                        '\t\t\tIt seems that the market is quite open now.  And, people like Metakovan can do the unimaginable. Metakovan says, that he has no house, or cars. He just loves art and the power of bitcoin. He packs it up and moves on. While the world gushes at him. \n\n',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),

          // To display the msg "You reached the bottom of the screen
         Container(
         ),
          Center(child: Text('${context.watch<Counter>().message} ')),
          SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                height: 12,
                color: Colors.black26,
              )),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '${context.watch<Counter>().likecount} Likes',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '${context.watch<Counter>().commentcount} comments',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                height: 12,
                color: Colors.black26,
              )),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                    onPressed: () {
                      context.read<Counter>().likeincrement();
                    },
                    child: Icon(
                     CustomIcons.thumbs_up,
                      color: Colors.blue,
                    )),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      context.read<Counter>().commentincrement();
                    },
                    child: Icon(CustomIcons.comment_dots)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
