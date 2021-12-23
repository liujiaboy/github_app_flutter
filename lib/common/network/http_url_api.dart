import 'github_config.dart';

class HttpUrlApi {

  // oauth
  static getOAuthUrl() {
    return "https://github.com/login/oauth/authorize?client_id"
        "=${GithubConfig.clientId}&state=app&"
        "redirect_uri=gsygithubapp://authed";
  }
}