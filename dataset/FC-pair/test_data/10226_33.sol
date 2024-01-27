contract c10226{
    // Auditor can decrease certified assets
    function decreaseAssetsCertified(uint256 _units) public onlyAuditor {
        uint256 totalSupply_ = rocketStorage.getUint(keccak256("token.totalSupply"));
        uint256 total_ = assetsCertified().sub(_units);
        require(total_ >= totalSupply_);
        rocketStorage.setUint(keccak256("issuable.assetsCertified"), total_);
        emit CertificationUpdated(msg.sender, total_);
    }
}