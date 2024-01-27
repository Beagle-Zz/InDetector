contract c18411{
    /**
     * Until all tokens are sold, tokens can be transfered to/from owner's accounts.
     */
    function transfer(address _to, uint256 _value) ifUnlocked(msg.sender) public returns (bool) {
        return super.transfer(_to, _value);
    }
}