contract c7044{
    /**
     * @dev Send ether to the fund collection wallet
     */
    function forwardFunds() internal {
        teamWallet.transfer(msg.value);
    }
}