class ApiUtils {
  static final BASE_URL = "http://where.r-y-x.com/api/";
  static final CATEGORIES_URL = BASE_URL + "v1/venue-category/all-parent";
  static final LOGIN_URL = BASE_URL + "v1/member/login";
  static final LOGOUT_URL = BASE_URL + "v1/member/logout";
  static final TOP_PICKS_VENUE_URL = BASE_URL + "v1/venue/top-picks-list?VenueCategoryId=";
  static final TRENDING_VENUE_URL = BASE_URL + "v1/venue/trending-list?VenueCategoryId=";
  static final RECENTLY_ADDED_VENUE_URL = BASE_URL + "v1/venue/recently-added-list?VenueCategoryId=";
  static final TOP_PICKS_URL = BASE_URL + "v1/venue/top-picks-all-list";
  static final TRENDING_URL = BASE_URL + "v1/venue/trending-all-list";
  static final RECENTLY_ADDED_URL = BASE_URL + "v1/venue/recently-all-added-list";
  static final NEAR_BY_VENUE_URL = BASE_URL + "v1/venue/nearby-list?";
  static final FORGET_PASSWORD_URL = BASE_URL + "v1/member/change-password-request?EmailOrPhone=";
  static final OTP_URL = BASE_URL + "v1/member/change-password-validet-otp?";
  static final UPDATE_PASSWORD_URL = BASE_URL + "v1/member/update-password";
  static final ALL_CITY_NAME_URL = BASE_URL + "v1/city/all-list";
  static final MEMBER_PROFILE_CREATE_URL = BASE_URL + "v1/member/profile-create";
  static final MEMBER_PROFILE_PICTURE_UPLOAD_URL = BASE_URL + "v1/member/profile-picture";
  static final MEMBER_STORY_URL = BASE_URL + "v1/story/member-group?MemberId=";
  static final MEMBER_INFO_URL = BASE_URL + "v1/member/get-profile-info?memberId=";
  static final BOOKING_TABLE_DETAIL_URL = BASE_URL + "v1/venue/details?VenueId=";

}
