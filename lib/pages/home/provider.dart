import 'package:bind_test/model/brend_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  DateTime selectedDate = DateTime.now();

  //HomeProvider(this.brend);

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.


  List<String> currencyList = [
    " \$USD",
    " R RUB ",
    " F GBP ",
  ];

  String title = "\$USD";

  bool isClicked = false;

  changeTitle(){
    title = currencyList.first;
    notifyListeners();
  }

  changeTitle2(){
    title = currencyList[1];
    notifyListeners();
  }

  changeTitle3(){
    title = currencyList.last;
    notifyListeners();
  }



  hideCurrency(){
     isClicked = !isClicked;
    notifyListeners();
  }



  buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      // selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select date',
      cancelText: 'Cancel',
      confirmText: 'OK',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        notifyListeners();
    }
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate) {
                    selectedDate = picked;
                    notifyListeners();
                }
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

}
