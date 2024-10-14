part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + '/login';

    var response = await client.post(Uri.parse(url),
        headers: ApiServices.headersPost(),
        body: jsonEncode(
          <String, String>{
            'email': email,
            'password': password,
          },
        ));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Login Failed, Please Try Again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);
    // await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: value);
    // login berhasil
    // return ApiReturnValue(value: mockUser);

    //   login gagal
    // return ApiReturnValue(message: "Email Atau Password Salah");
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    if (client == null) {
      client == http.Client();
    }

    String url = baseUrl + '/register';

    var response = await http.post(Uri.parse(url),
        headers: ApiServices.headersPost(),
        body: jsonEncode(
          <String, String>{
            'name': user.name!,
            'email': user.email!,
            'password': password,
            'password_confirmation': password,
            'address': user.address!,
            'city': user.city!,
            'houseNumber': user.houseNumber!,
            'phoneNumber': user.phoneNumber!,
          },
        ));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Register Failed, Please Try Again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadPicturePath(pictureFile);

      if (result.value != null) {
        value = value.copyWith(
            picturePath: "https://food.rtid73.com/storage/${result.value}");
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadPicturePath(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseUrl + '/user/photo';

    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers['Content-Type'] = 'application/json'
        ..headers['Authorization'] = 'Bearer ${User.token}';
    }

    var multiPartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);

    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();

      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Upload Picture failed, Please Try Again');
    }
  }

  static Future<ApiReturnValue<bool>> logout({http.Client? client}) async {
    client ??= http.Client();

    String url = baseUrl + '/logout';
    print("URL Logout : $url");

    var response =
        await client.post(Uri.parse(url), headers: ApiServices.headersPost());

    print("Response Logout ${response.body}");

    if(response.statusCode != 200) {
      return ApiReturnValue(message: 'Logout Failed');
    }

    return ApiReturnValue(value: true);
  }
}
