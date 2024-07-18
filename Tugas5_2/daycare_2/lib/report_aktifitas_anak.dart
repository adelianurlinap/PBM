import 'package:flutter/material.dart';
import 'models.dart';

class DailyReportPage extends StatefulWidget {
  final List<Anak> anakList;
  final Anak anak;

  const DailyReportPage({super.key, required this.anakList, required this.anak});

  @override
  _DailyReportPageState createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  final _formKey = GlobalKey<FormState>();

  final _bodyTemperatureController = TextEditingController();
  String _conditionController = 'Sehat';
  final _breakfastController = TextEditingController();
  final _snackController = TextEditingController();
  final _lunchController = TextEditingController();
  final _dinnerController = TextEditingController();
  //final _fluidsController = TextEditingController();
  final _startTimeRestController = TextEditingController();
  final _endTimeRestController = TextEditingController();
  final _bottleTimeController = TextEditingController();
  //final _bottleMlController = TextEditingController();
  String _bottleType = 'Asi';
  final _morningShowerController = TextEditingController();
  final _afternoonShowerController = TextEditingController();
  final _vitaminController = TextEditingController();
  final _notesController = TextEditingController();
  final _lunchTimeController = TextEditingController();
  final _dinnerTimeController = TextEditingController();
  final _sarapanTimeController = TextEditingController();
  final _snackTimeController = TextEditingController();
  List<String> _neededItems = [];

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Laporan Aktivitas Anak"),
        backgroundColor: Colors.lightGreen,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_bodyTemperatureController, "Suhu Tubuh", "Masukkan suhu tubuh"),
              _buildDropdown("Kondisi", Icons.health_and_safety, ['Sehat', 'Sakit'], (newValue) {
                setState(() {
                  _conditionController = newValue;
                });
              }, _conditionController),
              _sectionHeader("Makanan", Icons.restaurant_menu),
              _buildTextField(_breakfastController, "Sarapan", "Masukkan sarapan"),
              _buildTimePicker(context, "Waktu Sarapan", _sarapanTimeController),
              _buildTextField(_snackController, "Snack", "Masukkan snack"),
              _buildTimePicker(context, "Waktu Makan Snack", _snackTimeController),
              _buildTextField(_lunchController, "Makan Siang", "Masukkan makan siang"),
              _buildTimePicker(context, "Waktu Makan Siang", _lunchTimeController),
              _buildTextField(_dinnerController, "Makan Malam", "Masukkan makan malam"),
              _buildTimePicker(context, "Waktu Makan Malam", _dinnerTimeController),
              //_buildTextField(_fluidsController, "Cairan", "Masukkan cairan"),
              _sectionHeader("Istirahat", Icons.night_shelter),
              _buildTimePicker(context, "Mulai Istirahat", _startTimeRestController),
              _buildTimePicker(context, "Selesai Istirahat", _endTimeRestController),
              _sectionHeader("Susu", Icons.local_drink),
              _buildTimePicker(context, "Waktu Minum Susu", _bottleTimeController),
              //_buildTextField(_bottleMlController, "Jumlah (ml)", "Masukkan jumlah ml"),
              _buildDropdown("Tipe Susu", Icons.local_drink, ['Asi', 'Formula'], (newValue) {
                setState(() {
                  _bottleType = newValue;
                });
              }, _bottleType),
              _sectionHeader("Lainnya", Icons.local_hospital),
              _buildTimePicker(context, "Mandi Pagi", _morningShowerController),
              _buildTimePicker(context, "Mandi Siang", _afternoonShowerController),
              _buildTextField(_vitaminController, "Vitamin", "Masukkan vitamin"),
              _buildTextField(_notesController, "Catatan untuk Orang Tua", "Masukkan catatan"),
              const SizedBox(height: 20),
              const Text("Barang yang Dibutuhkan"),
              _buildCheckbox("Pampers", _neededItems),
              _buildCheckbox("Cream", _neededItems),
              _buildCheckbox("Baju", _neededItems),
              _buildCheckbox("Handuk", _neededItems),
              _buildCheckbox("Sabun & Sampo", _neededItems),
              _buildCheckbox("Susu", _neededItems),
              _buildCheckbox("Sikat & Pasta Gigi", _neededItems),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final report = DailyReport(
                      suhu: _bodyTemperatureController.text,
                      kondisi: _conditionController,
                      sarapan: _breakfastController.text,
                      snack: _snackController.text,
                      lunch: _lunchController.text,
                      dinner: _dinnerController.text,
                      mulaiIstirahat: _startTimeRestController.text,
                      selesaiIstirahat: _endTimeRestController.text,
                      //jumlahMl: _fluidsController.text,
                      tipeBotol: _bottleType,
                      waktuBotol: '',
                      mandiPagi: _morningShowerController.text,
                      mandiSiang: _afternoonShowerController.text,
                      vitamin: _vitaminController.text,
                      catatan: _notesController.text,
                      barangDibutuhkan: _neededItems,
                      waktuMakanSiang: _lunchTimeController.text,
                      waktuMakanMalam: _dinnerTimeController.text,
                      waktuSarapan: _sarapanTimeController.text,
                      waktuMakanSnack: _snackTimeController.text,
                    );

                    setState(() {
                      // Simpan laporan harian di data anak
                      widget.anak.dailyReports.add(report);
                    });

                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
          ),
          fillColor: Colors.lightGreen.withOpacity(0.1),
          filled: true,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDropdown(String hint, IconData icon, List<String> items, Function(String) onChanged, String selectedItem) {
    return SizedBox(
      height: 56,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
          ),
          fillColor: Colors.lightGreen.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icon),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedItem,
            isExpanded: true,
            onChanged: (String? newValue) {
              onChanged(newValue!);
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, String hint, TextEditingController controller) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: () => _selectTime(context, controller),
        child: InputDecorator(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
            ),
            fillColor: Colors.lightGreen.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.access_time),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.text.isEmpty ? hint : controller.text),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(String title, List<String> items) {
    return CheckboxListTile(
      title: Text(title),
      value: items.contains(title),
      onChanged: (bool? newValue) {
        setState(() {
          if (newValue!) {
            items.add(title);
          } else {
            items.remove(title);
          }
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  Widget _sectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.lightGreen),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
            ),
          ),
        ],
      ),
    );
  }
}