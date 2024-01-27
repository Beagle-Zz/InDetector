contract c7960{
    /**
     * @dev This function allows the owner to change the gas limit any time during the fundraiser
     */
    function changeGasPriceLimit(uint256 _gasPriceLimit) onlyOwner() public {
        gasPriceLimit = _gasPriceLimit;
        emit GasPriceLimitChanged(_gasPriceLimit);
    }
}