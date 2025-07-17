/// Live URL
// const String baseUrl = 'https://transport.netizens.dev/api/v1';

/// Local URL
// library;
// const String baseUrl = 'http://192.168.1.33:8000/api';
// const String baseUrl = 'http://192.168.1.40:8000/api/v1';

/// Live URL
const String baseUrl = 'https://fleeto.netizens.dev/api/v1';

const String tncUrl =
    'https://fleetotruck.com/terms-of-services.html';
const String privacyPolicyUrl =
    'https://www.termsfeed.com/privacy-policy/5f5b5b9f6b77f9b7c6d5e6b8';

const String signInUrl = '$baseUrl/auth/sendotp';
const String verifyOtpUrl = '$baseUrl/auth/verifyotp';
const String upcomingTripUrl = '$baseUrl/driver/trip/upcoming-trip';
const String tripDetailsUrl = '$baseUrl/driver/trip/trip-details/{tripId}';
const String tripStatusUrl = '$baseUrl/driver/trip/trip-status';
const String activeTripUrl = '$baseUrl/driver/trip/active-trip';
const String homeStatstUrl = '$baseUrl/driver/home';
const String uploadDocumentUrl = '$baseUrl/driver/trip/upload-document';
const String deleteDocumentUrl = '$baseUrl/driver/trip/delete-document';
const String tripActionUrl = '$baseUrl/driver/trip/trip-action';
const String deleteAccountUrl = '$baseUrl/delete-account';
const String getDriverProfileDetailsUrl =
    '$baseUrl/driver/account/get-driver-profile-details';
const String updateDriverProfileDetailsUrl =
    '$baseUrl/driver/account/update-driver-profile-details';

// const String helpAndSupportListUrl =
//     'https://mocki.io/v1/48bd4861-f276-44db-a97c-f1909de06cee';
const String notificationListUrl = '$baseUrl/transporter/notification?page={pageNo}';

const String updateCoordinatesUrl = '$baseUrl/driver/trip/update-cordinates';

const String helpAndSupportListUrl =
    '$baseUrl/driver/account/faq/list/{pageNo}';