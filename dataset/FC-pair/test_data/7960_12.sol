contract c7960{
    /**
     * @dev The initialization method.
     *
     * @param _hardCap The maximum amount of ether allowed to be raised.
     */
    function initializeCappedFundraiser(uint256 _hardCap) internal {
        require(_hardCap > 0);
        hardCap = _hardCap;
    }
}