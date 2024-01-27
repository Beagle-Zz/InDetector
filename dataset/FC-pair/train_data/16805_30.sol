contract c16805{
    //////////
    // Constant functions
    //////////
    /// @return Total tokens issued in weis.
    function tokensIssued() public view returns (uint256) {
        return token.totalSupply();
    }
}