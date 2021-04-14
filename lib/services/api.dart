enum Endpoint{
  StreetArt,
  WildLife,
  Nature,
  City,
  Motivation,
  Bikes,
  Cars,
  Curated
}

class API{
  final String apiKey="563492ad6f91700001000001bb9826f8b8b24c55a20719625582f84d";
  static final String photosHost="api.pexels.com";
  static final String videosHost="www.pexels.com/videos";
  final String numberOfPages="per_page=20";

  Uri curatedPhotosUri()=>Uri(
    scheme: 'https',
    host: photosHost,
    path: "v1/curated?per_page=15"
//    path:"/v1/${_paths[Endpoint.Curated]}?$numberOfPages",
//    queryParameters:numberOfPages,
  );

  Uri endPointUri(Endpoint endpoint)=>Uri(
    scheme: 'https',
    host: photosHost,
    path:"${_paths[endpoint]}&$numberOfPages"
  );

  Uri endPointSearchUri(String search)=>Uri(
      scheme: 'https',
      host: photosHost,
      path:'/search',
      query:"query=$search&$numberOfPages"
  );

  static Map<Endpoint,String> _paths={
    Endpoint.Bikes:'Bikes',
    Endpoint.Cars:'Cars',
    Endpoint.City:'City',
    Endpoint.Motivation:'Motivation',
    Endpoint.Nature:'Nature',
    Endpoint.StreetArt:'StreetArt',
    Endpoint.WildLife:'WildLife',
    Endpoint.Curated:'curated'
  };
}