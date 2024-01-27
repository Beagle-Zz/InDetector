contract c13329{
    // We check whether we collected the necessary minimum funds. Constant.
    function goalReached() public view returns (bool) {
        return weiRaised() >= softCap;
    }
}