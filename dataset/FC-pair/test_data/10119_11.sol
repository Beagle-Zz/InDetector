contract c10119{
    /**
     * Until all tokens are sold, tokens can be transfered to/from owner's accounts.
     */
    function transferFrom(address _from, address _to, uint256 _value) ifUnlocked(_from) public returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}