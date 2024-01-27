contract c3575{
    /**
     * @dev this function different conversion rate while in presale
     */
    function getConversionRate() public view returns (uint256) {
        if (isPresaleActive()) {
            return presaleConversionRate;
        }
        return super.getConversionRate();
    }
}