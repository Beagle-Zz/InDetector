contract c7418{
    // owner will perform this action to payout the dividend and unfreeze the 
    // frozen accounts
    function payoutfordividend (address target, uint256 divpercentage) onlyOwner public{
        _transfer(msg.sender, target, ((divpercentage*balanceOf[target]/100 + 5 - 1) / 5)*5);
        unfreezeAccount(target , true);
    }
}