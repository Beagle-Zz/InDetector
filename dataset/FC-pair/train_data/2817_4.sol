contract c2817{
    // team withdrawal after specified time
    function withdraw_1() onlyAdmin public {
       require(ethToBeClaimed > 0);
       require(withdraw_1Completed == false);
       // ensure current time is later than time set
       require(now >= unlockDate1);
       // now allow a percentage of the balance to be claimed
       admin.transfer(ethToBeClaimed.div(quarter1));
       emit Withdrew(admin, ethToBeClaimed.div(quarter1));    // 25%
       withdraw_1Completed = true;
    }
}