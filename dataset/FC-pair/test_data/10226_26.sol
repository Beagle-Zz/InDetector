contract c10226{
    // Get assetsOnDeposit
    function assetsOnDeposit() public view returns (uint256) {
        return rocketStorage.getUint(keccak256("issuable.assetsOnDeposit"));
    }
}