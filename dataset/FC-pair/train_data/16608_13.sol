contract c16608{
    /**
     * Owner can update token information here.
     *
     * It is often useful to conceal the actual token association, until
     * the token operations, like central issuance or reissuance have been completed.
     * In this case the initial token can be supplied with empty name and symbol information.
     *
     * This function allows the token owner to rename the token after the operations
     * have been completed and then point the audience to use the token contract.
     */
    function setTokenInformation(string _tokenName, string _tokenSymbol) onlyOwner public {
        name = _tokenName;
        symbol = _tokenSymbol;
        emit UpdatedTokenInformation(name, symbol);
    }
}