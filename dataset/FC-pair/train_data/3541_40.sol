contract c3541{
    // PUBLIC VIEW METHODS
    // get asset specific information
    function getName(address ofAsset) view returns (bytes32) { return assetInformation[ofAsset].name; }
}