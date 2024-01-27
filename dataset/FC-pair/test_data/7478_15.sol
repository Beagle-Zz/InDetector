contract c7478{
     /**
      * @dev Determines how ETH is stored/forwarded on purchases.
    */
    function forwardFunds()internal {
        depositWalletAddress.transfer(msg.value);
    }
}