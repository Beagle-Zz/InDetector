contract c10369{
    // Total number of tokens currently in the vault
    function getTotalBalance() public view returns (uint256 tokensCurrentlyInVault) {
        return token.balanceOf(address(this));
    }
}