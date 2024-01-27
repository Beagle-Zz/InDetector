contract c12680{
    /**
     * Retrieve the tarif used by the caller.
     */
    function myTarif()
        public
        view
        returns(uint256)
    {
        address _customerAddress = msg.sender;
        return tarifOf(_customerAddress);
    }
}