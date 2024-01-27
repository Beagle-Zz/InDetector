contract c3030{
    /**
    * @dev check if certified partner can create new building in factory
    * @param _cp Wallet address of certified partner
    * @param _factory Factory address
    * @return True if certified partner can create buildings, false instead
    **/
    function canCPCreateInFactory(address _cp, address _factory) constant public returns (bool) {
        return CPs[_cp].factories[_factory];
    }
}