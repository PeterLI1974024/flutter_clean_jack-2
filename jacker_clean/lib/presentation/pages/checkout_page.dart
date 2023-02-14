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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Constants.orderContent,
              style: TextStyle(fontSize: 20, color: Swatches.black),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                Constants.serviceItem,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.serviceItem.name} x ${widget.serviceItem.count}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text('${widget.serviceItem.price}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
