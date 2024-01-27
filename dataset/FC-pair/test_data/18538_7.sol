contract c18538{
    // Quick checker on total supply
    function currentSupply()
        public
        view
        returns (uint)
    {
        return totalSupply;
    }
}