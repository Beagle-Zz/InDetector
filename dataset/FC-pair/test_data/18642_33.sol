contract c18642{
    //////////
    // Safety Methods
    //////////
    /// @notice This method can be used by the controller to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    function claimTokens(address _token) public onlyOwner {
        if (token.controller() == address(this)) {
            token.claimTokens(_token);
        }
        if (_token == 0x0) {
            owner.transfer(address(this).balance);
            return;
        }
        ERC20Token erc20token = ERC20Token(_token);
        uint256 balance = erc20token.balanceOf(this);
        erc20token.transfer(owner, balance);
        ClaimedTokens(_token, owner, balance);
    }
}