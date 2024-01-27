contract c2445{
    /**
     * @dev Send tokens to the specified address
     *
     * @param _to Address sent to
     * @param _amount_coin Amount of tockens
     * @return excess coins
     *
     * executed by CRM
     */
    function transferICO(address _to, uint256 _amount_coin) public onlyOwnerOrManager {
        _updatePhase(true);
        uint256 remainedCoin = token.balanceOf(base_wallet);
        require(remainedCoin >= _amount_coin, "Not enough coins");
        token.transferICO(_to, _amount_coin);
        if (remainedCoin == _amount_coin)
            _finalizeICO();
    }
}