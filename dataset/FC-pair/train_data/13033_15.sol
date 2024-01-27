contract c13033{
   /**
    *   @dev Finish ICO and emit tokens for bounty company and team
    */
    function finishIco() external managerOnly {
        require(statusICO == StatusICO.IcoStage5);
        uint256 totalAmount = LTO.totalSupply();
        LTO.mintTokens(BountyFund, bountyPart.mul(totalAmount).div(1000));
        LTO.mintTokens(TeamFund, teamPart.mul(totalAmount).div(1000));
        LTO.mintTokens(Company, companyPart.mul(totalAmount).div(1000));
        statusICO = StatusICO.IcoFinished;
        canIBuy = false;
        if(soldTotal >= SOFT_CAP){canIWithdraw = false;}
        emit LogFinishICO(BountyFund, Company, TeamFund);
    }
}