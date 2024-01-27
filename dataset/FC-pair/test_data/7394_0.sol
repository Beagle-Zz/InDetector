contract c7394{
    //1533128400   //2018.8.1 August 1, 2018
    //1542204000   //2018.11.14 Nov 14, 2018
    /**
    * @dev total number of tokens in existence
    */
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
}