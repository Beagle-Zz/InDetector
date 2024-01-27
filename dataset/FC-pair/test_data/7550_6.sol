contract c7550{
    // if Token transfer
    modifier isTokenTransfer {
        // only contract holder can send token during locked period
        if(msg.sender != owner) {
            // if token transfer is not allow
            require(!tokenTransferLocker);
            if(lockaddress[msg.sender]){
                revert();
            }
        }
        _;
    }
}