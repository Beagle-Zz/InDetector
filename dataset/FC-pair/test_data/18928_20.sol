contract c18928{
    /// @dev withdraw token
    /// @param _tokenContract any kind of ERC20 token to withdraw from
    function withdraw(address _tokenContract) external onlyOwner {
        ERC20 token = ERC20(_tokenContract);
        uint256 balance = token.balanceOf(this);
        assert(token.transfer(owner, balance));
    }
}