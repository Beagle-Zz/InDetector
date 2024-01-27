contract c10568{
    /*
     *  Helper functions
     */
    /*
     *  @dev function returning tokenID of the last token issued
     *  @return uint256 - the tokenID
     */
    function lastID() view public returns (uint256)  {
        return allTokens.length - 1;
    }
}