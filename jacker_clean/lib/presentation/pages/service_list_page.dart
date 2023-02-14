import 'package:flutter/material.dart';
import 'package:jacker_clean/data/utils/service_data.dart';
import 'package:jacker_clean/presentation/constants/Constant.dart';
import 'package:jacker_clean/presentation/constants/Swatches.dart';
import 'package:jacker_clean/data/utils/service_item.dart';
import 'package:jacker_clean/presentation/pages/checkout_page.dart';

class ServiceListPage extends StatefulWidget {
  const ServiceListPage({super.key});

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  final int maximun = 10;
  final int minimun = 0;
  final List<ServiceItem> list = [];
  Future getItem() async {
    for (Map<String, dynamic> map in mockServiceData) {
      final serviceItem =
          ServiceItem(name: '${map['title']}', price: map['price']);
      list.add(serviceItem);
    }
  }

  @override
  void initState() {
    getItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF36BBD9),
        title: const Text(
          Constants.airConditionerCleaning,
          style: TextStyle(),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Container(
                height: 24,
                width: 4,
                color: Swatches.primary,
              ),
              const SizedBox(
                width: 6,
              ),
              const Text(
                Constants.serviceItem,
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            color: Colors.white,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(list[index].name),
                    subtitle: Text(
                      '\$' + list[index].price.toString(),
                      style: const TextStyle(
                          color: Swatches.primary, fontSize: 18),
                    ),
                    trailing: Wrap(
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (() {
                            if (list[index].count == minimun) {
                              return;
                            } else {
                              list[index].count--;
                            }
                            setState(() {});
                          }),
                          icon: Icon(Icons.remove_circle),
                          color: list[index].count == minimun
                              ? Swatches.grey
                              : Swatches.primary,
                        ),
                        Text(list[index].count.toString()),
                        IconButton(
                          onPressed: () {
                            if (list[index].count == maximun) {
                              return;
                            } else {
                              list[index].count++;
                            }
                            setState(() {});
                          },
                          icon: Icon(Icons.add_circle),
                          color: list[index].count == maximun
                              ? Swatches.grey
                              : Swatches.primary,
                        )
                      ],
                    ),
                  );
                })),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (list.where((e) => e.count > 0).length > 1) {
              var snackBar = const SnackBar(
                content: Text('只能選擇一種服務'),
                backgroundColor: Colors.amber,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (list.where((e) => e.count == 0).length == list.length) {
              var snackBar = const SnackBar(
                content: Text('至少需選擇一個服務'),
                backgroundColor: Colors.amber,
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              final res = await Navigator.push(context,
                  MaterialPageRoute(builder: ((context) {
                return CheckOutPage(
                    serviceItem: list.firstWhere((e) => e.count > 0));
              })));
              if (res == -1) {
                list.clear();
                await getItem();
                setState(() {});
              }
            }
          },
          child: Container(
            color: Swatches.primary,
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: const Center(
                child: Text(
              Constants.nextStep,
              style: TextStyle(fontSize: 18, color: Swatches.white),
            )),
          ),
        )
      ]),
    );
  }
}
