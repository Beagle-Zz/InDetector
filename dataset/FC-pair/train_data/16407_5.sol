contract c16407{
    /**
    * @dev Set minimum price for fusion Chibis in Wei
    */
    function setMinimumPriceFusion(uint _price) public contract_onlyOwner returns(bool success) {
        priceFusionChibi = _price;
        return true;
    }
}