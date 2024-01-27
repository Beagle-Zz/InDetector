contract c2431{
    /// @dev BuyNow Function which call the interncal buy function
    /// after doing all the pre-checks required to initiate a buy
    function BuyAsset(uint256 _assetId) external whenNotPaused payable {
        require(msg.sender != address(0));
        require(msg.sender != address(this));
        CollectibleSale memory _sale = tokenIdToSale[_assetId];
        require(_isOnSale(_sale));
        //address seller = _sale.seller;
        _buy(_assetId, msg.sender, msg.value);
    }
}