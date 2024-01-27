contract c12297{
  // helper function so that UI can check if ICO has started
  function hasStarted()
    external
    view
    returns (bool)
  {
    return block.timestamp >= openingTime;
  }
}