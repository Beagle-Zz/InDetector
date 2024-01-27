contract c10952{
    /**
        @dev used by a new manager to accept a management transfer
    */
    function acceptManagement() public {
        require(msg.sender == newManager);
        emit ManagerUpdate(manager, newManager);
        manager = newManager;
        newManager = address(0);
    }
}