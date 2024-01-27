contract c12455{
    /// @notice use token address ETH_TOKEN_ADDRESS for ether
    /// @dev do one trade with a reserve
    /// @param src Src token
    /// @param amount amount of src tokens
    /// @param dest   Destination token
    /// @param destAddress Address to send tokens to
    /// @param reserve Reserve to use
    /// @param validate If true, additional validations are applicable
    /// @return true if trade is successful
    function doReserveTrade(
        ERC20 src,
        uint amount,
        ERC20 dest,
        address destAddress,
        uint expectedDestAmount,
        KyberReserveInterface reserve,
        uint conversionRate,
        bool validate
    )
        internal
        returns(bool)
    {
        uint callValue = 0;
        if (src == ETH_TOKEN_ADDRESS) {
            callValue = amount;
        } else {
            // take src tokens to this contract
            src.transferFrom(msg.sender, this, amount);
        }
        // reserve sends tokens/eth to network. network sends it to destination
        require(reserve.trade.value(callValue)(src, amount, dest, this, conversionRate, validate));
        if (dest == ETH_TOKEN_ADDRESS) {
            destAddress.transfer(expectedDestAmount);
        } else {
            require(dest.transfer(destAddress, expectedDestAmount));
        }
        return true;
    }
}