import 'package:flutter/material.dart';
import 'models.dart';

class InputDataAnakPage extends StatefulWidget {
  final List<Anak> anakList;

  const InputDataAnakPage({super.key, required this.anakList});

  @override
  _InputDataAnakPageState createState() => _InputDataAnakPageState();
}

class _InputDataAnakPageState extends State<InputDataAnakPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaLengkapController = TextEditingController();
  final _alamatController = TextEditingController();
  final _nomorTeleponController = TextEditingController();
  final _namaOrtuController = TextEditingController();
  String _selectedGender = 'Laki-laki';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data Anak"),
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, widget.anakList);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionHeader("Detail Informasi Anak"),
              _buildTextField(_namaLengkapController, "Nama lengkap *", Icons.child_care_outlined),
              const SizedBox(height: 10),
              _buildDatePicker(context, "Tanggal lahir", Icons.calendar_month_outlined),
              const SizedBox(height: 10),
              _buildDropdown("Jenis kelamin", Icons.transgender),
              const SizedBox(height: 10),
              _buildTextField(_alamatController, "Alamat rumah *", Icons.home),
              const SizedBox(height: 20),
              _buildTextField(_namaOrtuController, "Nama wali *", Icons.person),
              const SizedBox(height: 20),
              _buildTextField(_nomorTeleponController, "Nomor telepon darurat *", Icons.contact_phone_outlined),
              const SizedBox(height: 20),
              _sectionHeader("Jadwal Kedatangan"),
              _buildTimePicker(context, "Jadwal kedatangan anak", Icons.schedule),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final anak = Anak(
                      nama: _namaLengkapController.text,
                      tanggalLahir: _selectedDate,
                      jenisKelamin: _selectedGender,
                      alamat: _alamatController.text,
                      namaWali: _namaOrtuController.text,
                      nomorTelepon: _nomorTeleponController.text,
                      jadwalKedatangan: _selectedTime,
                    );
                    setState(() {
                      widget.anakList.add(anak);
                    });
                    Navigator.pop(context, widget.anakList);
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.lightGreen,
                ),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
          ),
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icon),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $hint';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, String hint, IconData icon) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: () => _selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
            ),
            fillColor: Colors.white.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(icon),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${_selectedDate.toLocal()}".split(' ')[0]),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimePicker(BuildContext context, String hint, IconData icon) {
    return SizedBox(
      height: 56,
      child: InkWell(
        onTap: () => _selectTime(context),
        child: InputDecorator(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
            ),
            fillColor: Colors.white.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(icon),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_selectedTime.format(context)),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint, IconData icon) {
    return SizedBox(
      height: 56,
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.lightGreen, width: 2.0),
          ),
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(icon),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: _selectedGender,
            isExpanded: true,
            onChanged: (String? newValue) {
              setState(() {
                _selectedGender = newValue!;
              });
            },
            items: <String>['Laki-laki', 'Perempuan']
                .map<DropdownMenuItem<String>>((String value) {
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
}