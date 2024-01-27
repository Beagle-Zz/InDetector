contract c3545{
    /**
    * @dev External function to mint a new token
    * @dev Reverts if the given token ID already exists
    * @param _to address the beneficiary that will own the minted token
    * @param _tokenId uint256 ID of the token to be minted by the msg.sender
    */
    function mint(address _to, uint256 _tokenId) external onlyLogicContract {
        _mint(_to, _tokenId);
    }
}