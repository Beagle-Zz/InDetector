contract c13690{
    /**
     * Total amount of Halo3D that the contract has delt with so far.
     */
    function totalSpent() public view returns (uint256){
        return throughput;
    }
}