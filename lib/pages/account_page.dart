import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

enum ButtonType { payBills, donate, receiptients, offers }
enum TransactionType { sent, received, pending }

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue[300],
          elevation: 0,
          title: const Text(
            "Payment Page",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(21),
                    color: Colors.blue[300],

                    // color: Theme.of(context).primaryColor,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Hey James,",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  "Thank you for Visiting us ",
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SendReceiveSwitch(),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(21),
                    color: Color(0xfff4f5f9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: CustomButton(buttonType: ButtonType.payBills),
                        ),
                        Flexible(
                          child: CustomButton(buttonType: ButtonType.donate),
                        ),
                        // Flexible(
                        //   child:
                        //       CustomButton(buttonType: ButtonType.receiptients),
                        // ),
                        // Flexible(
                        //   child: CustomButton(buttonType: ButtonType.offers),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "RECENT TRANSACTIONS",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 17.0,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          Transaction(
                            receptient: "Amazigh Halzoun",
                            transactionAmout: "5000.00",
                            transactionDate: "26 Jun 2019",
                            transactionInfo: "Laptop",
                            transactionType: TransactionType.sent,
                          ),
                          Transaction(
                            receptient: "Awesome Client",
                            transactionAmout: "15000.00",
                            transactionDate: "26 Jun 2019",
                            transactionInfo: "Mobile App",
                            transactionType: TransactionType.received,
                          ),
                          Transaction(
                            receptient: "Lazy Client",
                            transactionAmout: "25000.00",
                            transactionDate: "24 Jun 2019",
                            transactionInfo: "Mobile App",
                            transactionType: TransactionType.pending,
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
      ),
    );
  }
}

class SendReceiveSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blue[300],
      ),
      padding: EdgeInsets.all(21.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Pay Ksh:300",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Draggable(
            data: 5,
            child: Container(
              width: 51,
              height: 51,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white54, Theme.of(context).primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
            ),
            feedback: Container(
              width: 51,
              height: 51,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white54, Theme.of(context).primaryColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.3, 1]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.attach_money,
                color: Theme.of(context).primaryColor,
              ),
            ),
            axis: Axis.horizontal,
            childWhenDragging: Container(
              width: 51,
              height: 51,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Send",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Transaction extends StatelessWidget {
  final TransactionType transactionType;
  final String transactionAmout, transactionInfo, transactionDate, receptient;
  const Transaction(
      {Key? key,
      required this.transactionType,
      required this.transactionAmout,
      required this.transactionInfo,
      required this.transactionDate,
      required this.receptient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String transactionName;
    IconData transactionIconData;
    Color color;
    switch (transactionType) {
      case TransactionType.sent:
        transactionName = "Sent";
        transactionIconData = Icons.arrow_upward;
        color = Theme.of(context).primaryColor;
        break;
      case TransactionType.received:
        transactionName = "Received";
        transactionIconData = Icons.arrow_downward;
        color = Colors.green;
        break;
      case TransactionType.pending:
        transactionName = "Pending";
        transactionIconData = Icons.arrow_downward;
        color = Colors.orange;
        break;
    }
    return Container(
      margin: EdgeInsets.all(9.0),
      padding: EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            //  blurRadius: 5.0,
            // color: Colors.blueGrey,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_960_720.jpg",
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                    child: FittedBox(
                      child: Icon(
                        transactionIconData,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 5.0),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      receptient,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Kshs $transactionAmout",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$transactionInfo - $transactionDate",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "$transactionName",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  const CustomButton({Key? key, required this.buttonType}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String buttonText = "", buttonImage;
    switch (buttonType) {
      case ButtonType.payBills:
        buttonText = "Pay Bills";
        buttonImage = "assets/receipt.png";
        break;
      case ButtonType.donate:
        buttonText = "Donate";
        buttonImage = "assets/donation.png";
        break;
      case ButtonType.receiptients:
        buttonText = "Receipients";
        buttonImage = "assets/users.png";
        break;
      case ButtonType.offers:
        buttonText = "Offers";
        buttonImage = "assets/discount.png";
        break;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  gradient: LinearGradient(
                    colors: [Colors.white10, Colors.black12],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Image.asset(
                  buttonImage,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              FittedBox(
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
