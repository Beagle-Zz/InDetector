contract c2775{
    /**
     * Allows users to withdraw their ETH for drops which they have bought and not used. This 
     * will result in the credit of the user being set back to 0. However, bonus credits will 
     * remain the same because they are granted when users use their drops. 
     * 
     * @param _eth The amount of ETH to withdraw
     * 
     * @return true if function executes successfully, false otherwise.
     * */
    function withdrawEth(uint256 _eth) public returns(bool) {
        require(
            ethBalanceOf[msg.sender] >= _eth
            && _eth > 0 
        );
        uint256 toTransfer = _eth;
        ethBalanceOf[msg.sender] = ethBalanceOf[msg.sender].sub(_eth);
        msg.sender.transfer(toTransfer);
        EthWithdrawn(msg.sender, toTransfer);
    }
}