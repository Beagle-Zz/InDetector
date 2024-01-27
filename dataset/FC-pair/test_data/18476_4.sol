contract c18476{
    /*=======================================
    =            PUBLIC FUNCTIONS           =
    =======================================*/
    /// @dev Besides donating RAMEN tokens, you can also donate ETH as well.
    function donateETH() public payable {
        // When you make an ETH donation, it will use your address as referrer / masternode.
        RamenContract.buy.value(msg.value)(msg.sender);
        // Emit LogDonateETH event.
        LogDonateETH(msg.sender, msg.value, now);
    }
}