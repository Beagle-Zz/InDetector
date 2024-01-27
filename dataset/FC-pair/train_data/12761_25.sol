contract c12761{
    /**
    * @dev Returns coinage for the caller address
    *
    * @param _address address The address for which coinage will be calculated
    */
    function coinAgeForAddress(address _address) public view onlyOwner returns (uint256) {
        return getCoinAgeInternal(_address, now);                                                           // solium-disable-line
    }
}