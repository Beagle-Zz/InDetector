contract c16077{
    /**
     * @dev Adds administrative role to address
     * @param _address The address that will get administrative privileges
     */
    function addOwner(address _address) public onlyOwner {
        owners[_address] = true;
        emit OwnerAdded(_address);
    }
}