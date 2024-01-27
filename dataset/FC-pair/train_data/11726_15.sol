contract c11726{
    /**
     * Implemented token interface to transfer tokens to this.
     * 
     **/
    function receiveApproval(address _from, uint256 _value, address _to, bytes _extraData) public {
        require(_to == tokenAddress);
        require(_value == leafPrice);
        require(gameState != state.closed);
        //check if game approved;
        require(CreditGAMEInterface(creditGameAddress).isGameApproved(address(this)) == true);
        uint tokensToTake = processTransaction(_from, _value);
        IERC20Token(tokenAddress).transferFrom(_from, address(this), tokensToTake);
    }
}