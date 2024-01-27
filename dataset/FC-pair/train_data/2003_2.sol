contract c2003{
     // Finish the current spin of a player, if they have one
    function finishSpin() public
        gameIsActive
        returns (uint)
    {
      return _finishSpin(msg.sender);
    }
}