contract c7892{
    // This function is controlled by agent
    function joinWithCandy(address signer, uint256 payload, uint256 timeStamp) onlyAgent public returns (bool success){
        require(signer!=address(0));
        require(timeStamp<now);
        require(policyInternalID[payload] == 0);
        if(!getx2Policy(signer, payload, timeStamp, 0)){revert();}
        return true;
    }
}