contract c1999{
    /**
    * @dev Checks msg.sender can transfer a token, by being owner, approved, or operator
    * @param _tokenId uint256 ID of the token to validate
    */
    modifier canTransfer(uint256 _tokenId) {
        uint256 isAttached = getIsNFTAttached(_tokenId);
        if(isAttached == 2) {
            //One-Time Auth for Physical Card Transfers
            require(msg.sender == managerPrimary ||
                msg.sender == managerSecondary ||
                msg.sender == bankManager ||
                otherManagers[msg.sender] == 1
            );
            updateIsAttached(_tokenId, 1);
        } else if(attachedSystemActive == true && isAttached >= 1) {
            require(msg.sender == managerPrimary ||
                msg.sender == managerSecondary ||
                msg.sender == bankManager ||
                otherManagers[msg.sender] == 1
            );
        }
        else {
            require(isApprovedOrOwner(msg.sender, _tokenId));
        }
    _;
    }
}