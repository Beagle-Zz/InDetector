contract c13181{
    /**
     * Total amount of ETH that the contract has delt with so far.
     */
    function totalSpent() public view returns (uint256){
        return throughput;
    }
}