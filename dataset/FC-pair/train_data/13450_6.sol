contract c13450{
    /// @notice This method can be used by the owner to extract mistakenly
    ///  sent tokens to this contract.
    /// @param _token The address of the token contract that you want to recover
    ///  set to 0 in case you want to extract ether.
    //
    // THIS TOKENS ARE NOT TRANSFERRABLE.
    //
    function claimTokens(address _token) public onlyOwner {
        require(_token != address(this));
        if (_token == 0x0) {
            owner.transfer(address(this).balance);
            return;
        }
        ERC20Interface token = ERC20Interface(_token);
        uint balance = token.balanceOf(this);
        token.transfer(owner, balance);
        emit ClaimedTokens(_token, owner, balance);
    }
}