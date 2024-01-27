contract c7543{
    // just to check that funds goes to the right place
    // tokens are not given in return
    function debugBuy() public payable {
        require(msg.value == 123);
        sendETHToContributionWallet(msg.value);
    }
}