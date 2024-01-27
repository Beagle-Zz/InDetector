contract c10123{
    // In cases where there's bugs in the exchange contract we need a way to re-point
    function setExchangeContractAddress(address _exchangeContract) external onlyOwner {
        exchangeContract_ = _exchangeContract;
    }
}