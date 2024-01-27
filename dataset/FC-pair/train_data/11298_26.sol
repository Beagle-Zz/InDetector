contract c11298{
  //constant function returns the current DANS price.
  function getPriceRate()
      constant
      returns (uint o_rate)
  {
      uint delta = SafeMath.sub(now, publicStartTime);
      if (delta > STAGE_TWO_TIME_END) return PRICE_STAGE_THREE;
      if (delta > STAGE_ONE_TIME_END) return PRICE_STAGE_TWO;
      return (PRICE_STAGE_ONE);
  }
}