contract c18087{
    /*
        @dev validate that the given gas price is equal to the current network gas price
        @param _gasPrice    tested gas price
    */
    function validateGasPrice(uint256 _gasPrice)
        public
        view
        greaterThanZero(_gasPrice)
    {
        require(_gasPrice <= gasPrice);
    }
}