contract c10528{
      /**
       * @dev called by the owner to pause, triggers stopped state
       */
      function pause() onlyOwner whenNotPaused public {
        paused = true;
      }
}