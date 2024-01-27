contract c10953{
    /*
        @dev allows the owner to update the factory contract address
        @param _bancorConverterFactory    address of a bancor converter factory contract
    */
    function setBancorConverterFactory(IBancorConverterFactory _bancorConverterFactory) public ownerOnly {
        bancorConverterFactory = _bancorConverterFactory;
    }
}