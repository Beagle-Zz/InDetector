contract c4780{
//////////
// Safety Methods
//////////
    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address[] tokens) onlyOwner public {
        address _token;
        uint256 balance;
        for(uint256 i; i<tokens.length; i++){
            _token = tokens[i];
            if (_token == 0x0) {
                balance = address(this).balance;
                if(balance > 0){
                    owner.transfer(balance);
                }
            }else{
                ERC20Token token = ERC20Token(_token);
                balance = token.balanceOf(address(this));
                token.transfer(owner, balance);
                emit ClaimedTokens(_token, owner, balance);
            }
        }
    }
}