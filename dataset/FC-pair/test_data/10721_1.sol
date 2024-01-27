contract c10721{
  /**
   * @dev Returns the rate of tokens per wei at the present time.
   */
  function getCurrentRate() public view returns (uint256) {
    if (now <= openingTime.add(15 days)) return rate.add(rate);   // PRE-ICO bonus 100% 15 days
    if (now > openingTime.add(15 days) && now <= openingTime.add(18 days)) return rate.add(rate*3/4);   // ICO bonus 75% 1st three days
    if (now > openingTime.add(18 days) && now <= openingTime.add(21 days)) return rate.add(rate*7/10);   // ICO bonus 70% 2nd three days
    if (now > openingTime.add(21 days) && now <= openingTime.add(24 days)) return rate.add(rate*13/20);   // ICO bonus 65% 3rd three days
    if (now > openingTime.add(24 days) && now <= openingTime.add(27 days)) return rate.add(rate*3/5);   // ICO bonus 60% 4th three days
    if (now > openingTime.add(27 days) && now <= openingTime.add(30 days)) return rate.add(rate*11/20);   // ICO bonus 55% 5th three days
    if (now > openingTime.add(30 days) && now <= openingTime.add(33 days)) return rate.add(rate/2);   // ICO bonus 50% 6th three days
    if (now > openingTime.add(33 days) && now <= openingTime.add(36 days)) return rate.add(rate*9/20);   // ICO bonus 45% 7th three days
    if (now > openingTime.add(36 days) && now <= openingTime.add(39 days)) return rate.add(rate*2/5);   // ICO bonus 40% 8th three days
    if (now > openingTime.add(39 days) && now <= openingTime.add(42 days)) return rate.add(rate*7/20);   // ICO bonus 35% 9th three days
    if (now > openingTime.add(42 days)) return rate.add(rate*3/10);   // ICO bonus 30% 10th three days
  }
}