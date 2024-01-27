contract c3545{
    /**
    * @dev Internal function to check if transferring a specific token is allowed
    * @param _from transfer from
    * @param _to transfer to
    * @param _tokenId token to transfer
    */
    function _isTransferAllowed(address _from, address _to, uint256 _tokenId) internal view returns (bool) {
        if (logicContract == address(0)) {
            return true;
        }
        HeroLogicInterface logic = HeroLogicInterface(logicContract);
        return logic.isTransferAllowed(_from, _to, _tokenId);
    }
}