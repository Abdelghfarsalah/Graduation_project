class Courseshelper {
  static String baseurl = "http://164.128.130.9:2530/api/v1";

  static String getallcoursesApi = "$baseurl/courses?limit=3&page=1";
  //===================================================================
  static String searchforcourses = "$baseurl/courses?limit=20&page=1&search=";
  static String searchMethod({required String text}) {
    return searchforcourses + text;
  }

  //===================================================================\
  static String Enrollemnturl =
      "http://164.128.130.9:2530/api/v1/courses/enroll/";
  static String EnrollemnturlMethod({required String id}) {
    return Enrollemnturl + id;
  }

  //=======================================================================
  static String GetProgressCourses = "$baseurl/courses/";
  static String GetProgressCoursesMethod({required String id}) {
    return GetProgressCourses + id;
  }

  //======================
  static String markvideoAsWatched = "$baseurl/courses/mark-video-watched";
}
