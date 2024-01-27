contract c2429{
    /**
    *@dev gets the factory address
    */
    function getFactoryAddress() external view returns(address){
        return drct.getFactoryAddress();
    }
}