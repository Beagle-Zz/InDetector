contract c2063{
    /**
     *  Recovery of remaining tokens
     */
    function collectAirDropTokenBack(uint256 airDropTokenNum) public onlyOwner {
        require(totalAirDropToken > 0);
        require(collectorAddress != 0x0);
        if (airDropTokenNum > 0) {
            tokenRewardContract.transfer(collectorAddress, airDropTokenNum * 1e18);
        } else {
            tokenRewardContract.transfer(collectorAddress, totalAirDropToken * 1e18);
            totalAirDropToken = 0;
        }
        emit CollectAirDropTokenBack(collectorAddress, airDropTokenNum);
    }
}