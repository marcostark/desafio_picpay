
// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

class User {
    final int id;
    final String name;
    final String img;
    final String username;

    User({
        this.id,
        this.name,
        this.img,
        this.username,
    });

    User.fromJson(Map<String, dynamic> json) 
    : id = json["id"],
      name = json["name"],
      img = json["img"],
      username = json["username"];
    

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "img": img,
    //     "username": username,
    // };

    // bool operator ==(o) => o is User && o.id == id;

    // int get hashCode => id.hashCode^name.hashCode;   
    
}

class UserResponse {
  final List<User> results;
  final String error;

  UserResponse(this.results, this.error);

  UserResponse.fromJson(Map<String, dynamic> json)
      : results =
            (json[0] as List).map((i) => new User.fromJson(i)).toList(),
        error = "";

  UserResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}