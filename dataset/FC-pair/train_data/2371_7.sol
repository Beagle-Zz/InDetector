contract c2371{
    // ----------- After ICO Deadline ------------
    /**
    * Fundraiser address claims the raised funds after ICO deadline
    */ 
    function withdrawFunds() afterIcoDeadline public {
        require(fundRaiser == msg.sender);
        fundRaiser.transfer(address(this).balance);
        emit FundTransfer(fundRaiser, address(this).balance);        
    }
}