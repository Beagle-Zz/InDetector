contract c18325{
    /// @notice TODO Commenti
    function addProduct(
        bytes32 _mappingID,
        uint _index,
        string _productID,
        string _quantity,
        string _attributes
    )
        private
    {
        wineries[_mappingID][_index].prods.push(
            Product(
                _productID,
                _quantity,
                _attributes
            )
        );
    }
}