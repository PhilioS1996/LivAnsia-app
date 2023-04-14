import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:livansia_app/pages/questions/widget/pickText.dart';
import 'package:livansia_app/providers/questions_provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../helpers/imports.dart';

class SliderWidget extends StatefulWidget {
  final int index;
  const SliderWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  List<String> rangeT = [
    'Δεν έχει επιλεχθεί',
    'Καθόλου',
    'Σχετικά',
    'Αρκετά',
    'Πάρα Πολύ'
  ];
  int _value = 1;
  int countText = 0;
  @override
  Widget build(BuildContext context) {
    final questionsProvider =
        Provider.of<QuestionsProvider>(context, listen: true);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Theme.of(context).selectedRowColor,
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              min: 1,
              max: 4,
              divisions: 3,
              activeColor: Colors.teal[100],
              inactiveColor: Colors.blueGrey[600],
              value: _value.toDouble(),
              //label: _value.toInt().toString(),
              onChangeStart: (double nVal) {
                print('to nval start einai ${nVal.toInt()}');
                setState(() {
                  countText = nVal.toInt();
                });
                // PickT(
                //   word: rangeT[countText],
                // );
              },
              onChanged: (value) {
                setState(() {
                  _value = value.toInt();
                  countText = _value;
                });
                questionsProvider.setValuePickedSlider(
                    value.toInt(), widget.index);
              },
            ),

            //Level(),
            Center(
              child: PickedText(
                word: rangeT[countText],
              ),
            ),
            //SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
 // SfSlider(
            //   min: 0,
            //   max: 4,
            //   // showTicks: true,
            //   showLabels: true,
            //   showDividers: true,
            //   labelPlacement: LabelPlacement.betweenTicks,
            //   stepSize: 1,
            //   value: _value,
            //   labelFormatterCallback: (_value, String formattedText) {
            //     switch (_value) {
            //       case 0:
            //         return rangeT[_value];
            //       case 1:
            //         return rangeT[_value];
            //       case 2:
            //         return rangeT[_value];
            //       case 3:
            //         return rangeT[_value];
            //       case 4:
            //         return rangeT[_value];
            //     }
            //     return _value.toString();
            //     // return rangeT[actualValue.toInt()];
            //   },
            //   onChanged: (value) {
            //     setState(() {
            //       _value = value.toInt();
            //     });
            //     questionsProvider.setValuePickedSlider(
            //         value.toInt(), widget.index);
            //   },
            // ),
            // Sf(
            //   min: 1,
            //   max: 4,

            // child: Slider.adaptive(
            //   value: (_categoryValue ?? 1).toDouble(),
            //   min: 1,
            //   max: 4,
            //   divisions: 3,
            //   activeColor: Colors.teal[100],
            //   inactiveColor: Colors.blueGrey[600],
            //   label: _categoryValue.toInt().toString(),
            //   onChangeStart: (double nVal) {
            //     print('to nval start einai ${nVal.toInt()}');

            //     countText = nVal.toInt();
            //     PickT(
            //       word: rangeT[countText],
            //     );
            //   },
            //   onChanged: (newValue) {
            //     setState(
            //       () {
            //         _categoryValue = newValue.round();
            //         countText = _categoryValue;
            //         print('to category value $_categoryValue');
            //         // calculate(index, userData, newValue.toInt(), user);
            //       },
            //     );
            //   },
            //   onChangeEnd: (double newValue) {
            //     print('Ended change on $newValue');
            //     keepTheVal(newValue.toInt(), userData, user, index);
            //   },
            // ),
            //),