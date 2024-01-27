contract c2281{
    /**
    *@dev creates a new factory by cloning the factory specified in setFactory.
    *@return _new_fac which is the new factory address
    */
    function deployFactory() public onlyOwner() returns(address){
        address _new_fac = createClone(factory);
        factory_index[_new_fac] = factory_contracts.length;
        factory_contracts.push(_new_fac);
        Factory(_new_fac).init(msg.sender);
        emit NewFactory(_new_fac);
        return _new_fac;
    }
}