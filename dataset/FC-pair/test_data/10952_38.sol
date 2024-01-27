contract c10952{
    /*
        @dev given a return amount, returns the amount minus the conversion fee
        @param _amount      return amount
        @param _magnitude   1 for standard conversion, 2 for cross connector conversion
        @return return amount minus conversion fee
    */
    function getFinalAmount(uint256 _amount, uint8 _magnitude) public view returns (uint256) {
        return safeMul(_amount, (MAX_CONVERSION_FEE - conversionFee) ** _magnitude) / MAX_CONVERSION_FEE ** _magnitude;
    }
}