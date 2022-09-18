class Note {
  final int? id;
  final String title;
  final String sellingPrice;
  final String costPrice;
  final String location;
  final String description;

  const Note({
    required this.title,
    required this.sellingPrice,
    this.id,
    required this.costPrice,
    required this.location,
    required this.description,
  });

  factory Note.fromJson(Map<String, dynamic> json) => Note(
      id: json['id'],
      title: json['title'],
      sellingPrice: json['sellingPrice'],
      costPrice: json['costPrice'],
      location: json['location'],
      description: json['description']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'sellingPrice': sellingPrice,
        'costPrice': costPrice,
        'location': location,
        'description': description,
      };
}
