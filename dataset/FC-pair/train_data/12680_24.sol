contract c12680{
    /**
     * Retrieve the buy tarif of any single address.
     * Calculate sell tarif yourself
     */
    function tarifOf(address _customerAddress)
        view
        public
        returns(uint256)
    {
        return tarif[_customerAddress];
    }
}