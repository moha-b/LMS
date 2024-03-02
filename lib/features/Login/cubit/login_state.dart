abstract class LoginStates {}

class Unauthenticated extends LoginStates {}

class Authenticated extends LoginStates {}

class AuthenticationFailed extends LoginStates {}
