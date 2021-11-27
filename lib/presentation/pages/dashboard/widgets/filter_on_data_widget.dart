import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterOnDataWidget extends StatefulWidget {
  final Function(DateFilter) onFilter;
  const FilterOnDataWidget({
    Key? key,
    required this.onFilter,
  }) : super(key: key);
  @override
  _FilterOnDataWidgetState createState() => _FilterOnDataWidgetState();
}

class _FilterOnDataWidgetState extends State<FilterOnDataWidget> {
  late TextEditingController startDate;
  late TextEditingController endDate;

  @override
  void initState() {
    startDate = TextEditingController();
    endDate = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(15),
        color: Color(0xFF212332),
        width: double.infinity,
        height: 230,
        child: Column(
          children: [
            DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'yyyy/MM/dd',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(
                Icons.event,
                color: Colors.white,
              ),
              selectableDayPredicate: (date) {
                return true;
              },
              onChanged: (val) => startDate.text = val,
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => startDate.text = val!,
            ),
            Text(
              "-",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'yyyy/MM/dd',
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(
                Icons.event,
                color: Colors.white,
              ),
              selectableDayPredicate: (date) {
                return true;
              },
              onChanged: (val) => endDate.text = val,
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => endDate.text = val!,
            ),
            SizedBox(height: 15),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
              ),
              onPressed: () async {
                if (startDate.text.isEmpty || endDate.text.isEmpty) {
                  Get.snackbar(
                    "Ops, houve um error",
                    'Verifique todos os campos!',
                    colorText: Colors.white,
                    backgroundColor: Colors.red[800],
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  widget.onFilter(DateFilter(
                      endTime: endDate.text, startTime: startDate.text));
                  Get.back();
                }
              },
              child: Text(
                "Confirmar",
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DateFilter {
  final String startTime;
  final String endTime;
  DateFilter({
    required this.startTime,
    required this.endTime,
  });
}
