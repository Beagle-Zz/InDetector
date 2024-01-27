contract c3928{
    /**
    * @notice Bulk send tokens (same amount)
    * @param beneficiaries array whom to send tokend
    * @param amount how much tokens to send
    */
    function bulkTokenSend(address[] beneficiaries, uint256 amount) onlyOwner external {
        for(uint32 i=0; i < beneficiaries.length; i++){
            require(token.transferFrom(msg.sender, beneficiaries[i], amount));
        }
    }
}