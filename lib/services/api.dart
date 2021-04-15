import 'package:wallpaper_app/secerts/api_key.dart';

enum Endpoint{
  StreetArt,
  WildLife,
  Nature,
  City,
  Motivation,
  Bikes,
  Cars,
}
class API{
  final String apiKey=KapiKey;
  Uri _curatedUrl = Uri.parse("https://api.pexels.com/v1/curated?per_page=10");
  Uri _endPointUrl(dynamic endpoint) => Uri.parse("https://api.pexels.com/v1/search?query=${_paths[endpoint]}&per_page=15");
  Uri _searchUrl(dynamic search) => Uri.parse("https://api.pexels.com/v1/search?query=$search&per_page=15");

  Uri curatedPhotosUri()=>_curatedUrl;
  Uri endPointUri(Endpoint endpoint)=>_endPointUrl(endpoint);
  Uri searchUri(String search)=>_searchUrl(search);

   Map<Endpoint,String> _paths={
    Endpoint.Bikes:'Bikes',
    Endpoint.Cars:'Cars',
    Endpoint.City:'City',
    Endpoint.Motivation:'Motivation',
    Endpoint.Nature:'Nature',
    Endpoint.StreetArt:'StreetArt',
    Endpoint.WildLife:'WildLife',
  };
}