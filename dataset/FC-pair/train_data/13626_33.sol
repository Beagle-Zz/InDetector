contract c13626{
    /*
        @dev allows the owner to update the extensions contract address
        @param _extensions    address of a bancor converter extensions contract
    */
    function setExtensions(IBancorConverterExtensions _extensions)
        public
        ownerOnly
        validAddress(_extensions)
        notThis(_extensions)
    {
        extensions = _extensions;
    }
}