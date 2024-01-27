contract c137{
    /**
        @dev Allows true owner of token to cancel sale at anytime
        @param tokenId ID of the token to remove from the market
        @return true if user still has tokens for sale
    */
    function cancelSale(uint256 tokenId) external 
    whenNotPaused()
    originalOwnerOf(tokenId) 
    tokenAvailable() returns (bool) {
        //throws on fail - transfers token from exchange back to original owner
        token.transferFrom(address(this),msg.sender,tokenId);
        //Reset token on market - remove
        delete market[tokenId];
        //Reset barn tracker for user
        _removeTokenFromBarn(tokenId, msg.sender);
        emit SaleCanceled(tokenId);
        //Return true if this user is still 'active' within the exchange
        //This will help with client side actions
        return userBarn[msg.sender].length > 0;
    }
}