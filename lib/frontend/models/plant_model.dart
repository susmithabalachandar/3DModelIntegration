class Plant {
  final String name;
  final String type;
  final String description;
  final String botanicalName;
  final String imageUrl;
  final String audioUrl;
  final String videoUrl;

  Plant({
    required this.name,
    required this.type,
    required this.description,
    required this.botanicalName,
    required this.imageUrl,
    required this.audioUrl,
    required this.videoUrl,
  });

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      name: json['name'],
      type: json['type'],
      description: json['description'],
      botanicalName: json['botanical_name'],
      imageUrl: json['image_url'],
      audioUrl: json['audio_url'],
      videoUrl: json['video_url'],
    );
  }
}
