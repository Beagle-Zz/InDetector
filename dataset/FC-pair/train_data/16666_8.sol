contract c16666{
  /**
   * @dev Function to remove an address to the controllers
   * @param _controller         an address that will be removed from managers list
   */
    function removeController(address _controller) onlyOwner external {
        require(isController[_controller]);
        isController[_controller] = false;
        ControllerRemoved(_controller);
    }
}