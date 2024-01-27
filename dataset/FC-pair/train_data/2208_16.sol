contract c2208{
  // -----------------------------------------
  // Internal interface (extensible)
  // -----------------------------------------
  function _moveStage()
    internal
  {
    TokenSaleState oldState = state;
    if (state == TokenSaleState.NOT_STARTED) {
      state = TokenSaleState.STAGE_ONE;
    } else if (state == TokenSaleState.STAGE_ONE) {
      state = TokenSaleState.STAGE_TWO;
    } else if (state == TokenSaleState.STAGE_TWO) {
      state = TokenSaleState.STAGE_THREE;
    } else if (state == TokenSaleState.STAGE_THREE) {
      state = TokenSaleState.COMPLETED;
    }
    emit MoveStage(oldState, state);
  }
}