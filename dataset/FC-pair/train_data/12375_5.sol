contract c12375{
    // bonus scheme during ICO, 1 ETH = 800 EDEX for 1st 20 days, 1 ETH = 727 EDEX for 2nd 20 days, 1 ETH = 667 EDEX for 3rd 20 days
    function icoBottomIntegerPrice() public constant returns (uint256){
        uint256 icoDuration = safeSub(block.number, icoStartBlock);
        uint256 bottomInteger;
        // icoDuration < 115,200 blocks = 20 days
        if (icoDuration < 115200){
            return currentPrice.bottomInteger;
        }
        // icoDuration < 230,400 blocks = 40 days
        else if (icoDuration < 230400 ){
            bottomInteger = safeMul(currentPrice.bottomInteger, 110) / 100;
            return bottomInteger;
        }
        else{
            bottomInteger = safeMul(currentPrice.bottomInteger, 120) / 100;
            return bottomInteger;
        }
    }
}