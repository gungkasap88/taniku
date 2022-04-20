import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CobaScreen extends StatefulWidget {
  const CobaScreen({Key? key}) : super(key: key);

  @override
  _CobaScreenState createState() => _CobaScreenState();
}

class _CobaScreenState extends State<CobaScreen> {
  late String _setTime, _setDate;
  late String _hour, _minute, _time;
  late String dateTime;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 00, minute: 00);
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        _dateController.text = selectedDate.toString();
        // _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        // _timeController.text = formatDate(
        //     DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
        //     [hh, ':', nn, " ", am]).toString();
      });
    }
  }

  @override
  void initState() {
    // _dateController.text = DateFormat.yMd().format(DateTime.now());

    // _timeController.text = formatDate(
    //     DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
    //     [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Date time picker'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            // note: Date
            const Text(
              'Choose Date',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextFormField(
                  style: const TextStyle(fontSize: 12),
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  onSaved: (String? val) {
                    _setDate = val.toString();
                  },
                  decoration: const InputDecoration(
                      disabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
            ),
            const SizedBox(height: 16,),

            // note: Time
            const Text(
              'Choose Time',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: TextFormField(
                  style: const TextStyle(fontSize: 12),
                  onSaved: (String? val) {
                    _setTime = val.toString();
                  },
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _timeController,
                  decoration: const InputDecoration(
                      disabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.all(8)),
                ),
              ),
            ),
            const SizedBox(height: 16,),

            // note: QR code
            ElevatedButton(
                onPressed: () {

                  showDialog(context: context,
                      builder: (BuildContext context){
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Container(
                              margin: const EdgeInsets.all(16),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                                        blurRadius: 10
                                    ),
                                  ]
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 8,),
                                  const Text("QR Code", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                                  const SizedBox(height: 12,),
                                  const Text("Silahkan lakukan Scan pada QR Code ini", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),),
                                  const SizedBox(height: 12,),
                                  QrImage(
                                    data: "RSV/20220413/000140",
                                    version: QrVersions.auto,
                                    size: 150,
                                  ),
                                  const SizedBox(height: 12,),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Tutup", style: TextStyle(fontSize: 12),)),
                                  ),
                                ],
                              )
                          ),
                        );
                      }
                  );

                },
                child: const Text("Show QR Code")
            ),

          ],
        ),
      ),
    );
  }
}
