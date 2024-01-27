contract c3842{
    /** 
     * @dev function calculate dividends and store result in mapping divmap
     * @dev stop all transfer before calculations
     * k - coefficient
     */    
    function _CalcDiv() internal {
        uint256 myAround = 1 ether;
        uint256 i;
        uint256 k;
        address invAddress;
        receivedDividends = receivedDividends.add(msg.value);
        if (receivedDividends >= crowdSaleContract.hardCapDividends()){
            uint256 lengthArrInvesotrs = token.getInvestorsCount();
            crowdSaleContract.lockTransfer(true); 
            k = receivedDividends.mul(myAround).div(token.totalSupply());
            uint256 myProfit;
            for (i = 0;  i < lengthArrInvesotrs; i++) {
                invAddress = token.getInvestorAddress(i);
                myProfit = token.balanceOf(invAddress).mul(k).div(myAround);
                divmap[invAddress] = divmap[invAddress].add(myProfit);
            }
            crowdSaleContract.lockTransfer(false); 
            receivedDividends = 0;
        }
    }
}