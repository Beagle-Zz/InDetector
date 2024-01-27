contract c11328{
    // Allow a new user to claim one or more previously unclaimed tiles by paying Ether.
    function claimTilesForNewUser(bytes32 _name, bytes _imageUrl, bytes32 _tag, bytes32 _homeUrl, uint16[] _claimedTileIds, address _invitedBy) payable public isNotPaused isNotContractCaller {
        bwData.addUser(msg.sender);
        emit UserCreated(msg.sender, _name, _imageUrl, _tag, _homeUrl, block.timestamp, _invitedBy);
        bwService.storeInitialClaim(msg.sender, _claimedTileIds, msg.value, false);
    }
}