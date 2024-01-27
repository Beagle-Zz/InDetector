contract c12841{
    //Amount of dividends currently in the Lottery pool
    function myDividends() public view returns(uint256) {
        return contractCall.myDividends(true);
    }
}