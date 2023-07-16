class Repository {
  final int id;
  final String name;
  final String description;
  final int stars;
  final String url;

  const Repository(
      {required this.id,
      required this.name,
      required this.description,
      required this.stars,
      required this.url});

  //Factory  transformar um json no obj Repository
  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
        id: json['id'],
        name: json['title'],
        description: json['description'],
        stars: json['stargazers_count'],
        url: json['html_url']);
  }
}
