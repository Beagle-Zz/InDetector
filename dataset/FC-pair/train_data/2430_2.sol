contract c2430{
    /**
    *@dev gets the factory address
    */
    function getFactoryAddress(TokenStorage storage self) external view returns(address){
        return self.factory_contract;
    }
}