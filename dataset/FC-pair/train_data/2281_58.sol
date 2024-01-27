contract c2281{
    /**
    *@dev Returns the factory address for the specified index
    *@param _index for factory to look up in the factory_contracts array
    *@return factory address for the index specified
    */
    function getFactorybyIndex(uint _index) public constant returns(address){
        return factory_contracts[_index];
    }
}