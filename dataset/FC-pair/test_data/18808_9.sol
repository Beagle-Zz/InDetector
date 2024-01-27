contract c18808{
    /**
     * If we want to rebrand, we can.
     */
    function setSymbol(string _symbol)
        onlyAdmin()
        public
    {
        symbol = _symbol;
    }
}