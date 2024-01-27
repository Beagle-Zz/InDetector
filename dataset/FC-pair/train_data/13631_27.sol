contract c13631{
    /**
    * @dev Returns coinage for the caller address
    *
    * @param _address address The address for which coinage will be calculated
    * @param _now timestamp The time for which the coinage will be calculated
    */
    function coinAgeForAddressAt(address _address, uint256 _now) public view onlyOwner returns (uint256) {
         return getCoinAgeInternal(_address, _now);
    }
}