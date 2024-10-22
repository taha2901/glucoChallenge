
class AddMedicineRequestBody {
  String? name;
  String? dosage;
  String? times;
  String? time;

  AddMedicineRequestBody({this.name, this.time, this.times, this.dosage});

  Map<String, dynamic> toJson() => {
        'name': name,
        'time': time,
        'times': times,
        'dosage': dosage,
      };
}
