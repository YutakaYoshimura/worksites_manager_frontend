class HttpStatusCode {
  // 情報
  static const httpContinue = 100;
  static const httpSwitchingProtocols = 101;
  static const httpProcessing = 102;
  static const httpEarlyHints = 103;
  
  // 成功
  static const httpOk = 200;
  static const httpCreated = 201;
  static const httpAccepted = 202;
  static const httpNonAuthoritativeInformation = 203;
  static const httpNoContent = 204;
  static const httpResetContent = 205;
  static const httpPartialContent = 206;
  static const httpMultiStatus = 207;

  // 転送
  static const httpMultipleChoices = 300;
  static const httpMovedPermanently = 301;
  static const httpFound = 302;
  static const httpSeeOther = 303;
  static const httpNotModified = 304;

  // クライアントエラー
  static const httpBadRequest = 400;
  static const httpUnauthorized = 401;
  static const httpPaymentRequired = 402;
  static const httpForbidden = 403;
  static const httpNotFound = 404;
  static const httpMethodNotAllowed = 405;
  static const httpNotAcceptable = 406;
  static const httpProxyAuthenticationRequired = 407;
  static const httpRequestTimeout = 408;
  static const httpConflict = 409;
  static const httpGone = 410;
  static const httpLengthRequired = 411;
  static const httpPreconditionFailed = 412;
  static const httpRequestEntityTooLarge = 413;
  static const httpRequestUriTooLong = 414;
  static const httpUnsupportedMediaType = 415;
  static const httpRequestedRangeNotSatisfiable = 416;
  static const httpExpectationFailed = 417;
  static const httpIAmATeapot = 418;
  static const httpUnprocessableEntity = 422;
  static const httpLocked = 423;
  static const httpTooEarly = 425;
  static const httpUpgradeRequired = 426;
  static const httpTooManyRequests = 429;
  static const httpRequestHeaderFieldsTooLarge = 431;

  // サーバーエラー
  static const httpInternalServerError = 500;
  static const httpNotImplemented = 501;
  static const httpBadGateway = 502;
  static const httpServiceUnavailable = 503;
  static const httpGatewayTimeout = 504;
  static const httpVersionNotSupported = 505;
  static const httpVariantAlsoNegotiatesExperimental = 506;
  static const httpInsufficientStorage = 507;
  static const httpLoopDetected = 508;
  static const httpNotExtended = 510;
  static const httpNetworkAuthenticationRequired = 511;
}