contract c11527{
    // contract will be manually paused before on election day by manager.
    modifier mIsActive(){
        require(isActive);
        _;
    }
}