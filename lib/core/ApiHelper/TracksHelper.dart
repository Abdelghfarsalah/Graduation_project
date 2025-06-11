class Trackshelper {
  // static String baseurl = "https://smart-path-xi.vercel.app/api/v1";
  static String baseurl = "http://164.128.130.9:2530/api/v1";

  static String GetAllTracks = "$baseurl/track?limit=30";
  static String searchTracks = "$baseurl/track?limit=30&search=";
  static searchTracksMethod(String name) {
    return searchTracks + name;
  }

  static String getytrackById = "$baseurl/track/";
  static getytrackByIdMethod(String id) {
    return getytrackById + id;
  }
}
