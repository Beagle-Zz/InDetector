contract c3278{
    //get the balance of customer
    function getCustomerBalance(address _addr)
        public
        constant returns (uint)
    {
        return customerBalance[_addr];
    }
}