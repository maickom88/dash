import 'package:auto_size_text/auto_size_text.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';

class DialogReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(Layout.defaultPadding),
        constraints: BoxConstraints(
          maxWidth: 1100,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF212332),
          borderRadius: BorderRadius.circular(Layout.defaultBorderRadius),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  color: Colors.transparent,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
              withSpaceHeight(),
              AutoSizeText(
                "Gere seu relatório",
                textAlign: TextAlign.center,
                maxFontSize: 100,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(color: Colors.white, fontSize: 20),
              ),
              AutoSizeText(
                "Selecione os campos abaixos",
                textAlign: TextAlign.center,
                maxFontSize: 100,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20),
              ),
              withSpaceHeight(),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  style: Theme.of(context).textTheme.headline1,
                ),
                suggestionsCallback: (pattern) async {
                  return ["Pronto Socorro", "Fatima", "Energia normal"]
                      .map((e) => e);
                },
                itemBuilder: (context, String suggestion) {
                  return ListTile(
                    leading: Icon(Icons.flash_on_rounded),
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {},
              ),
              withSpaceHeight(),
              AutoSizeText(
                "Selecione o período:",
                textAlign: TextAlign.center,
                maxFontSize: 100,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20),
              ),
              withSpaceHeight(),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(
                  Icons.event,
                  color: Colors.white,
                ),
                selectableDayPredicate: (date) {
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              Text(
                "-",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(
                  Icons.event,
                  color: Colors.white,
                ),
                selectableDayPredicate: (date) {
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              withSpaceHeight(),
              AutoSizeText(
                "Deseja gerar eventos ou em graficos?",
                textAlign: TextAlign.center,
                maxFontSize: 100,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20),
              ),
              withSpaceHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Eventos",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                  Switch(value: false, onChanged: (value) {}),
                  Text(
                    "Graficos",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
              withSpaceHeight(),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                ),
                onPressed: () async {
                  // final file = await PDF.generatePDF();
                  // try {
                  //   await PDF.openFile(file);
                  // } catch (e) {
                  //   final blob = html.Blob([file], 'application/pdf');
                  //   final url = html.Url.createObjectUrlFromBlob(blob);
                  //   html.window.open(url, "_blank");
                  //   html.Url.revokeObjectUrl(url);
                  // }
                },
                child: Text(
                  "Gerar relatório",
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
