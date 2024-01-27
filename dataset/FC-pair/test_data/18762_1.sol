contract c18762{
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
    function setTokenInformation(string _name, string _symbol) public {
        require(msg.sender == coinMaster) ;
        require(bytes(name).length > 0 && bytes(symbol).length > 0);
        name = _name;
        symbol = _symbol;
        emit UpdatedInformation(name, symbol);
    }
}