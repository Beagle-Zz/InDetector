contract c1502{
    /**
     * @dev Withdraw corresponding amount of ETH to _addr and burn _value tokens
     * @param _addr buyer address
     * @param _amount amount of tokens to buy
     */
    function transferBctToken(
        address _addr,
        uint _amount
    )
        onlyOwner public
    {
        require(bctToken.balanceOf(this) >= _amount);
        bctToken.transfer(_addr, _amount);
    }
}