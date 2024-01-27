contract c2452{
    // callable by owner only, after specified time
    function withdraw2() onlyAdmin public {
       require(now >= unlockDate2);
       require(withdraw_2Completed == false);
       require(claimAmountSet == true);
       // now allow a percentage of the balance
       token.transfer(admin, (tokensToBeClaimed.div(quarter2)));
       emit WithdrewTokens(thisContractAddress, admin, (tokensToBeClaimed.div(quarter2)));    // 25%
       withdraw_2Completed = true;
    }
}