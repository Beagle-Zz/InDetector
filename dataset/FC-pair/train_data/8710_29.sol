contract c8710{
      /**
     @dev Standar function to kill ICO contract and return ETHs to owner.
    */
    function kill()
    external onlyOwner onlyInState(StatusList.Closed) {
        selfdestruct(owner);
    }
}