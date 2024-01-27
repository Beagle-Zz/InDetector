contract c2817{
    // team withdrawal after specified time
    function withdraw_3() onlyAdmin public {
       require(ethToBeClaimed > 0);
       require(withdraw_3Completed == false);
       // ensure current time is later than time set
       require(now >= unlockDate3);
       // now allow a percentage of the balance to be claimed
       admin.transfer(ethToBeClaimed.div(quarter3));
       emit Withdrew(admin, ethToBeClaimed.div(quarter3));    // 25%
       withdraw_3Completed = true;
    }
}