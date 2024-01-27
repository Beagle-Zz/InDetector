contract c10226{
    /******* For during both paused and non-paused redemption *******/
    // Depository can receive assets (increasing)
    function receiveAssets(uint256 _units) public onlyDepository {
        uint256 total_ = assetsOnDeposit().add(_units);
        rocketStorage.setUint(keccak256("issuable.assetsOnDeposit"), total_);
        emit AssetsUpdated(msg.sender, total_);
    }
}