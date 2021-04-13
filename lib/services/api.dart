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
  API({required this.apiKey});
  final String apiKey;
  static final String photosHost="www.pexels.com/v1";
  static final String videosHost="www.pexels.com/videos";
  final String numberOfPages="per_page=20";

  Uri curatedPhotosUri()=>Uri(
    scheme: 'https',
    host: photosHost,
    path:_paths[Endpoint.Curated],
    query:numberOfPages,
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