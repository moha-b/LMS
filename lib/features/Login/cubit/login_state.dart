abstract class LoginStates {}

class LoadingState extends LoginStates {}

class Unauthenticated extends LoginStates {}

class Authenticated extends LoginStates {}

class AuthenticationFailed extends LoginStates {}
