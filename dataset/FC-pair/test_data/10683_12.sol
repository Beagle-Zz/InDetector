contract c10683{
    /*
        @dev allows the owner to update the formula contract address
        @param _formula    address of a standard formula contract
    */
    function setFormula(IStandardFormula _formula)
        public
        ownerOnly
        validAddress(_formula)
        notThis(_formula)
    {
        formula = _formula;
    }
}