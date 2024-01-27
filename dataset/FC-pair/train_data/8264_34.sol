contract c8264{
    /**
    * @dev Transfer tokens from one address to another with pause feature for administrator.
    * @dev Only applies when the transfer is allowed by the owner.
    * @param _from address The address which you want to send tokens from
    * @param _to address The address which you want to transfer to
    * @param _value uint256 the amount of tokens to be transferred
    */
    function transferFrom(address _from, address _to, uint256 _value) public whenNotPausedOrAuthorized returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}