contract c10226{
    // Set assetsCertified
    function setAssetsCertified(uint256 _total) public onlyAuditor whenRedemptionPaused {
        uint256 totalSupply_ = rocketStorage.getUint(keccak256("token.totalSupply"));
        require(_total >= totalSupply_);
        rocketStorage.setUint(keccak256("issuable.assetsCertified"), _total);
        emit CertificationUpdated(msg.sender, _total);
    }
}