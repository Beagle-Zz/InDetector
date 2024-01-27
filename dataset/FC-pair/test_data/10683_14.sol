contract c10683{
    /*
        @dev allows the owner to update the quick changer contract address
        @param _quickConverter  address of a standard quick changer contract
    */
    function setQuickConverter(IStandardQuickConverter _quickConverter)
        public
        ownerOnly
        validAddress(_quickConverter)
        notThis(_quickConverter)
    {
        quickConverter = _quickConverter;
    }
}