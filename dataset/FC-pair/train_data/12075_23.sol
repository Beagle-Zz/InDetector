contract c12075{
    /*
    * Internal functions
    */
    /// @dev Transfers a token using TokenTransferProxy transferFrom function.
    /// @param token Address of token to transferFrom.
    /// @param from Address transfering token.
    /// @param to Address receiving token.
    /// @param value Amount of token to transfer.
    /// @return Success of token transfer.
    function transferViaTokenTransferProxy(
        address token,
        address from,
        address to,
        uint value)
        internal
        returns (bool)
    {
        return ZeroExTokenTransferProxy(TOKEN_TRANSFER_PROXY_CONTRACT).transferFrom(token, from, to, value);
    }
}