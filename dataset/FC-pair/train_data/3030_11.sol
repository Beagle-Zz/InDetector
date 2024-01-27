contract c3030{
    /**
    * @dev add allowance to create buildings in country to certified partner
    * @param _cp Wallet address of certified partner
    * @param _factory Factory address
    **/
    function addFactoryToCP(address _cp, address _factory) public onlyOwner {
        CP storage cp = CPs[_cp];
        cp.factories[_factory] = true;
    }
}