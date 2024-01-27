contract c13581{
    /**
    * @dev   Token Contract Modifier
    * Check if the batch transfer amount is
    * equal or more than balance
    * (For single batch amount)
    *
    * @param _recipients - The recipients to send
    * @param _amount - The amount to send
    *
    */
    modifier validBalance(address[] _recipients, uint256 _amount) {
        // Assert balance
        uint256 balance = token.balanceOf(this);
        require(balance > 0);
        require(balance >= _recipients.length.mul(_amount));
        _;
    }
}