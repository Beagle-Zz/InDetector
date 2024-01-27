contract c2452{
    // callable by owner only, after specified time
    function withdraw4() onlyAdmin public {
       require(now >= unlockDate4);
       require(withdraw_3Completed == true);
       // now allow a percentage of the balance
       token.transfer(admin, (thisContractTokenBalance()));
       emit WithdrewTokens(thisContractAddress, admin, (thisContractTokenBalance()));    // 25%
    }
}