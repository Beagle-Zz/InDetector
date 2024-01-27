contract c10226{
    // Get assetsCertified
    function assetsCertified() public view returns (uint256) {
        return rocketStorage.getUint(keccak256("issuable.assetsCertified"));
    }
}