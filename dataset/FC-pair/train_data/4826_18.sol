contract c4826{
    /**
    * Set the contract that can call release and make the token transferable.  
    */
    function setReleaseAgent(address addr) onlyOwner inReleaseState(false) public {      
        releaseAgent = addr;
    }
}