contract c18756{
    // function to start minting MTC
    function startMint(uint256 _rate, bool canMint, uint256 _minWeiInvest) onlyOwner public {
        minInvest = _minWeiInvest;
        mtcRate = _rate;
        mintBool = canMint;
    }
}