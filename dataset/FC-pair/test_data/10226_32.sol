contract c10226{
    // Auditor can increase certified assets
    function increaseAssetsCertified(uint256 _units) public onlyAuditor {
        uint256 total_ = assetsCertified().add(_units);
        rocketStorage.setUint(keccak256("issuable.assetsCertified"), total_);
        emit CertificationUpdated(msg.sender, total_);
    }
}