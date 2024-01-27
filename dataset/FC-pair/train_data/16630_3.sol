contract c16630{
    /**
    * @dev Gets the unlocked time of the specified address.
    * @param _holder The address to query the the balance of.
    * @return An uint256 representing the Locktime owned by the passed address.
    */   
    function unlockTimeOf(address _holder) public view returns (uint256 lockTime) {
        return _lockupExpireTime[_holder];
    }
}