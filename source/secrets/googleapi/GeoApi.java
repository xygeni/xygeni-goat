class X {
  private static final String API_KEY = "AIzaSyBJiQZyvPNERRKwuk49hhsqqezvqvt9a4m";
  public void test() {
    GeoApiContext context = new GeoApiContext.Builder()
      .apiKey(API_KEY)
      .build();

    GeocodingResult[] results = GeocodingApi.geocode(context,
      "1600 Amphitheatre Parkway Mountain View, CA 94043").await();
    Gson gson = new GsonBuilder().setPrettyPrinting().create();
    System.out.println(gson.toJson(results[0].addressComponents));

    // Invoke .shutdown() after your application is done making requests
    context.shutdown();
  }
}