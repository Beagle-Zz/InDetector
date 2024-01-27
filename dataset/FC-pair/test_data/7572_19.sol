contract c7572{
    // disable transfer for upgrade or emergency events
    function disableTransfer() onlyOwner public
    {
        transferable = false;
        DisableTransfer();
    }
}