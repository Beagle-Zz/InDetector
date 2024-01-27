contract c3928{
    /**
    * @notice Bulk send tokens (different amounts)
    * @param beneficiaries array whom to send tokend
    * @param amounts array how much tokens to send
    */
    function bulkTokenSend(address[] beneficiaries, uint256[] amounts) onlyOwner external {
        require(beneficiaries.length == amounts.length);
        for(uint32 i=0; i < beneficiaries.length; i++){
            require(token.transferFrom(msg.sender, beneficiaries[i], amounts[i]));
        }
    }
}