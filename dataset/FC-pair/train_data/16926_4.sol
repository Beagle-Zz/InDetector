contract c16926{
    //transfer used for special contribuitions
    function specialTransfer(address _to, uint _amount) internal returns(bool){
        require(_to != address(0));
        require(_amount > 0);
        // calculate token to be substracted
        uint256 tokens = _amount * (10 ** 18);
        tokenReward.transfer(_to, tokens);		
        ApolloSeptemTokenSpecialPurchase(msg.sender, _to, tokens);
        return true;
    }
}