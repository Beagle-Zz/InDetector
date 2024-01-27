contract c2951{
    // team withdrawal after specified time
    function withdraw_1() onlyAdmin public {
       require(ethToBeClaimed > 0);
       require(withdraw_1Completed == false);
       require(now >= unlockDate1);
       // now allow a percentage of the balance to be claimed
       msg.sender.transfer(ethToBeClaimed.div(quarter1));
       emit Withdrew(msg.sender, ethToBeClaimed.div(quarter1));    // 25%
       withdraw_1Completed = true;
    }
}