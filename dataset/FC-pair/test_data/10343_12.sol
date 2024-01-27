contract c10343{
    /**
     * @dev Transfer specified amount of tokens to the specified list of addresses
     * @param _to The array of addresses that will receive tokens
     * @param _amount The array of uint values indicates how much tokens will receive corresponding address
     * @return True if all transfers were completed successfully
    */
    function transferTokens(address[] _to, uint256[] _amount) isOwnerOrAdditionalOwner public returns (bool) {
        require(_to.length == _amount.length);
        for (uint i = 0; i < _to.length; i++) {
            transfer(_to[i], _amount[i]);
        }
        return true;
    }
}