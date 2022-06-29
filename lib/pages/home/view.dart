import 'package:bind_test/model/brend_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_widget.dart';
import 'provider.dart';

class HomePage extends StatelessWidget {
  // final BrendModel brend;

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider(),
      builder: (context, child) => _buildPage(context),
    );
  }

  Widget _buildPage(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    _selectDate(BuildContext context) {
      final ThemeData theme = Theme.of(context);
      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return provider.buildMaterialDatePicker(context);
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return provider.buildCupertinoDatePicker(context);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.arrow_left),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Log Out '),
                  content: const Text('Do yo wanna Log Out'),
                  actions: <Widget>[

                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Log Out'),
                      child: const Text('Log Out'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("asset/flags/us.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(80)),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 150,
              ),
              Center(
                child: Text(
                  "${provider.title} Account",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: Colors.white)),
                child: MaterialButton(
                  onPressed: () => provider.hideCurrency(),
                  child: const Text(
                    "Hide",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 1,
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: provider.isClicked
                ? const SizedBox.shrink()
                : const Text(
                    // BrendModel.brend[index].price!,
                    "\$ 180.970.83",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0E0E10),
            ),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Transaction History",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Transaction
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5, color: Colors.white)),
                  child: ExpansionTile(
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: <Widget>[
                      ListTile(
                          title: Text(
                            provider.currencyList.first,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () => provider.changeTitle()),
                      ListTile(
                          title: Text(
                            provider.currencyList[1],
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () => provider.changeTitle2()),
                      ListTile(
                          title: Text(
                            provider.currencyList.last,
                            style: const TextStyle(color: Colors.white),
                          ),
                          onTap: () => provider.changeTitle3()),
                    ],
                    // trailing: IconButton(onPressed: (){},icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),),
                    title: Text(
                      provider.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 0.5, color: Colors.white)),
                        child: const ExpansionTile(
                          iconColor: Colors.white,
                          collapsedIconColor: Colors.white,
                          children: <Widget>[
                            ListTile(
                                title: Text(
                              'This is tile number 1',
                              style: TextStyle(color: Colors.white),
                            )),
                            ListTile(
                                title: Text(
                              'This is tile number 2',
                              style: TextStyle(color: Colors.white),
                            )),
                            ListTile(
                                title: Text(
                              'This is tile number 3',
                              style: TextStyle(color: Colors.white),
                            )),
                          ],
                          // trailing: IconButton(onPressed: (){},icon: Icon(Icons.keyboard_arrow_down_rounded,color: Colors.white,),),
                          title: Text(
                            "All",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 0.5, color: Colors.white)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: IconButton(
                            onPressed: () => _selectDate(context),
                            icon: const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 40,
            child: const Center(
                child: Text(
              "Yesterday",
              style: TextStyle(fontSize: 20),
            )),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: BrendModel.brend.length,
            itemBuilder: (context, index) => BuildListTile(
              brend: BrendModel.brend[index],
            ),
          ),
        ],
      ),
    );
  }
}
