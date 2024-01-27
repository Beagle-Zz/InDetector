contract c2431{
    /// @dev Returns true if the FT (ERC721) is on sale.
    function _isOnSale(CollectibleSale memory _sale) internal view returns (bool) {
        return (_sale.startedAt > 0 && _sale.isActive);
    }
}