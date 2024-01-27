contract c10421{
    // public functions
    function freeze(address addr) auth public returns (bool) {
      require(true != _freezeList[addr]);
      _freezeList[addr] = true;
      emit Freezed(addr);
      return true;
    }
}