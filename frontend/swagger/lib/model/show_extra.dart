part of swagger.api;

class ShowExtra {
  /* Url affiliated with this podcast */
  String url1 = null;
/* Url affiliated with this podcast */
  String url2 = null;
/* Url affiliated with this podcast */
  String url3 = null;
/* Google Podcasts url for this podcast */
  String googleUrl = null;
/* Spotify url for this podcast */
  String spotifyUrl = null;
/* YouTube url affiliated with this podcast */
  String youtubeUrl = null;
/* LinkedIn url affiliated with this podcast */
  String linkedinUrl = null;
/* WeChat username affiliated with this podcast */
  String wechatHandle = null;
/* Patreon username affiliated with this podcast */
  String patreonHandle = null;
/* Twitter username affiliated with this podcast */
  String twitterHandle = null;
/* Facebook username affiliated with this podcast */
  String facebookHandle = null;
/* Instagram username affiliated with this podcast */
  String instagramHandle = null;

  ShowExtra();

  @override
  String toString() {
    return 'ShowExtra[url1=$url1, url2=$url2, url3=$url3, googleUrl=$googleUrl, spotifyUrl=$spotifyUrl, youtubeUrl=$youtubeUrl, linkedinUrl=$linkedinUrl, wechatHandle=$wechatHandle, patreonHandle=$patreonHandle, twitterHandle=$twitterHandle, facebookHandle=$facebookHandle, instagramHandle=$instagramHandle, ]';
  }

  ShowExtra.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
    googleUrl = json['google_url'];
    spotifyUrl = json['spotify_url'];
    youtubeUrl = json['youtube_url'];
    linkedinUrl = json['linkedin_url'];
    wechatHandle = json['wechat_handle'];
    patreonHandle = json['patreon_handle'];
    twitterHandle = json['twitter_handle'];
    facebookHandle = json['facebook_handle'];
    instagramHandle = json['instagram_handle'];
  }

  Map<String, dynamic> toJson() {
    return {
      'url1': url1,
      'url2': url2,
      'url3': url3,
      'google_url': googleUrl,
      'spotify_url': spotifyUrl,
      'youtube_url': youtubeUrl,
      'linkedin_url': linkedinUrl,
      'wechat_handle': wechatHandle,
      'patreon_handle': patreonHandle,
      'twitter_handle': twitterHandle,
      'facebook_handle': facebookHandle,
      'instagram_handle': instagramHandle
     };
  }

  static List<ShowExtra> listFromJson(List<dynamic> json) {
    return json == null ? new List<ShowExtra>() : json.map((value) => new ShowExtra.fromJson(value)).toList();
  }

  static Map<String, ShowExtra> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, ShowExtra>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new ShowExtra.fromJson(value));
    }
    return map;
  }
}
