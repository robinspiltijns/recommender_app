part of swagger.api;

class PodcastExtraField {
  /* YouTube url affiliated with this podcast */
  String youtubeUrl = null;
/* Facebook username affiliated with this podcast */
  String facebookHandle = null;
/* Instagram username affiliated with this podcast */
  String instagramHandle = null;
/* Twitter username affiliated with this podcast */
  String twitterHandle = null;
/* WeChat username affiliated with this podcast */
  String wechatHandle = null;
/* Patreon username affiliated with this podcast */
  String patreonHandle = null;
/* Google Podcasts url for this podcast */
  String googleUrl = null;
/* LinkedIn url affiliated with this podcast */
  String linkedinUrl = null;
/* Spotify url for this podcast */
  String spotifyUrl = null;
/* Url affiliated with this podcast */
  String url1 = null;
/* Url affiliated with this podcast */
  String url2 = null;
/* Url affiliated with this podcast */
  String url3 = null;

  PodcastExtraField();

  @override
  String toString() {
    return 'PodcastExtraField[youtubeUrl=$youtubeUrl, facebookHandle=$facebookHandle, instagramHandle=$instagramHandle, twitterHandle=$twitterHandle, wechatHandle=$wechatHandle, patreonHandle=$patreonHandle, googleUrl=$googleUrl, linkedinUrl=$linkedinUrl, spotifyUrl=$spotifyUrl, url1=$url1, url2=$url2, url3=$url3, ]';
  }

  PodcastExtraField.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    youtubeUrl = json['youtube_url'];
    facebookHandle = json['facebook_handle'];
    instagramHandle = json['instagram_handle'];
    twitterHandle = json['twitter_handle'];
    wechatHandle = json['wechat_handle'];
    patreonHandle = json['patreon_handle'];
    googleUrl = json['google_url'];
    linkedinUrl = json['linkedin_url'];
    spotifyUrl = json['spotify_url'];
    url1 = json['url1'];
    url2 = json['url2'];
    url3 = json['url3'];
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_url': youtubeUrl,
      'facebook_handle': facebookHandle,
      'instagram_handle': instagramHandle,
      'twitter_handle': twitterHandle,
      'wechat_handle': wechatHandle,
      'patreon_handle': patreonHandle,
      'google_url': googleUrl,
      'linkedin_url': linkedinUrl,
      'spotify_url': spotifyUrl,
      'url1': url1,
      'url2': url2,
      'url3': url3
     };
  }

  static List<PodcastExtraField> listFromJson(List<dynamic> json) {
    return json == null ? new List<PodcastExtraField>() : json.map((value) => new PodcastExtraField.fromJson(value)).toList();
  }

  static Map<String, PodcastExtraField> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, PodcastExtraField>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new PodcastExtraField.fromJson(value));
    }
    return map;
  }
}
