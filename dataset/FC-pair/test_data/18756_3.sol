contract c18756{
    // function to redeem ETH from MTC
    function startRedeem(uint256 _rate, bool canRedeem) onlyOwner public {
        redeemRate = _rate;
        redeemBool = canRedeem;
    }
}