contract c18537{
    // Using an explicit getter allows for function overloading
    function allowance(address _owner, address _spender)
        public
        constant
        returns (uint)
    {
        return allowed[_owner][_spender];
    }
}