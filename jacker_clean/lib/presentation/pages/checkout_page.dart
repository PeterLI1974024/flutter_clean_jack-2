import 'package:flutter/material.dart';
import 'package:jacker_clean/presentation/constants/Constant.dart';
import 'package:jacker_clean/presentation/constants/Swatches.dart';

class CheckOutPage extends StatefulWidget {
  CheckOutPage({super.key, this.serviceItem});

  final serviceItem;

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Swatches.primary,
          title: const Text(
            Constants.priceConfirmation,
            style: TextStyle(color: Swatches.white),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              Constants.orderContent,
              style: TextStyle(fontSize: 20, color: Swatches.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6, bottom: 5, left: 16),
            child: Text(
              Constants.serviceItem,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.serviceItem.name} x ${widget.serviceItem.count}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '${widget.serviceItem.total}',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              'lib/image/icon.png',
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              var snackBar = SnackBar(
                content: Text('結帳成功'),
                backgroundColor: Colors.amber,
              );
              // Step 3
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.pop(context, -1);
            },
            child: Container(
              color: Swatches.primary,
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                  child: Text(
                Constants.checkout,
                style: TextStyle(fontSize: 18, color: Swatches.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
