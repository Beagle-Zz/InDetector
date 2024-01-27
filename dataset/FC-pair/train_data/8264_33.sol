contract c8264{
    /**
    * @dev Transfer token for a specified address with pause feature for administrator.
    * @dev Only applies when the transfer is allowed by the owner.
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public whenNotPausedOrAuthorized returns (bool) {
        return super.transfer(_to, _value);
    }
}