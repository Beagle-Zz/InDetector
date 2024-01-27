contract c1473{
    /**
     *  @dev Get investors' fee depending on the current year
     *  @return uint8 The fee percentage, which investors get
     */
    function getInvestorsFee() public constant returns (uint8) {
        //01/01/2020
        if (now >= 1577836800) {
            return 1;
        }
        //01/01/2019
        if (now >= 1546300800) {
            return 5;
        }
        return 10;
    }
}