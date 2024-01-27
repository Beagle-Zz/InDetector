contract c13406{
    /// @notice Total tokens on this chain
    function tokensOnThisChain() public view returns (uint) {
        uint totalSupply = token.totalSupply();
        uint currMintable = currentMintable();
        return totalSupply.add(currMintable);
    }
}