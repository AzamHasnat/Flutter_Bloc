// we don't need use this class by creating its instance,thats why we use abstract class
abstract class InternetEvent {}

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
