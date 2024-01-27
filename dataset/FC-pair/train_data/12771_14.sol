contract c12771{
    /*
        @dev allows the owner to update the quick converter contract address
        @param _quickConverter  address of a bancor quick converter contract
    */
    function setQuickConverter(IBancorQuickConverter _quickConverter)
        public
        ownerOnly
        validAddress(_quickConverter)
        notThis(_quickConverter)
    {
        quickConverter = _quickConverter;
    }
}