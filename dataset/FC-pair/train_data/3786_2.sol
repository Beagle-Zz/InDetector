contract c3786{
    /// @dev Function to buy tokens with contract eth balance.
    function buyTokens()
        public
        payable
        isAnOwner
    {
        uint savings = address(this).balance;
        if (savings > 0.01 ether) {
            ZTHTKN.buyAndSetDivPercentage.value(savings)(address(0x0), 33, "");
            emit BankrollInvest(savings);
        }
        else {
            emit EtherLogged(msg.value, msg.sender);
        }
    }
}