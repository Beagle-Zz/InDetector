contract c2281{
    /**
    *@dev gets the factory address
    */
    function getFactoryAddress() external view returns(address){
        return drct.getFactoryAddress();
    }
}