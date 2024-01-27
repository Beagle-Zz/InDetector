contract c13341{
    /**
     * Return current token price
     *
     * The price depends on `saleStage` and `amountRaised`
     */
    function getPrice() returns (uint) {
        if (saleStage == 4) {
            return 0.0002000 ether;
        } else if (saleStage == 3) {
            return 0.0001667 ether;
        } else if (saleStage == 2) {
            return 0.0001429 ether;
        }
        return 0.000125 ether;
    }
}