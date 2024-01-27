contract c72{
  /*
  Returns the current token sale rate and time remaining
  @param _start_time: The start time of the crowdsale
  @param _duration: The duration of the crowdsale
  @param _start_rate: The price of 1 token (10^decimals) in wei at the start of the sale
  @param _end_rate: The price of 1 token (10^decimals) in wei at the end of the sale
  @return current_rate: The price of 1 token (10^decimals) currently
  @return time_remaining: The amount of time remaining in the sale (factors in time till sale starts)
  */
  function getRateAndTimeRemaining(uint _start_time, uint _duration, uint _start_rate, uint _end_rate) internal view
  returns (uint current_rate, uint time_remaining)  {
    // If the sale has not started, return start rate and duration plus time till start
    if (now <= _start_time)
      return (_start_rate, (_duration + _start_time - now));
    uint time_elapsed = now - _start_time;
    // If the sale has ended, return 0 for end rate and time remaining
    if (time_elapsed >= _duration)
      return (0, 0);
    // Crowdsale is still active -
    time_remaining = _duration - time_elapsed;
    // Calculate current rate, adding decimals for precision -
    time_elapsed *= (10 ** 18);
    current_rate = ((_start_rate - _end_rate) * time_elapsed) / _duration;
    current_rate /= (10 ** 18); // Remove additional precision decimals
    current_rate = _start_rate - current_rate;
  }
}