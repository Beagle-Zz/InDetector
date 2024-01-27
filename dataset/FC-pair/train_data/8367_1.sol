contract c8367{
  /// Function modifier to check resolver's locking status.
  modifier unless_resolver_is_locked() {
    require(is_locked() == false);
    _;
  }
}