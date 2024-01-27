contract c8498{
    // ------------------------------------------------------------------------
    // Retrieve the current dispensing rate in satoshis per gwei
    // ------------------------------------------------------------------------
    function calculateDispensedTokensForGasPrice(uint256 gasprice) public view returns (uint256) {
        if(priceInWeiPerSatoshi == 0){ 
            return 0; 
        }
        return gasprice.div(priceInWeiPerSatoshi);
    }
}