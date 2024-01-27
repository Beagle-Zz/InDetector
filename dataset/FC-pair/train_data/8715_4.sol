contract c8715{
    /**
    * Get the token balance for account
    *
    * Get token balance of `_owner` account
    *
    * @param _owner The address of the owner
    */
    function balanceOf(address _owner)
    external view
    returns(uint256 balance) {
        return _balanceOf[_owner];
    }
}