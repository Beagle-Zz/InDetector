contract c8498{
    // ------------------------------------------------------------------------
    // Retrieve the current dispensing rate in satoshis per gwei
    // ------------------------------------------------------------------------
    function getWeiPerSatoshi() public view returns (uint256) {
        return priceInWeiPerSatoshi;
    }
}