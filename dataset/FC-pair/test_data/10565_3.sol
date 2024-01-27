contract c10565{
    /**
    * @dev   Token Contract Modifier
    * Check if the batch transfer amount is
    * equal or more than balance
    * (For multiple batch amounts)
    *
    * @param _recipients - The recipients to send
    * @param _amounts - The amounts to send
    *
    */
    modifier validBalanceMultiple(address[] _recipients, uint256[] _amounts) {
        // Assert balance
        uint256 balance = token.balanceOf(this);
        require(balance > 0);
        uint256 totalAmount;
        for (uint256 i = 0 ; i < _recipients.length ; i++) {
            totalAmount = totalAmount.add(_amounts[i]);
        }
        require(balance >= totalAmount);
        _;
    }
}