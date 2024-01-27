contract c18539{
/* Modifiers */
    // none
/* Functions */
    // Using an explicit getter allows for function overloading
    function balanceOf(address _addr)
        public
        view
        returns (uint)
    {
        return balances[_addr];
    }
}