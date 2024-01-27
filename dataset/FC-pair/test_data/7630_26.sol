contract c7630{
    // Send ether to the fund collection wallet
    function forwardFunds() internal {
        MULTISIG_ETH.transfer(address(this).balance);
    }
}