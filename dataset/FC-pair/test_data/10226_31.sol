contract c10226{
    // Depository can release assets (decreasing), but never to less than the totalSupply
    function releaseAssets(uint256 _units) public onlyDepository {
        uint256 totalSupply_ = rocketStorage.getUint(keccak256("token.totalSupply"));
        uint256 total_ = assetsOnDeposit().sub(_units);
        require(total_ >= totalSupply_);
        rocketStorage.setUint(keccak256("issuable.assetsOnDeposit"), total_);
        emit AssetsUpdated(msg.sender, total_);
    }
}