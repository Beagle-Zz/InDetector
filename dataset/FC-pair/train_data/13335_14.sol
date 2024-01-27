contract c13335{
    //batch airdrop, key-- the receiver's address, value -- receiver's amount
    function airdropTokensBatch(address[] receivers, uint256[] amounts) public onlyOwnerOrAdmin onlyWhileAirdropPhaseOpen{
        require(receivers.length > 0 && receivers.length == amounts.length);
        for (uint256 i = 0; i < receivers.length; i++){
            airdropTokens(receivers[i], amounts[i]);
        }
    }
}