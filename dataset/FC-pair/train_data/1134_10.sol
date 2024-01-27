contract c1134{
    /**
    * @notice Returns price - should throw if not valid
    */
    function getPrice() external view returns(uint256) {
        if (manualOverride) {
            return manualPrice;
        }
        (bytes32 price, bool valid) = Medianizer(makerDAO).peek();
        require(valid, "MakerDAO Oracle returning invalid value");
        return uint256(price);
    }
}