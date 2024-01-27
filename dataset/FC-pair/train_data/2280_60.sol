contract c2280{
    /**
    *@dev Set factory address 
    *@param _factory_address is the factory address to clone?
    */
    function setFactory(address _factory_address) public {
        require (msg.sender == owner);
        factory_address = _factory_address;
        factory = Factory(factory_address);
    }
}