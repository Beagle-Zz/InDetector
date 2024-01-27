contract c14747{
    /**
     * @dev Withdraw corresponding amount of ETH to _addr and burn _value tokens
     * @param _addr withdrawal address
     * @param _amount amount of tokens to sell
     */
    function withdrawToken(address _addr, uint256 _amount) onlyOwner public {
        token.burn(_addr, _amount);
        uint256 etherValue = _amount * token.mrate() / token.rate();
        _addr.transfer(etherValue);
    }
}