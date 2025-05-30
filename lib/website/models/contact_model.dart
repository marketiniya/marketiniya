class ContactModel {
  ContactModel(
    this.name,
    this.telephone,
    this.firmName,
    this.email,
    this.question,
    this.date,
  );

  String name;
  String telephone;
  String firmName;
  String email;
  String question;
  String date;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'telephone': telephone,
      'firmName': firmName,
      'email': email,
      'question': question,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'ContactModel{name: $name, telephone: $telephone, firmName: $firmName, email: $email, question: $question, date: $date}';
  }
}
