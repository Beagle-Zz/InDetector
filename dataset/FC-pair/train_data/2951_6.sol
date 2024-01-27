contract c2951{
    // team withdrawal after specified time
    function withdraw_3() onlyAdmin public {
       require(ethToBeClaimed > 0);
       require(withdraw_3Completed == false);
       require(now >= unlockDate3);
       // now allow a percentage of the balance to be claimed
       msg.sender.transfer(ethToBeClaimed.div(quarter3));
       emit Withdrew(msg.sender, ethToBeClaimed.div(quarter3));    // 25%
       withdraw_3Completed = true;
    }
}