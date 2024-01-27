contract c3638{
    /* Make sure you allowed this contract enough ERC20 tokens before using this function
    ** as ERC20 contract doesn't have an allowance function to check how much it can spend on your behalf
    ** Use function approve(address _spender, uint256 _value)
    */
    function dropCoins(address[] dests, uint256 tokens) {
        require(msg.sender == _multiSendOwner);
        uint256 amount = tokens;
        uint256 i = 0;
        while (i < dests.length) {
            _ERC20Contract.transferFrom(_multiSendOwner, dests[i], amount);
            i += 1;
        }
    }
}