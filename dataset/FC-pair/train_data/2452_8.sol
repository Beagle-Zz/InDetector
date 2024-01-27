contract c2452{
    // callable by owner only, after specified time
    function withdraw3() onlyAdmin public {
       require(now >= unlockDate3);
       require(withdraw_3Completed == false);
       require(claimAmountSet == true);
       // now allow a percentage of the balance
       token.transfer(admin, (tokensToBeClaimed.div(quarter3)));
       emit WithdrewTokens(thisContractAddress, admin, (tokensToBeClaimed.div(quarter3)));    // 25%
       withdraw_3Completed = true;
    }
}