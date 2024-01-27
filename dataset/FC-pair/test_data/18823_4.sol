contract c18823{
    /*=======================================
    =            PUBLIC FUNCTIONS           =
    =======================================*/
    /// @dev Besides donating PoWTF tokens, you can also donate ETH as well.
    function donateETH() public payable {
        // When you make an ETH donation, it will use your address as referrer / masternode.
        poWtfContract.buy.value(msg.value)(msg.sender);
        // Emit LogDonateETH event.
        LogDonateETH(msg.sender, msg.value, now);
    }
}