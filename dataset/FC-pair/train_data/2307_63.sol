contract c2307{
    /** @dev Setter for minActivatedToken.
     *  @param _minActivatedToken Minimum of tokens to be activated (in basic units).
     */
    function setMinActivatedToken(uint _minActivatedToken) public onlyGovernor {
        minActivatedToken = _minActivatedToken;
    }
}