abstract class Failure {}

class ServerFailure extends Failure {}

class GeneralaFailure extends Failure {}

class CacheFailure extends Failure {}

// constant failures

const String kGenaralfailure = 'sorry something went wrong';
const String kCachefailure = 'something wrong with the cache';
const String kServerfailure = 'server error';
