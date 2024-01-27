contract c16842{
    /**
     * @dev Create refund crowdsale
     * @param _address Fabric address
     */
    function addContract(
        address _address,
        address _owner,
        string _contractType
    )
    public
    onlyFabric
    returns (bool)
    {
        contracts[_address].addr = _address;
        contracts[_address].owner = _owner;
        contracts[_address].fabric = msg.sender;
        contracts[_address].contractType = _contractType;
        contracts[_address].index = contractsAddr.push(_address) - 1;
        if (admins[_owner].addr != _owner) {
            admins[_owner].addr = _owner;
            admins[_owner].index = adminsAddr.push(_owner) - 1;
        }
        admins[_owner].contratcs.push(contracts[_address].addr);
        admins[_owner].numContratcs++;
        return true;
    }
}