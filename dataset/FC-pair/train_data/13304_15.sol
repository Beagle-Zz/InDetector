contract c13304{
    // Returns the amount of fees for both phases. Constant.
    function weiTotalRaised() public constant returns(uint256){
        return weiRound1.add(weiRaised());
    }
}