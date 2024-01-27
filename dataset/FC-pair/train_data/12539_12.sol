contract c12539{
    // rule enforcement and book-keeping for refunding requests
    function tryRefund() internal {
        // Note: this implementation requires that acceptedDeposits and alienDeposits have a primitive value type.
        // With a complex type, this code would produce dangling references.
        uint256 withdrawAmount;
        if(whitelist[msg.sender] == true) {
            require(state == States.Open);
            withdrawAmount = acceptedDeposits[msg.sender];
            require(withdrawAmount > 0);
            delete acceptedDeposits[msg.sender]; // implies setting the value to 0
            cumAcceptedDeposits -= withdrawAmount;
        } else {
            // alien deposits can be withdrawn anytime (we prefer to not touch them)
            withdrawAmount = alienDeposits[msg.sender];
            require(withdrawAmount > 0);
            delete alienDeposits[msg.sender]; // implies setting the value to 0
            cumAlienDeposits -= withdrawAmount;
        }
        emit Refund(msg.sender, withdrawAmount);
        // do the actual transfer last as recommended since the DAO incident (Checks-Effects-Interaction pattern)
        msg.sender.transfer(withdrawAmount); // throws on failure
    }
}