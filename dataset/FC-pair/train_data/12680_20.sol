contract c12680{
    /**
     * Retrieve the dividends owned by the caller.
     */
    function myDividends()
        public
        view
        returns(uint256)
    {
        address _customerAddress = msg.sender;
        return dividendsOf(_customerAddress);
    }
}