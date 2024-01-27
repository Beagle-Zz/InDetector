contract c10954{
    /**
        @dev allows transferring the contract management
        the new manager still needs to accept the transfer
        can only be called by the contract manager
        @param _newManager    new contract manager
    */
    function transferManagement(address _newManager) public ownerOrManagerOnly {
        require(_newManager != manager);
        newManager = _newManager;
    }
}