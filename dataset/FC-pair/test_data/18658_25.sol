contract c18658{
    // Enable or disable auctions
    function setAuctionsEnabled(bool _auctionsEnabled) external onlyAuthority {
        auctionsEnabled = _auctionsEnabled;
    }
}