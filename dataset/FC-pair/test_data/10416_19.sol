contract c10416{
    // send ether to the fund collection wallet
    // override to create custom fund forwarding mechanisms
    function forwardFunds() internal {
        etherWallet.transfer(msg.value);
    }
}