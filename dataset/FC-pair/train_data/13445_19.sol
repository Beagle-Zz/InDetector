contract c13445{
    /// @dev Retrieve the dividend balance of any single address.
    function dividendsOf(address _customerAddress) public view returns (uint256) {
        return (uint256) ((int256) (-payoutsTo_[_customerAddress])) / magnitude;
    }
}