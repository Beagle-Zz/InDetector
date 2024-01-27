contract c18930{
    /**
    * @dev Determines how ETH is stored/forwarded on purchases.
    */
    function _forwardFunds() private {
        vaultWallet.transfer(msg.value);
    }
}