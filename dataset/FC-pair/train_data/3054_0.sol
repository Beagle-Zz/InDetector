contract c3054{
    // Ensures that only the dAppBridge system can call the function
    modifier only_dAppBridge {
        initBridge();
        address _dAppBridgeOwner = dAppBridge.getOwner();
        require(msg.sender == _dAppBridgeOwner);
        _;
    }
}