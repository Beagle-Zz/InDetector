contract c10476{
    // Ensures the updated sellprice is below the here defined moving maximum.
    // The maximum is oriented to the price the day is bought.
    // Into baseprice the buyprice needs to be passed. This could be either msg.value or a stored value from previous tx.
    modifier onlyValidSellprice(uint256 sellprice, uint256 baseprice) {
        // Set the moving maximum to twice the paid amount
        require(sellprice > 0 && sellprice <= baseprice * 2, "new sell price must be lower than or equal to twice the paid price");
        _;
    }
}